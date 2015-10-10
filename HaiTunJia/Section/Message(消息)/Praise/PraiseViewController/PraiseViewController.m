
#import "PraiseViewController.h"
#import "PraiseService.h"
@interface PraiseViewController ()

@property(nonatomic,strong) NSMutableArray *praiseListArray;

@end

@implementation PraiseViewController

#pragma mark -- life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self getPraiseList];
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
    [self setTitle:@"新的赞"];
}
-(void)initArray
{
    self.praiseListArray = [[NSMutableArray alloc]init];
}
#pragma mark -- http
-(void)getPraiseList
{
    __weak PraiseViewController *this = self;
    PraiseService *service = [[PraiseService alloc]init];
    [service startRequestPraiseWithParams:^{
        
    } respons:^(id object) {
        
    } failed:^(NSError *error) {
        
    }];
}
@end
