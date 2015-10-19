#import "SetViewController.h"
#import "PersonalDataViewController.h"

@interface SetViewController ()
<UITableViewDelegate,
UITableViewDataSource>
@property(nonatomic,strong) UITableView *setTableView;

@property(nonatomic,strong) NSArray *firstTitleArray;

@property(nonatomic,strong) NSArray *secondTitleArray;

@property(nonatomic,strong) NSArray *thirdTitleArray;

@end
@implementation SetViewController

#pragma mark -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initArray];
    [self viewConfig];
    [self.view addSubview:self.setTableView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
#pragma mark -- UI
-(UITableView *) setTableView
{
    if (!_setTableView)
    {
        _setTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStyleGrouped];
        _setTableView.delegate = self;
        _setTableView.dataSource = self;
        _setTableView.bounces = YES;
    }
    return _setTableView;
}
-(void)initArray
{
    self.firstTitleArray = [NSArray arrayWithObjects:@"个人资料",@"我赞过的",@"积分等级",@"社区规范",@"服务条款",@"隐私政策", nil];
}
-(void)viewConfig
{
    [self setTitle:@"设置"];
}
#pragma mark -- UITableViewDelegate/UITableVIewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return self.firstTitleArray.count;
    else if (section == 1)
        return 1;
    else if (section == 2)
        return 1;
    else if (section == 3)
        return 2;
    return 0;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        static NSString *indentifer1 = @"indentifer1";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer1];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer1];
        }
        cell.textLabel.text = self.firstTitleArray[indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"626a73"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (indexPath.section == 1)
    {
        static NSString *indentifer2 = @"indentifer2";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer2];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer2];
        }
        cell.textLabel.text = @"消息通知";
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"626a73"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (indexPath.section == 2)
    {
        static NSString *indentifer3 = @"indentifer3";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer3];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer3];
        }
        cell.textLabel.text = @"召唤CEO";
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"626a73"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    else if (indexPath.section == 3)
    {
        static NSString *indentifer4 = @"indentifer4";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer4];
        if (cell == nil)
        {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer4];
        }
        cell.textLabel.text = @[@"账号绑定",@"登出"][indexPath.row];
        cell.textLabel.textAlignment = NSTextAlignmentLeft;
        cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
        cell.textLabel.textColor = [UIColor colorWithHexString:@"626a73"];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
//            PersonalDataViewController *person = [[PersonalDataViewController alloc]init];
//            [self.navigationController pushViewController:person animated:YES];
        }
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10.0f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return 10.0f;
    else
        return 5.0f;
}
@end
