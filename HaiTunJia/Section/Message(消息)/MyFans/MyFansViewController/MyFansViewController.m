
#import "MyFansViewController.h"
#import "MyFansViewCell.h"
#import "FansListService.h"
#import "FollowService.h"
@interface MyFansViewController ()
<UITableViewDelegate,
UITableViewDataSource>
@property(nonatomic,strong) UITableView *fansTableView;

@property(nonatomic,strong) NSMutableArray *listArray;

@end

@implementation MyFansViewController

#pragma mark -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
//    [self getFansListData];
    [self getFollowListData];
    [self.view addSubview:self.fansTableView];
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
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

#pragma mark -- UI
-(UITableView *) fansTableView
{
    if (!_fansTableView)
    {
        _fansTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStylePlain];
        _fansTableView.delegate = self;
        _fansTableView.dataSource = self;
        _fansTableView.backgroundColor = [UIColor clearColor];
        _fansTableView.bounces = YES;
        _fansTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _fansTableView;
}
#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"新的粉丝"];
}
-(void)initArray
{
    self.listArray = [[NSMutableArray alloc]init];
}
#pragma mark -- HTTP
//粉丝列表
-(void)getFansListData
{
    FansListService *service = [[FansListService alloc]init];
    [service startRequestWithResultBlock:^(id obj) {
        self.listArray = obj;
        [self.fansTableView reloadData];
    } withFailed:^(NSError *error) {
        
    }];
}
//关注列表
-(void)getFollowListData
{
    FollowService *service = [[FollowService alloc]init];
    [service startRequestFollowWithParams:^{
        
    } respons:^(id object) {
        
    } failed:^(NSError *error) {
        
    }];
}
#pragma mark -- Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.listArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifer = @"indentifer";
    MyFansViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
    if (cell == nil)
    {
        cell = [[MyFansViewCell alloc]initWithStyle: UITableViewCellStyleDefault reuseIdentifier:indentifer];
    }
    MyFansDataModel *dataModel = self.listArray[indexPath.row];
    cell.dataModel = dataModel;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return  kMyFansViewCellHeight;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}



















@end
