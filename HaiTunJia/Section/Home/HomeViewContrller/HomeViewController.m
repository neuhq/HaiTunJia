
#import "HomeViewController.h"
#import "CHTCollectionViewWaterfallLayout.h"
#import "HomeCollectionViewCell.h"
#import "HomeCollectionHeaderView.h"

//collectionViewCell标识
static NSString *const HomeViewCollectionViewIndentifer =  @"HomeViewCollectionViewIndentifer";

//header标识
static NSString *const HomeViewHeaderViewIndentifer =  @"HomeViewHeaderViewIndentifer";

@interface HomeViewController ()

<UICollectionViewDataSource,
CHTCollectionViewDelegateWaterfallLayout>

@property(nonatomic,strong) UICollectionView *homeCollectionView;

@end

@implementation HomeViewController

#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -- UI
- (UICollectionView *)collectionView {
    if (!_homeCollectionView) {
        CHTCollectionViewWaterfallLayout *layout = [[CHTCollectionViewWaterfallLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        layout.headerHeight = 15;
        layout.footerHeight = 10;
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


#pragma mark -- helper

#pragma mark -- Delegate


#pragma mark -- Action


@end
