#import "PersonalDataViewController.h"


@interface PersonalDataViewController ()
<UITableViewDelegate,
UITableViewDataSource>
@property(nonatomic,strong) UITableView *personTableView;

@property(nonatomic,strong) NSArray *titleArray;

@end

@implementation PersonalDataViewController
#pragma mark -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initArray];
    [self viewConfig];
    [self.view addSubview:self.personTableView];
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
-(UITableView *) personTableView
{
    if (!_personTableView)
    {
        _personTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStyleGrouped];
        _personTableView.delegate = self;
        _personTableView.dataSource = self;
        _personTableView.bounces = YES;
    }
    return _personTableView;
}
-(void)initArray
{
    self.titleArray = [NSArray arrayWithObjects:@"昵称",@"性别",@"常住地",@"个性签名", nil];
}
-(void)viewConfig
{
    [self setTitle:@"设置"];
}
#pragma mark -- UITableViewDelegate/UITableVIewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
