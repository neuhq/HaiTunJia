#import "UserViewController.h"
#import "WaterFallListCell.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "UserHeaderView.h"
#import "CExpandHeader.h"
#import "UIImageView+WebCache.h"
static NSString *const kUserCollectionCellIndentifer =  @"kUserCollectionCellIndentifer";
static NSString *const kUserHeaderViewIndentifer = @"kUserHeaderViewIndentifer";
@interface UserViewController ()
<UICollectionViewDataSource,
CHTCollectionViewDelegateWaterfallLayout,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong) CExpandHeader *expandHeader;

@property(nonatomic,strong) UICollectionView *userCollectionView;

//模型数组
@property (nonatomic,strong) NSMutableArray *listArray;

//是否上拉加载更多
@property (nonatomic,assign) BOOL isLoadMore;

//用于分页
@property (nonatomic,strong) NSString * lastCommodityId;

@property (nonatomic,strong) UserHeaderView *hearderView;

@end

@implementation UserViewController
#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self.view addSubview:self.userCollectionView];
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
#pragma mark -- UI
- (UICollectionView *)userCollectionView
{
    if (!_userCollectionView)
    {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        layout.headerHeight = 280;
        _userCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth,kScreenHeight - kNavigationBarHeight - CONTENT_TABBAR_HEIGHT) collectionViewLayout:layout];
        _userCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _userCollectionView.dataSource = self;
        _userCollectionView.delegate = self;
        _userCollectionView.backgroundColor = [UIColor whiteColor];

        [_userCollectionView registerClass:[WaterFallListCell class]
                       forCellWithReuseIdentifier:kUserCollectionCellIndentifer];
        [_userCollectionView registerClass:[UserHeaderView  class]
                forSupplementaryViewOfKind:CHTCollectionElementKindSectionHeader
                       withReuseIdentifier:kUserHeaderViewIndentifer];

    }
    return _userCollectionView;
}
-(CExpandHeader *) expandHeader
{
    if (!_expandHeader)
    {
        _expandHeader = [CExpandHeader expandWithScrollView:_userCollectionView expandView: self.hearderView];
    }
    return _expandHeader;
}

#pragma mark -- helper
-(void)viewConfig
{
    self.isNavigationBar = NO;
    [self setTitle:@"海豚小溪"];
    self.leftBarButton.hidden = YES;
    
}

#pragma mark -- delegate
#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    //    if(self.listModel)
    //    {
    ////        return self.listArray.count;
    //        return 30.0f;
    //    }
    //    else
    //        return 0;
    return 30.0f;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    WaterFallListCell *cell =
    (WaterFallListCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kUserCollectionCellIndentifer
                                                                   forIndexPath:indexPath];
    
    return cell;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    if(self.listArray)
//    {
        //        DataModel *model = [self.listArray objectAtIndex:indexPath.item];
        //        return CGSizeMake((kScreenWidth - 30)/2,model.cellHeight);
        return CGSizeMake((kScreenWidth - 30)/2, (kScreenWidth - 30)/2 + 80);
//    }
//    else
//        return CGSizeMake(0, 0);
    //    return [self.cellSizes[indexPath.item % 4] CGSizeValue];
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader])
    {
         self.hearderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                   withReuseIdentifier:kUserHeaderViewIndentifer
                                                                                          forIndexPath:indexPath];
        reusableView = self.hearderView;
    }
    return reusableView;
}


@end
