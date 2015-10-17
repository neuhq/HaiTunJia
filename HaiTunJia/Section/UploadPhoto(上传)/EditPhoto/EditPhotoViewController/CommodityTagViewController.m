

#import "CommodityTagViewController.h"
#import "CustomSearchBar.h"

@interface CommodityTagViewController ()
<CustomeSearchBarDelegate>

@property(nonatomic,strong) CustomSearchBar *searchBar;

@property(nonatomic,strong) UITableView *tableView;

@end

@implementation CommodityTagViewController

#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.leftBarButton.hidden = YES;
    [self.view addSubview:self.tableView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

@end
