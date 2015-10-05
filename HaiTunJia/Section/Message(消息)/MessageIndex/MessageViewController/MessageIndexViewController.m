#import "MessageIndexViewController.h"
#import "MessageViewCell.h"
#import "MessageIndexViewController+helper.h"
#import "MessageHeaderView.h"

@interface MessageIndexViewController ()

@property(nonatomic,strong) MessageHeaderView *headerView;

@end

@implementation MessageIndexViewController

#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initArray];
    
    [self viewConfig];
    
    [self getLocalData];
    
    [self.view addSubview:self.messageTableView];
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
-(UITableView *) messageTableView
{
    if (!_messageTableView)
    {
        _messageTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight - CONTENT_TABBAR_HEIGHT) style:UITableViewStyleGrouped];
        _messageTableView.delegate = self;
        _messageTableView.dataSource = self;
        _messageTableView.backgroundColor = [UIColor clearColor];
        _messageTableView.bounces = YES;
//        _messageTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _messageTableView;
}
-(MessageHeaderView *) headerView
{
    if (!_headerView)
    {
        _headerView = [[MessageHeaderView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kMessageViewCellForListTypeHeight + kMessageViewCellOffset)];
    }
    return _headerView;
}
#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"消息"];
    self.leftBarButton.hidden = YES;
}
-(void)initArray
{
    self.listLocalDataArray = [[NSMutableArray alloc]init];
}
#pragma mark --- Delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 0)
        return 4;
    else
        return 7;
}
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == TableViewCellType_List)
    {
        static NSString *listIndentifer = @"listIndentifer";
        MessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:listIndentifer];
        if (cell == nil)
        {
            cell = [[MessageViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:listIndentifer cellType:TableViewCellType_List];
        }
        cell.dataDic = self.listLocalDataArray[indexPath.row];
        return cell;
    }
    else
    {
        static NSString *imageIndentifer = @"imageIndentifer";
        MessageViewCell *cell = [tableView dequeueReusableCellWithIdentifier:imageIndentifer];
        if (cell == nil)
        {
            cell = [[MessageViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:imageIndentifer cellType:TableViewCellType_ImageView];
        }
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(TableViewCellType_List == indexPath.section)
         return kMessageViewCellForListTypeHeight;
    else
        return kMessageViewCellForImageTypeHeight + kMessageViewCellOffset;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(TableViewCellType_List == section)
        return 0.1f;
    else
        return kMessageViewCellForListTypeHeight + kMessageViewCellOffset;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1f;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if(TableViewCellType_ImageView == section)
        return self.headerView;
    else
        return nil;
}
@end
