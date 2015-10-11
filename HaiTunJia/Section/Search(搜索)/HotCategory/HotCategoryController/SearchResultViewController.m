

#import "SearchResultViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HomeListModel.h"
#import "DetailController.h"
#import "WaterFallListCell.h"
#import "SearchWithTagService.h"
#import "SearchWithKeywordService.h"
#import "DetailController.h"
#import "PraiseCommodityService.h"
#import "PraiseResult.h"
static NSString *const WaterFallFlowViewCollectionViewIndentifer =  @"WaterFallFlowViewCollectionViewIndentifer";

@interface SearchResultViewController ()
<UICollectionViewDataSource,
CHTCollectionViewDelegateWaterfallLayout,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) UICollectionView *seachResultCollectionView;

/**首页数据模型*/
@property (nonatomic,strong) HomeListModel *listModel;

//模型数组
@property (nonatomic,strong) NSMutableArray *listArray;

//是否上拉加载更多
@property (nonatomic,assign) BOOL isLoadMore;

//用于分页
@property (nonatomic,strong) NSString * lastCommodityId;

//标签
@property(nonatomic,strong) NSString *tag;

//搜索词
@property(nonatomic,strong) NSString *keyword;

//参数字典
@property(nonatomic,strong) NSDictionary *paramsDic;

@end

@implementation SearchResultViewController

#pragma mark -- life cycle
-(id)initWithIsKeywordSearch:(BOOL) isKeywordSearch withTag:(NSString *) tag withKeyword:(NSString *) keyword
{
    self = [super init];
    if (self)
    {
        self.isKeywordSearch = isKeywordSearch;
        self.tag = tag;
        self.keyword = keyword;
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self viewConfig];
    
    [self initSpace];
    
    //添加列表
    [self.view addSubview:self.seachResultCollectionView];
    
    [self setRefrashControl];
    
    //获取搜索结果数据数据
     if(self.isKeywordSearch == NO)
         [self getSearchResultDataWithTag];
    else
        [self getSearchResultDataWithKeyword];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UI
-(void)viewConfig
{
    self.isNavigationBar = NO;
    [self setTitle:self.keyword];
    self.rightBarButton.hidden = NO;
    self.rightView = @"只看可买";
}
- (UICollectionView *)seachResultCollectionView
{
    if (!_seachResultCollectionView)
    {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _seachResultCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth,kScreenHeight - kNavigationBarHeight) collectionViewLayout:layout];
        _seachResultCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _seachResultCollectionView.dataSource = self;
        _seachResultCollectionView.delegate = self;
        _seachResultCollectionView.backgroundColor = [UIColor whiteColor];
        [_seachResultCollectionView registerClass:[WaterFallListCell class]
                forCellWithReuseIdentifier:WaterFallFlowViewCollectionViewIndentifer];
    }
    return _seachResultCollectionView;
}
#pragma mark -- helper
//上下拉刷新控件
-(void)setRefrashControl
{
    // 下拉刷新
    //TODO:搜索刷新操作
    __weak SearchResultViewController *weakSelf = self;
    self.seachResultCollectionView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        weakSelf.isLoadMore = NO;
        self.lastCommodityId = nil;
        if(self.isKeywordSearch == YES)
            [self getSearchResultDataWithKeyword];
        else
            [self getSearchResultDataWithTag];
        
    }];
    
    // 上拉刷新
    self.seachResultCollectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        weakSelf.isLoadMore = YES;
        if(self.isKeywordSearch == YES)
            [self getSearchResultDataWithKeyword];
        else
            [self getSearchResultDataWithTag];
    }];
}

//结束刷新状态
-(void)endRefrashLoad
{
    [self.seachResultCollectionView.header endRefreshing];
    [self.seachResultCollectionView.footer endRefreshing];
    
}
//初始化空间
-(void)initSpace
{
    self.listArray = [[NSMutableArray alloc]init];
    self.paramsDic = [[NSDictionary alloc]init];
}

#pragma mark -- HTTP
//通过标签tag获取搜索数据
-(void)getSearchResultDataWithTag
{
    //TODO:搜索网络请求
    __weak SearchResultViewController *weakSelf = self;
    SearchWithTagService *search = [[SearchWithTagService alloc]init];
    [search startRequestDataWithParamsBlcok:^{
        search.tag = weakSelf.keyword;
        search.lastCommodityId = weakSelf.lastCommodityId;
    } FinishBlock:^(id result) {
        NSArray *array = result;
        
        if (weakSelf.isLoadMore == YES)
        {
            for(ListModel * model in array)
            {
                [weakSelf.listArray addObject:model];
            }
            ListModel *model = weakSelf.listArray.lastObject;
            weakSelf.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
        }
        else
        {
            [weakSelf.listArray removeAllObjects];
            for(ListModel * model in array)
            {
                [weakSelf.listArray addObject:model];
            }
            ListModel *model = weakSelf.listArray.lastObject;
            self.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
            
        }
        [weakSelf.seachResultCollectionView reloadData];
        [weakSelf endRefrashLoad];

    } failureBlock:^(NSError *error) {
        [weakSelf endRefrashLoad];

    }];
}
//根据搜索关键字获取搜索数据
-(void)getSearchResultDataWithKeyword
{
    //TODO:搜索网络请求
    __weak SearchResultViewController *weakSelf = self;
    SearchWithKeywordService *service = [[SearchWithKeywordService alloc]init];
     [service startRequestDataWithParamsDic:^{
         service.search = weakSelf.keyword;
         service.lastCommodityId = self.lastCommodityId;
     } FinishBlock:^(id object) {
         NSArray *array = object;
         
         if (self.isLoadMore == YES)
         {
            for(ListModel * model in array)
            {
                [self.listArray addObject:model];
            }
             ListModel *model = self.listArray.lastObject;
             self.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
         }
         else
         {
             [self.listArray removeAllObjects];
             for(ListModel * model in array)
             {
                 [self.listArray addObject:model];
             }
             ListModel *model = self.listArray.lastObject;
             self.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];

         }
         [self.seachResultCollectionView reloadData];
         [self endRefrashLoad];
     } failureBlock:^(NSError *error) {
         [self endRefrashLoad];
     }];
}

#pragma mark -- Delegate

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.listArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WaterFallListCell *cell =
    (WaterFallListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:WaterFallFlowViewCollectionViewIndentifer forIndexPath:indexPath];
    NSLog(@"%ld",indexPath.item);
    if(self.listArray.count)
    {
        [cell setListData:self.listArray[indexPath.item]];
        cell.zanImageButton.tag = indexPath.item;
        cell.bottomLeftView.tag = indexPath.item;
        [cell.bottomLeftView addTarget:self action:@selector(jumpDetail:) forControlEvents:UIControlEventTouchUpInside];
        [cell.zanImageButton addTarget:self action:@selector(praiseAction:) forControlEvents:UIControlEventTouchUpInside];
    }
        return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.listArray)
    {
        ListModel *model = [self.listArray objectAtIndex:indexPath.item];
        return model.cellSize;
    }
    else
        return CGSizeMake(0, 0);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ListModel *model = [self.listArray objectAtIndex:indexPath.item];
    DetailController *detail = [[DetailController alloc]initWithId:[NSString stringWithFormat:@"%ld",model.iD]];
    [self.navigationController pushViewController:detail animated:YES];
}
#pragma mark -- Action
-(void)praiseAction:(UIButton *) sender
{
    ListModel *model = self.listArray[sender.tag];
    [PraiseResult praiseRequestWithId:model.iD withIndex:sender.tag withCollectionView:self.seachResultCollectionView withListArra:self.listArray];
}
-(void)jumpDetail:(UIButton *) sender
{
    ListModel *dataModel = [self.listArray objectAtIndex:sender.tag];
    DetailController *detail = [[DetailController alloc]initWithId:[NSString stringWithFormat:@"%ld",dataModel.iD]];
    [self.navigationController pushViewController:detail animated:YES];
}
@end
