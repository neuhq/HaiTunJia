
#import "CommentViewController.h"
#import "CommentService.h"
#import "CommentCell.h"

@interface CommentViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic,strong) NSMutableArray *commentListArray;

@property(nonatomic,strong) UITableView *commetListTable;

@end

@implementation CommentViewController


#pragma mark -- life cycle
- (void)viewDidLoad
{
    [self viewConfig];
    [self.view addSubview:self.commetListTable];
    [super viewDidLoad];
   
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    if (self.isLoadView)
    {
        [self getCommentList];
    }
    [super viewDidAppear:animated];
}

#pragma mark -- UI
-(UITableView *) commetListTable
{
    if (!_commetListTable)
    {
        if (!_commetListTable)
        {
            _commetListTable = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
            _commetListTable.delegate = self;
            _commetListTable.dataSource = self;
            _commetListTable.backgroundColor = [UIColor clearColor];
            _commetListTable.bounces = YES;
            _commetListTable.separatorStyle=UITableViewCellSeparatorStyleNone;
        }
    }
    return _commetListTable;
}

#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"评论"];
}
-(void)initArray
{
    self.commentListArray = [[NSMutableArray alloc]init];
}
#pragma mark -- http
//评论列表
-(void)getCommentList
{
    CommentService *service = [[CommentService alloc]init];
    [service startRequestCommentWithParams:^{
        
    } responsResult:^(id object) {
        self.commentListArray = object;
        [self.commetListTable reloadData];
    } failed:^(NSError *error) {
        
    }];
}
#pragma mark -- Delegate

#pragma mark -- UITableViewDelegate/UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.commentListArray.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifer = @"indentifer";
    CommentCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
    if (cell == nil)
    {
        cell = [[CommentCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer];
    }
    if (self.commentListArray.count)
    {
        [cell setDataWithModel:self.commentListArray[indexPath.row]];
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
