

#import "CommodityTagViewController.h"
#import "CustomSearchBar.h"
#import "CommdityTagViewCell.h"
#import "PublishModel.h"

@interface CommodityTagViewController ()
<CustomeSearchBarDelegate,
UITableViewDelegate,
UITableViewDataSource,
UITextFieldDelegate>


@property(nonatomic,strong) CustomSearchBar *searchBar;

@property(nonatomic,strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *firstArray;

@property(nonatomic,strong) NSArray *secondArray;

@property(nonatomic,strong) UITextField *brand;

@property(nonatomic,strong) UITextField *commdityName;

@property(nonatomic,strong) UITextField *price;

@property(nonatomic,strong) UITextField *currency;

@property(nonatomic,strong) UITextField *type;

@property(nonatomic,strong) UITextField *address;



@end

@implementation CommodityTagViewController

#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initArray];
    self.leftBarButton.hidden = YES;
//    [self.customNavigationBar addSubview:self.searchBar];
    [self setTitle:@"添加标签"];
    self.rightBarButton.hidden = NO;
    self.rightView = @"完成";
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
        _searchBar = [[CustomSearchBar alloc]initWithFrame:CGRectMake(10.0f, kNavigationBarHeight - 10 - 30, kScreenWidth - 2*25.0f, 30.0f)];
        _searchBar.delegate = self;
        _searchBar.backgroundColor = [UIColor clearColor];
    }
    return _searchBar;
}

-(UITableView *)tableView
{
    if (!_tableView)
    {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle =  UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor colorWithHexString:@"000000"];
    }
    return _tableView;
}
#pragma mark -- helper
-(void)initArray
{
    self.firstArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"label_biaoqian"],[UIImage imageNamed:@"label_bizhong"],[UIImage imageNamed:@"label_diqu"],[UIImage imageNamed:@"label_fenlei"], nil];
}

#pragma mark -- Delegate
-(void)getSearchKeyword:(NSString *)keyword
{
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0 || indexPath.row == 1)
    {
        static NSString *indentifer1 = @"indentifer1";
        CommdityTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer1];
        if (cell == nil)
        {
            cell = [[CommdityTagViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer1 row:indexPath.row];
        }
        [cell reloadFirstImage:self.firstArray[indexPath.row] row:indexPath.row];
        if(indexPath.row == 0)
        {
            self.brand = cell.leftTextField;
            self.brand.delegate = self;
            self.commdityName = cell.rightTextField;
            self.commdityName.delegate = self;
        }
        else
        {
            self.currency = cell.leftTextField;
            self.currency.delegate = self;
            self.price = cell.rightTextField;
            self.price.delegate = self;
        }
        return cell;
    }
    else
    {
        static NSString *indentifer2 = @"indentifer2";
        CommdityTagViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer2];
        if (cell == nil)
        {
            cell = [[CommdityTagViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer2 row:indexPath.row];
        }
        [cell reloadSecondImage:self.firstArray[indexPath.row] row:indexPath.row];
        if(indexPath.row == 2)
        {
            self.type = cell.oneTextField;
            self.type.delegate = self;
        }
        else
        {
            self.address = cell.oneTextField;
            self.address.delegate = self;
        }
        return cell;

    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 32.0f;
}
-(void)rightButtonAction
{
    PublishModel *model = [PublishModel sharedManager];
    model.moneyType = self.currency.text;
    model.name = self.commdityName.text;
    model.price = self.price.text;
    model.source = self.address.text;
    AddTagEndBlock block = self.endBlock;
    if (block)
    {
        block(model);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
