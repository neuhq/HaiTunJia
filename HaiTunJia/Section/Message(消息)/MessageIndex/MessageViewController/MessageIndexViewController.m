#import "MessageIndexViewController.h"
#import "MessageViewCell.h"
#import "MessageIndexViewController+helper.h"
#import "MessageHeaderView.h"
#import "MyFansViewController.h"
#import "CommentViewController.h"
#import "PraiseViewController.h"
#import "NoticeViewController.h"

@interface MessageIndexViewController ()

@property(nonatomic,strong) MessageHeaderView *headerView;

@property(nonatomic,strong) NSMutableArray *controllerArray;
@end

@implementation MessageIndexViewController

#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initArray];
    
    [self viewConfig];
    
    [self addController];
    
    [self getLocalData];
    
    [self.view addSubview:self.messageTableView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self  hideTabbar:NO];
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self hideTabbar:YES];
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
    self.controllerArray = [[NSMutableArray alloc]init];
}
-(void)addController
{
    MyFansViewController *myFans = [[MyFansViewController alloc]init];
    CommentViewController *comment = [[CommentViewController alloc]init];
    PraiseViewController *praise = [[PraiseViewController alloc]init];
    NoticeViewController *notice = [[NoticeViewController alloc]init];
    [self.controllerArray addObject:myFans];
    [self.controllerArray addObject:comment];
    [self.controllerArray addObject:praise];
    [self.controllerArray addObject:notice];

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
    if (indexPath.section == TableViewCellType_List)
    {
        [self.navigationController pushViewController:self.controllerArray[indexPath.row] animated:YES];
    }
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


