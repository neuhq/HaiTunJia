

#import "OtherUserViewController.h"
#import "WaterFallListCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "UserHeaderView.h"
#import "UIImageView+WebCache.h"
#import "UserCollectService.h"
#import "UserNoteListService.h"
#import "PraiseResult.h"
#import "DetailController.h"
#import "OtherUserInfoService.h"
#import "UserModel.h"
#import "OtherUserCollectService.h"
#import "OtherUserNoteListService.h"
#import "OtherUserHeaderVIew.h"

static NSString *const kUserCollectionCellIndentifer =  @"kUserCollectionCellIndentifer";
static NSString *const kUserHeaderViewIndentifer = @"kUserHeaderViewIndentifer";

@interface OtherUserViewController ()
<UICollectionViewDataSource,
CHTCollectionViewDelegateWaterfallLayout,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
OtherUserHeaderVIewDelegate>

@property(nonatomic,strong) UICollectionView *userCollectionView;

//模型数组
@property (nonatomic,strong) NSMutableArray *listArray;

//是否上拉加载更多
@property (nonatomic,assign) BOOL isLoadMore;

//用于分页
@property (nonatomic,strong) NSString * lastCommodityId;

@property (nonatomic,strong) OtherUserHeaderVIew *hearderView;

@property (nonatomic,assign) NSInteger tabAtIndex;

@property (nonatomic,strong) UserModel *userModel;

@property (nonatomic,strong) UIImageView *bigImageView;

@end

@implementation OtherUserViewController
#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initArray];
    [self viewConfig];
//    [self.view addSubview:self.bigImageView];
    [self.view addSubview:self.userCollectionView];
    [self setRefrashControl];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer])
    {
        if (self.isLoadView)
        {
            [self getOtherUserInfo];
            [self selectTabAtIndex:0];
        }

    }
    else
    {
        __weak OtherUserViewController *this = self;
        LoginViewController *login = [[LoginViewController alloc]init];
        login.endBlock = ^{
            [this getOtherUserInfo];
            [this selectTabAtIndex:0];
        };
    }
        [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
#pragma mark -- UI
- (UICollectionView *)userCollectionView
{
    if (!_userCollectionView)
    {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.headerHeight = [OtherUserHeaderVIew getHeaderHeight];
        _userCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth,kScreenHeight - kNavigationBarHeight ) collectionViewLayout:layout];
        _userCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _userCollectionView.dataSource = self;
        _userCollectionView.delegate = self;
        _userCollectionView.backgroundColor = [UIColor whiteColor];
        
        [_userCollectionView registerClass:[WaterFallListCell class]
                forCellWithReuseIdentifier:kUserCollectionCellIndentifer];
        [_userCollectionView registerClass:[OtherUserHeaderVIew  class]
                forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                       withReuseIdentifier:kUserHeaderViewIndentifer];
        
    }
    return _userCollectionView;
}
-(UIImageView *) bigImageView
{
    if (!_bigImageView)
    {
        _bigImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
        _bigImageView.backgroundColor = [UIColor redColor];
    }
    return _bigImageView;
}
#pragma mark -- helper
-(void)viewConfig
{
    self.isNavigationBar = NO;
}
-(void)initArray
{
    self.listArray = [[NSMutableArray alloc]init];
}
//上下拉刷新控件
-(void)setRefrashControl
{
    // 下拉刷新
    // 上拉刷新
    __weak OtherUserViewController *weakSelf = self;
    self.userCollectionView.footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        // 进入刷新状态后会自动调用这个block
        weakSelf.isLoadMore = YES;
        if(self.tabAtIndex == 0)
            [self getNoteListData];
        else
            [self getUserCollectList];
    }];
}

//结束刷新状态
-(void)endRefrashLoad
{
    [self.userCollectionView.header endRefreshing];
    [self.userCollectionView.footer endRefreshing];
    
}

#pragma mark -- HTTP
-(void)getOtherUserInfo
{
    OtherUserInfoService *service = [[OtherUserInfoService alloc]init];
    [service starRequestUserInfo:^{
        service.commodityId = self.commodityId;
    } respons:^(id object) {
        UserModel *userModel = object;
        self.userModel = userModel;
        [self setTitle:userModel.data.nick];
        [self.hearderView reloadUserInfo:self.userModel];
    } failed:^(NSError *error) {
        
    }];
}
-(void)getUserCollectList
{
    UserCollectService *service = [[UserCollectService alloc]init];
    [service startRequestUserCollectWithParams:^{
        service.userId = kUSERID;
        service.lastCommodityId = self.lastCommodityId;
    } withResponsDataWithUserColletInfo:^(id object) {
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
        [self.userCollectionView reloadData];
        [self endRefrashLoad];
    } withFailed:^(NSError *error) {
        [self endRefrashLoad];
    }];
    
}
-(void)getNoteListData
{
    __weak OtherUserViewController *weakSelf = self;
    OtherUserNoteListService *service = [[OtherUserNoteListService alloc]init];
    [service startRequestUserNoteListWithParams:^{
        service.lastCommodityId = weakSelf.lastCommodityId;
        service.commodityId = self.commodityId;
    } responsDataWithResult:^(id object) {
        NSArray *array = object;
        
        if (weakSelf.isLoadMore == YES)
        {
            for(ListModel * model in array)
            {
                [weakSelf.listArray addObject:model];
            }
            ListModel *model = weakSelf.listArray.lastObject;
            self.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
        }
        else
        {
            [weakSelf.listArray removeAllObjects];
            for(ListModel * model in array)
            {
                [weakSelf.listArray addObject:model];
            }
            ListModel *model = weakSelf.listArray.lastObject;
            weakSelf.lastCommodityId = [NSString stringWithFormat:@"%ld",model.iD];
            
        }
        [weakSelf.userCollectionView reloadData];
        [weakSelf endRefrashLoad];
        
    } failedWithResult:^(NSError *error) {
        [self endRefrashLoad];
        
    }];
}
#pragma mark -- delegate
-(void)selectTabAtIndex:(NSInteger)index
{
    self.tabAtIndex = index;
    self.lastCommodityId = nil;
    self.isLoadMore = NO;
    if (index == 0)
    {
        [self getNoteListData];
    }
    else
    {
        [self getUserCollectList];
    }
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.listArray)
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
    WaterFallListCell *cell =
    (WaterFallListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kUserCollectionCellIndentifer
                                                                   forIndexPath:indexPath];
    if (self.listArray.count)
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
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader])
    {
        self.hearderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                              withReuseIdentifier:kUserHeaderViewIndentifer
                                                                     forIndexPath:indexPath];
        self.hearderView.delegate = self;
        reusableView = self.hearderView;
    }
    return reusableView;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ListModel *dataModel = [self.listArray objectAtIndex:indexPath.row];
    DetailController *detail = [[DetailController alloc]initWithId:[NSString stringWithFormat:@"%ld",dataModel.iD]];
    [self.navigationController pushViewController:detail animated:YES];
    
}
#pragma mark -- Action
-(void)rightButtonAction
{
    
}
-(void)praiseAction:(UIButton *) sender
{
    ListModel *model = self.listArray[sender.tag];
    [PraiseResult praiseRequestWithId:model.iD withIndex:sender.tag withCollectionView:self.userCollectionView withListArra:self.listArray];
}

-(void)jumpDetail:(UIButton *) sender
{
    ListModel *dataModel = [self.listArray objectAtIndex:sender.tag];
    DetailController *detail = [[DetailController alloc]initWithId:[NSString stringWithFormat:@"%ld",dataModel.iD]];
    [self.navigationController pushViewController:detail animated:YES];
}

@end
