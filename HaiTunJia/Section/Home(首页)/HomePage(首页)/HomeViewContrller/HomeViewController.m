
#import "HomeViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionHeaderView.h"
#import "HomeService.h"
#import "HomeListModel.h"
#import "TLCollectionWaterFallFlow.h"
//collectionViewCell标识
static NSString *const HomeViewCollectionViewIndentifer =  @"HomeViewCollectionViewIndentifer";

//header标识
static NSString *const HomeViewHeaderViewIndentifer =  @"HomeViewHeaderViewIndentifer";

@interface HomeViewController ()

<UICollectionViewDataSource,
CHTCollectionViewDelegateWaterfallLayout,
 UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *homeCollectionView;

/**首页数据模型*/
@property (nonatomic,strong) HomeListModel *listModel;

//模型数组
@property (nonatomic,strong) NSMutableArray *listArray;

//是否上拉加载更多
@property (nonatomic,assign) BOOL isLoadMore;

@property (nonatomic, strong) TLCollectionWaterFallFlow *layout;

@end

@implementation HomeViewController

#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initArray];
    
    //导航栏隐藏
    self.navigationController.navigationBar.hidden = YES;
    //获取首页商品数据
    [self getHomeListData];
    
    //添加列表
    [self.view addSubview:self.homeCollectionView];
    
    [self setRefrashControl];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UI
- (UICollectionView *)homeCollectionView
{
    if (!_homeCollectionView)
    {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(0, 10, 10, 10);
        layout.headerHeight = 230;
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, -PHONE_STATUSBAR_HEIGHT, kScreenWidth, kScreenHeight - CONTENT_TABBAR_HEIGHT + 40.0f) collectionViewLayout:layout];
        _homeCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _homeCollectionView.dataSource = self;
        _homeCollectionView.delegate = self;
        _homeCollectionView.backgroundColor = [UIColor whiteColor];
        [_homeCollectionView registerClass:[HomeCollectionViewCell class]
            forCellWithReuseIdentifier:HomeViewCollectionViewIndentifer];
        [_homeCollectionView registerClass:[HomeCollectionHeaderView  class]
            forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                   withReuseIdentifier:HomeViewHeaderViewIndentifer];
    }
    return _homeCollectionView;
}

#pragma mark -- HTTP
-(void)getHomeListData
{
    __weak HomeViewController *weakSelf = self;
    HomeService *homeService = [[HomeService alloc]init];
    [homeService startRequestHomeListDataWithBlock:^(id result) {
        weakSelf.listModel = (HomeListModel *) result;
        if(weakSelf.isLoadMore == YES)
        {
            for (NSInteger i = 0; i < weakSelf.listModel.data.count; i++)
            {
                DataModel *model = [weakSelf.listModel.data objectAtIndex:i];
                [self.listArray addObject:model];
            }
            DataModel *model = self.listArray.lastObject;
            homeService.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
        }
        else
        {
            [weakSelf.listArray removeAllObjects];
            for (NSInteger i = 0; i < weakSelf.listModel.data.count; i++)
            {
                DataModel *model = [weakSelf.listModel.data objectAtIndex:i];
                [self.listArray addObject:model];
            }
            DataModel *model = self.listArray.lastObject;
            homeService.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
        }
        [weakSelf.homeCollectionView.header endRefreshing];
        [weakSelf.homeCollectionView.footer endRefreshing];
        [weakSelf.homeCollectionView reloadData];

    } withFailureBlock:^(NSError *error) {
        [weakSelf.homeCollectionView.header endRefreshing];
        [weakSelf.homeCollectionView.footer endRefreshing];
    }];
}
#pragma mark -- helper
//上下拉刷新控件
-(void)setRefrashControl
{
    // 下拉刷新
    __weak HomeViewController *weakSelf = self;
    self.homeCollectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        weakSelf.isLoadMore = NO;
        [weakSelf getHomeListData];
    }];
    
    // 上拉刷新
    self.homeCollectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        weakSelf.isLoadMore = YES;
        [weakSelf getHomeListData];
    }];
}

//初始化有用数组
-(void)initArray
{
    self.listArray = [[NSMutableArray alloc]init];
}
#pragma mark -- Delegate

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.listModel)
    {
        return self.listArray.count;
    }
    else
        return 0;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HomeCollectionViewCell *cell =
    (HomeCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:HomeViewCollectionViewIndentifer
                                                                                forIndexPath:indexPath];
    DataModel *model = [self.listArray objectAtIndex:indexPath.item];
    cell.dataModel = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader])
    {
        HomeCollectionHeaderView *hearderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:HomeViewHeaderViewIndentifer
                                                                forIndexPath:indexPath];
        [hearderView setImage];
        reusableView = hearderView;
    }
    return reusableView;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.listArray)
    {
        DataModel *model = [self.listArray objectAtIndex:indexPath.item];
        return CGSizeMake((kScreenWidth - 30)/2,model.cellHeight);
    }
    else
        return CGSizeMake(0, 0);
//    return [self.cellSizes[indexPath.item % 4] CGSizeValue];
}


#pragma mark -- Action


@end
