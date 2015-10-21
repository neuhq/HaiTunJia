

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

@property(nonatomic,strong) UIButton *deleteFooterButton;

@property(nonatomic,strong) UIView *footerView;

//@property(nonatomic,strong)


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
-(void)viewDidAppear:(BOOL)animated
{
    if(self.isEdit == YES)
        _tableView.tableFooterView = self.footerView;
    [super viewDidAppear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  -- UI
-(UIView *)footerView
{
    if (!_footerView)
    {
        _footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 50.0f)];
        _footerView.backgroundColor = [UIColor clearColor];
        [_footerView addSubview:self.deleteFooterButton];
    }
    return _footerView;
}
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
-(UIButton *) deleteFooterButton
{
    if (!_deleteFooterButton)
    {
        _deleteFooterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _deleteFooterButton.frame = CGRectMake((self.footerView.width - 80)*0.5f, 0, 80, self.footerView.height);
        _deleteFooterButton.backgroundColor = [UIColor clearColor];
        _deleteFooterButton.layer.masksToBounds = YES;
        _deleteFooterButton.layer.cornerRadius = 20.0f;
        _deleteFooterButton.layer.borderColor = [[UIColor whiteColor] CGColor];
        _deleteFooterButton.layer.borderWidth = 0.5f;
        [_deleteFooterButton setTitle:@"删除" forState:UIControlStateNormal];
        [_deleteFooterButton setTitle:@"删除" forState:UIControlStateHighlighted];
        [_deleteFooterButton setBackgroundImage:[UIImage createImageWithColor:[UIColor clearColor] rect:_deleteFooterButton.bounds] forState:UIControlStateNormal];
        [_deleteFooterButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#ffffff" withAlpha:0.8f] rect:_deleteFooterButton.bounds] forState:UIControlStateHighlighted];
        [_deleteFooterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_deleteFooterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _deleteFooterButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_deleteFooterButton addTarget:self action:@selector(deleteAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _deleteFooterButton;
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
    PublishModel *model = [[PublishModel alloc]init];
    model.moneyType = self.currency.text;
    model.name = self.commdityName.text;
    model.price = self.price.text;
    model.source = self.address.text;
    AddTagEndBlock block = self.endBlock;
    if (block)
    {
        block(model,self.isEdit,nil);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.type resignFirstResponder];
    [self.price resignFirstResponder];
    [self.commdityName resignFirstResponder];
    [self.address resignFirstResponder];
    [self.currency resignFirstResponder];
    [self.brand resignFirstResponder];
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.type resignFirstResponder];
    [self.price resignFirstResponder];
    [self.commdityName resignFirstResponder];
    [self.address resignFirstResponder];
    [self.currency resignFirstResponder];
    [self.brand resignFirstResponder];
}
-(void)deleteAction
{
    AddTagEndBlock block = self.endBlock;
    if (block)
    {
        block(nil,YES,YES);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
