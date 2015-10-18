
#import "RegisterWithPhoneViewController.h"
#import "LoginView.h"
#import "LoginServiceWithVerifyCode.h"
#import "GetVerifyCodeService.h"
#import "LoginWithPasswordViewController.h"
#import "GetLoginCodeService.h"
#import "RegisterViewController.h"

@interface RegisterWithPhoneViewController ()
<LoginViewDelegate,
UIAlertViewDelegate>

//登陆view
@property(nonatomic,strong) LoginView *loginView;

//验证码
@property(nonatomic,strong) NSString *verifyCode;

@end
@implementation RegisterWithPhoneViewController
#pragma mark  -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self.view addSubview:self.loginView];
}
-(void)viewWillAppear:(BOOL)animated
{
    self.fd_interactivePopDisabled = YES;
    [super viewWillAppear:animated];
}
#pragma mark  -- UI
-(LoginView *) loginView
{
    if (!_loginView)
    {
        _loginView = [[LoginView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
        _loginView.delegate = self;
        _loginView.passWordButton.hidden = YES;
        [_loginView.loginButton setTitle:@"注册" forState:UIControlStateNormal];
        [_loginView.loginButton setTitle:@"注册" forState:UIControlStateHighlighted];
        _loginView.backgroundColor = [UIColor whiteColor];
    }
    return _loginView;
}

#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"注册"];
}
#pragma mark --- HTTP
//获取验证码
-(void)getVerifyCode
{
    GetVerifyCodeService *service = [[GetVerifyCodeService alloc]init];
    [service startGetVerifyCodeWithparams:^{
        service.name = self.loginView.phoneTextField.text;
    } withResult:^(NSDictionary *result) {
        if([result[@"code"] integerValue] == 0)
        {
            [self.loginView beginTime:60];
        }
        [service showResponsMessage:result[@"message"]];
    } withFailed:^(NSError *error) {
        
    }];
}
//登录
-(void)pushLastPage
{
    if (self.loginView.codeTextField.text.length != 0)
    {
        RegisterViewController *registerVc = [[RegisterViewController alloc]init];
        registerVc.phoneNum = self.loginView.phoneTextField.text;
        registerVc.code = self.loginView.codeTextField.text;
        [self.navigationController pushViewController:registerVc animated:YES];
    }
}
#pragma mark -- Delegate
//LoginViewDelegete
-(void)getVerifyCodeOrLogin:(LoginViewTapButtonActionType)type
{
    if (type == LoginViewTapButtonActionType_Login)
    {
        [self pushLastPage];
    }
    else
    {
        [self getVerifyCode];
    }
}
-(void)getLoginType:(LoginType)loginType
{
    if (loginType == LoginType_PassWordLogin)
    {

    }
    else
    {
    }
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0)
    {
        
    }
    else
    {
        RegisterViewController *registerVC = [[RegisterViewController alloc]init];
        [self.navigationController pushViewController:registerVC animated:YES];
        
    }
}

@end
