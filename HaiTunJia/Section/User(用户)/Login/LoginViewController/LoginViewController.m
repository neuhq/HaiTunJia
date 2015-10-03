#import "LoginViewController.h"
#import "LoginView.h"

 static NSString *kLoginViewControllerTitleName = @"登陆";
@interface LoginViewController ()

//登陆view
@property(nonatomic,strong) LoginView *loginView;

@end

@implementation LoginViewController

#pragma mark  -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:kLoginViewControllerTitleName];
    [self.view addSubview:self.loginView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
#pragma mark  -- UI
-(LoginView *) loginView
{
    if (!_loginView)
    {
        _loginView = [[LoginView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
        _loginView.backgroundColor = [UIColor whiteColor];
    }
    return _loginView;
}
@end
