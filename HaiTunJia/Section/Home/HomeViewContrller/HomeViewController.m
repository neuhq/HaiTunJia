
#import "HomeViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionHeaderView.h"
#import "HomeService.h"
#import "HomeListModel.h"
//collectionViewCell标识
static NSString *const HomeViewCollectionViewIndentifer =  @"HomeViewCollectionViewIndentifer";

//header标识
static NSString *const HomeViewHeaderViewIndentifer =  @"HomeViewHeaderViewIndentifer";

@interface HomeViewController ()

<UICollectionViewDataSource,
CHTCollectionViewDelegateWaterfallLayout>

@property(nonatomic,strong) UICollectionView *homeCollectionView;

/**首页数据模型*/
@property (nonatomic,strong) HomeListModel *listModel;

@property(nonatomic,strong) NSArray *cellSizes;

@property(nonatomic,strong) NSArray *cats;

@end

@implementation HomeViewController

#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //导航栏隐藏
    self.navigationController.navigationBar.hidden = YES;
    
    //获取首页商品数据
    [self getHomeListData];
    
    //添加列表
    [self.view addSubview:self.homeCollectionView];
    
   
    
   
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
        layout.headerHeight = 100;
        layout.minimumColumnSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _homeCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
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
        self.listModel = (HomeListModel *) result;
        [weakSelf.homeCollectionView reloadData];
    }];
}
#pragma mark -- helper
- (NSArray *)cellSizes
{
    if (!_cellSizes) {
        UIImage *image = [UIImage imageNamed:@"test"];
        _cellSizes = @[
                       [NSValue valueWithCGSize:CGSizeMake(image.size.width, image.size.height+70)],
                       [NSValue valueWithCGSize:CGSizeMake(image.size.width,image.size.height+70)],
                       [NSValue valueWithCGSize:CGSizeMake(image.size.width, image.size.height+70)],
                       [NSValue valueWithCGSize:CGSizeMake(image.size.width, image.size.height+70)],
                       ];
    }
    return _cellSizes;
}

- (NSArray *)cats
{
    if (!_cats) {
        _cats = @[@"cat1.jpg", @"cat2.jpg", @"cat3.jpg", @"cat4.jpg"];
    }
    return _cats;
}

#pragma mark -- Delegate

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if(self.listModel)
    {
        return self.listModel.data.count;
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
    DataModel *model = [self.listModel.data objectAtIndex:indexPath.item];
    cell.dataModel = model;
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *reusableView = nil;
    
    if ([kind isEqualToString:CHTCollectionElementKindSectionHeader])
    {
        reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                          withReuseIdentifier:HomeViewHeaderViewIndentifer
                                                                forIndexPath:indexPath];
    }
    return reusableView;
}

#pragma mark - CHTCollectionViewDelegateWaterfallLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(self.listModel)
    {
        DataModel *model = [self.listModel.data objectAtIndex:indexPath.item];
        return CGSizeMake(collectionView.width, model.cellHeight);
    }
    else
        return CGSizeMake(0, 0);
    return [self.cellSizes[indexPath.item % 4] CGSizeValue];
}


#pragma mark -- Action


@end
