#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginServiceWithVerifyCode.h"
#import "GetVerifyCodeService.h"
#import "LoginWithPasswordViewController.h"
#import "GetLoginCodeService.h"
#import "RegisterViewController.h"
#import "RegisterWithPhoneViewController.h"

 static NSString *kLoginViewControllerTitleName = @"登陆";
@interface LoginViewController ()
<LoginViewDelegate,
UIAlertViewDelegate>


//登陆view
@property(nonatomic,strong) LoginView *loginView;

//验证码
@property(nonatomic,strong) NSString *verifyCode;

@end

@implementation LoginViewController

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
        _loginView.backgroundColor = [UIColor whiteColor];
    }
    return _loginView;
}

#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:kLoginViewControllerTitleName];
}
#pragma mark --- HTTP
-(void)getLoginCode
{
    GetLoginCodeService *service = [[GetLoginCodeService alloc]init];
    [service startRequestLoginCode:^{
        service.name = self.loginView.phoneTextField.text;
    } respons:^(id object) {
        if ([object[@"code"] integerValue] == 0)
        {
            [service showResponsMessage:object[@"message"]];
        }
        else if([object[@"code"] integerValue] == 30011)
        {
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"提示" message:@"该手机号码尚未注册，是否注册?" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
            [alert show];
        }
    } failed:^(NSError *error) {
        
    }];
}
//获取验证码
-(void)getVerifyCode
{
    GetVerifyCodeService *service = [[GetVerifyCodeService alloc]init];
    [service startGetVerifyCodeWithparams:^{
        service.name = self.loginView.phoneTextField.text;
    } withResult:^(NSDictionary *result) {
        NSDictionary *stateDic = result[@"state"];
        if([stateDic[@"code"] integerValue] == 0)
        {
            [self.loginView beginTime:60];
        }
        iToast *toast= [iToast makeText:stateDic[@"message"]];
        [toast show];
    } withFailed:^(NSError *error) {
        
    }];
}
//登录
-(void)login
{
    LoginServiceWithVerifyCode *service = [[LoginServiceWithVerifyCode alloc]init];
    [service startLoginWithParams:^{
        service.name = self.loginView.phoneTextField.text;
        service.code = self.loginView.codeTextField.text;
    } withResult:^{
        LoginEndBlock endBlock = self.endBlock;
        if (endBlock)
        {
            endBlock();
        }
        [self.navigationController popViewControllerAnimated:YES];
    } withFailed:^(NSError *error) {
        
    }];
}
#pragma mark -- Delegate
//LoginViewDelegete
-(void)getVerifyCodeOrLogin:(LoginViewTapButtonActionType)type
{
    if (type == LoginViewTapButtonActionType_Login)
    {
        [self login];
    }
    else
    {
        [self getLoginCode];
    }
}
-(void)getLoginType:(LoginType)loginType
{
    if (loginType == LoginType_PassWordLogin)
    {
        [self jumpLoginWithPasswordController];
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
        RegisterWithPhoneViewController *registerVC = [[RegisterWithPhoneViewController alloc]init];
        [self.navigationController pushViewController:registerVC animated:YES];

    }
}
#pragma mark -- Jump
-(void)jumpLoginWithPasswordController
{
    LoginWithPasswordViewController *passwordController = [[LoginWithPasswordViewController alloc]init];
    [self.navigationController pushViewController:passwordController animated:YES];
}
-(void)wechatLogin
{
    
}
@end
