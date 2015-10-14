
#import "HomeViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionHeaderView.h"
#import "HomeService.h"
#import "HomeListModel.h"
#import "DetailController.h"
#import "LoginViewController.h"
#import "PraiseCommodityService.h"
#import "RegisterViewController.h"
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

//用于分页
@property (nonatomic,strong) NSString * lastCommodityId;

@end

@implementation HomeViewController

#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initArray];
    
    //导航栏隐藏
    self.isNavigationBar = YES;
    
    //添加列表
    [self.view addSubview:self.homeCollectionView];
    
    [self setRefrashControl];
}

-(void)viewWillAppear:(BOOL)animated
{
    self.hidesBottomBarWhenPushed = YES;
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self hideTabbar:NO];
    if(self.isLoadView)
        //获取首页商品数据
        [self getHomeListData];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self hideTabbar:YES];
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillDisappear:animated];
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
        _homeCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth,kScreenHeight - CONTENT_TABBAR_HEIGHT ) collectionViewLayout:layout];
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
    [homeService startRequestHomeListDataWithLastCommodityId:self.lastCommodityId withBlock:^(id result) {
        weakSelf.listModel = (HomeListModel *) result;
        if(weakSelf.isLoadMore == YES)
        {
            for (NSInteger i = 0; i < weakSelf.listModel.data.count; i++)
            {
                DataModel *model = [weakSelf.listModel.data objectAtIndex:i];
                [self.listArray addObject:model];
            }
            DataModel *model = self.listArray.lastObject;
            weakSelf.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
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
            weakSelf.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
        }
        [self endRefrashLoad];
        [weakSelf.homeCollectionView reloadData];

    } withFailureBlock:^(NSError *error) {
        [self endRefrashLoad];

    }];
}
-(void)praiseRequestWithId:(NSInteger) iD withIndex:(NSInteger) index
{
    PraiseCommodityService *service = [[PraiseCommodityService alloc]init];
    [service startRquestPraiseCommodity:^{
        service.commodityId = [NSString stringWithFormat:@"%ld",iD];
    } praiseRespons:^(id obj) {
        NSDictionary *dic = obj;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        HomeCollectionViewCell *cell = (HomeCollectionViewCell *)[self.homeCollectionView cellForItemAtIndexPath:indexPath];
        DataModel *dataModel = self.listArray[index];
        if([dic[@"code"] integerValue] == 0)
        {
            [cell.zanImageButton setBackgroundImage:[UIImage imageNamed:@"icon_love_active"] forState:UIControlStateNormal];
            cell.zanNum.text = [NSString stringWithFormat:@"%ld",dataModel.likeNum +1];
            dataModel.likeNum++;
            dataModel.isPraised = 1;
        }
        else
        {
            [cell.zanImageButton setBackgroundImage:[UIImage imageNamed:@"icon_love_normal"] forState:UIControlStateNormal];
            cell.zanNum.text = [NSString stringWithFormat:@"%ld",dataModel.likeNum - 1];
            dataModel.likeNum--;
            dataModel.isPraised = 0;
        }
        [cell upDateLayout:cell];
    } failed:^(NSError *error) {
        
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
        self.lastCommodityId = @"";
        [weakSelf getHomeListData];
    }];
    
    // 上拉刷新
    self.homeCollectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        weakSelf.isLoadMore = YES;
        [weakSelf getHomeListData];
    }];
}

//结束刷新状态
-(void)endRefrashLoad
{
    [self.homeCollectionView.header endRefreshing];
    [self.homeCollectionView.footer endRefreshing];

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
    if(!self.listArray)
        return nil;
    
    DataModel *model = [self.listArray objectAtIndex:indexPath.item];
    [cell setCellData:model];
    cell.zanImageButton.tag = indexPath.item;
    cell.bottomRightView.tag = indexPath.item;
    cell.bottomLeftView.tag = indexPath.item;

    [cell.zanImageButton addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.bottomRightView addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
    [cell.bottomLeftView addTarget:self action:@selector(seeComment:) forControlEvents:UIControlEventTouchUpInside];
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
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(!self.listArray)
        return;
//    RegisterViewController *registerVC = [[RegisterViewController alloc]init];
//    [self.navigationController pushViewController:registerVC animated:YES];
    
    DataModel *dataModel = [self.listArray objectAtIndex:indexPath.item];
    DetailController *detail = [[DetailController alloc]initWithId:[NSString stringWithFormat:@"%ld",dataModel.iD]];
    [self.navigationController pushViewController:detail animated:YES];
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.listArray.count != 0 && self.listArray != nil)
    {
        DataModel *model = [self.listArray objectAtIndex:indexPath.item];
        return model.cellSize;
    }
    else
        return CGSizeMake(0, 0);
}


#pragma mark -- Action
-(void)praiseAction:(UIButton *) sender
{
    DataModel *model = self.listArray[sender.tag];
    [self praiseRequestWithId:model.iD withIndex:sender.tag];
}
-(void)seeComment:(UIButton *) sender
{
    DataModel *dataModel = [self.listArray objectAtIndex:sender.tag];
    DetailController *detail = [[DetailController alloc]initWithId:[NSString stringWithFormat:@"%ld",dataModel.iD]];
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark -- Jump
//跳转商品详情
-(void)jumpDetail
{
        DetailController *detail = [[DetailController alloc]init];
        [self.navigationController pushViewController:detail animated:YES];
}

@end
