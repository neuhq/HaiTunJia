

#import "LoginWithPasswordViewController.h"
#import "LoginViewPasswordView.h"
#import "ForgetPasswordViewController.h"
@interface LoginWithPasswordViewController ()

@property(nonatomic,strong) LoginViewPasswordView *passwordView;
@end

@implementation LoginWithPasswordViewController

#pragma mark  -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self.view addSubview:self.passwordView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"使用密码登陆"];
}
#pragma mark  -- UI
-(LoginViewPasswordView *) passwordView
{
    if (!_passwordView)
    {
        _passwordView = [[LoginViewPasswordView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
        _passwordView.backgroundColor = [UIColor whiteColor];
        [_passwordView.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
        [_passwordView.forgetPassword addTarget:self action:@selector(fotgetPassword) forControlEvents:UIControlEventTouchUpInside];
    }
    return _passwordView;
}
#pragma mark -- Action
-(void)login
{
    
}
-(void)fotgetPassword
{
    [self jumpForgetPasswordController];
}
#pragma mark -- Jump
-(void)jumpForgetPasswordController
{
    ForgetPasswordViewController * fotget = [[ForgetPasswordViewController alloc]init];
    [self.navigationController pushViewController:fotget animated:YES];
}

@end
