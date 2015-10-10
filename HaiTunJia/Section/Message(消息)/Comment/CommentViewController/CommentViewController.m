
#import "CommentViewController.h"
#import "CommentService.h"
@interface CommentViewController ()


@property(nonatomic,strong) NSMutableArray *commentListArray;

@end

@implementation CommentViewController


#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self getCommentList];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark -- UI


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
        
    } failed:^(NSError *error) {
        
    }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
