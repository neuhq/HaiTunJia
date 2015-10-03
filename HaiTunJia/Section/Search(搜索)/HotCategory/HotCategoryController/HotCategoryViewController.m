#import "HotCategoryViewController.h"
#import "CustomSearchBar.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HotCategoryViewCell.h"
#import "HotCategoryHeaderView.h"
#import "SearchResultViewController.h"
static NSString *kHotCategoryCollectionIndentifer = @"kHotCategoryCollectionIndentifer";
static NSString *kHotCategoryHederViewIndentifer  = @"kHotCategoryHederViewIndentifer";
@interface HotCategoryViewController ()
<CustomeSearchBarDelegate,
CHTCollectionViewDelegateWaterfallLayout,
UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource>

@property(nonatomic,strong) CustomSearchBar *searchBar;

@property(nonatomic,strong) UICollectionView *hotCategoryCollectionView;

@property(nonatomic,strong) NSMutableArray *imageArray;

@property(nonatomic,strong) NSMutableArray *titleArray;

//搜索关键字
@property(nonatomic,strong) NSString *keyword;

@end

@implementation HotCategoryViewController


#pragma mark -- life cycle 
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initArray];
    [self.customNavigationBar addSubview:self.searchBar];
    self.leftBarButton.hidden = YES;
    [self.view addSubview:self.hotCategoryCollectionView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self hideTabbar:NO];
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self hideTabbar:YES];

    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark  -- UI
-(CustomSearchBar *) searchBar
{
    if (!_searchBar)
    {
        _searchBar = [[CustomSearchBar alloc]initWithFrame:CGRectMake(25.0f, kNavigationBarHeight - 10 - 30, kScreenWidth - 2*25.0f, 30.0f)];
        _searchBar.delegate = self;
        _searchBar.backgroundColor = [UIColor clearColor];
    }
    return _searchBar;
}
-(UICollectionView *) hotCategoryCollectionView
{
    if(!_hotCategoryCollectionView)
    {
        // UICollectionViewFlowLayout的初始化（与刷新控件无关）
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
        layout.minimumInteritemSpacing = 20;
        layout.minimumLineSpacing = 20;
        [layout setHeaderReferenceSize:CGSizeMake(kScreenWidth, 20)];
        _hotCategoryCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth,kScreenHeight - kNavigationBarHeight ) collectionViewLayout:layout];
        _hotCategoryCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _hotCategoryCollectionView.dataSource = self;
        _hotCategoryCollectionView.delegate = self;
        _hotCategoryCollectionView.alwaysBounceVertical = YES;
        _hotCategoryCollectionView.backgroundColor = [UIColor whiteColor];
        [_hotCategoryCollectionView registerClass:[HotCategoryViewCell class]
                forCellWithReuseIdentifier:kHotCategoryCollectionIndentifer];
        [_hotCategoryCollectionView registerClass:[HotCategoryHeaderView  class]
                forSupplementaryViewOfKind:UICollectionElementKindSectionHeader
                       withReuseIdentifier:kHotCategoryHederViewIndentifer];
        }
    return _hotCategoryCollectionView;
}
#pragma mark -- helper
-(void)initArray
{
    self.imageArray = [[NSMutableArray alloc]init];
    self.titleArray = [[NSMutableArray alloc]init];
    self.imageArray = [NSMutableArray arrayWithObjects:[UIImage imageNamed:@"classfy_hufu"],
                                                                             [UIImage imageNamed:@"classfy_baobao"],
                                                                             [UIImage imageNamed:@"classfy_caizhuang"],
                                                                              [UIImage imageNamed:@"classfy_peishi"],
                                                                              [UIImage imageNamed:@"classfy_xiezi"],
                                                                              [UIImage imageNamed:@"classfy_jiangzhuang"],
                                                                              [UIImage imageNamed:@"classfy_fuzhuang"],
                                                                              [UIImage imageNamed:@"classfy_shipin"],
                                                                              [UIImage imageNamed:@"classfy_shuma"],
                                                                              [UIImage imageNamed:@"classfy_muying"],
                                                                              [UIImage imageNamed:@"classfy_nanren"],
                                                                              [UIImage imageNamed:@"classfy_qita"],nil];
      self.titleArray = [NSMutableArray arrayWithObjects:@"护肤",@"包包",@"彩妆",@"配饰",@"鞋子",@"家居",@"服装",@"饰品",@"数码",@"母婴",@"男人",@"其他", nil];
}

#pragma mark  --- Delegate
//CustomeSearchBarDelegate
-(void)getSearchKeyword:(NSString *)keyword
{
    self.keyword = keyword;
    [self jumpSearchPage:YES];
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HotCategoryViewCell *cell =
    (HotCategoryViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kHotCategoryCollectionIndentifer
                                                                        forIndexPath:indexPath];
    cell.categoryButton.backgroundColor = [UIColor redColor];
    [cell.categoryButton setBackgroundImage:self.imageArray[indexPath.row] forState:UIControlStateNormal];
    [cell.categoryButton setTitle:self.titleArray[indexPath.row] forState:UIControlStateNormal];
    cell.categoryButton.tag = indexPath.row;
    [cell.categoryButton addTarget:self action:@selector(tapItem:) forControlEvents:UIControlEventTouchUpInside];
    return cell;
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader)
    {
        HotCategoryHeaderView *hearderView = [collectionView dequeueReusableSupplementaryViewOfKind:kind
                                                                                   withReuseIdentifier:kHotCategoryHederViewIndentifer
                                                                                          forIndexPath:indexPath];
        reusableview = hearderView;
    }
    return reusableview;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float width = (kScreenWidth - 5*20.0f)/4;
    CGSize size = CGSizeMake(width, width);
    return size;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self jumpSearchPage:NO];
}

#pragma mark -- Action
-(void)tapItem:(UIButton *) sender
{
    [self jumpSearchPage:NO];
}
//跳转搜索结果
-(void)jumpSearchPage:(BOOL) isKeywordSearch
{
    SearchResultViewController *searchResultVC = [[SearchResultViewController alloc]initWithIsKeywordSearch:isKeywordSearch withTag:@"10" withKeyword:self.keyword];
    [self.navigationController pushViewController:searchResultVC animated:YES];
}
@end
