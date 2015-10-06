#import "LoginViewController.h"
#import "LoginView.h"
#import "LoginServiceWithVerifyCode.h"
#import "GetVerifyCodeService.h"
 static NSString *kLoginViewControllerTitleName = @"登陆";
@interface LoginViewController ()
<LoginViewDelegate>

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
//获取验证码
-(void)getVerifyCode
{
    GetVerifyCodeService *service = [[GetVerifyCodeService alloc]init];
    [service startGetVerifyCodeWithparams:^{
        service.name = self.loginView.phoneTextField.text;
    } withResult:^(NSDictionary *result) {
        NSDictionary *stateDic = result[@"state"];
        NSDictionary *dataDic  = result[@"data"];
        self.verifyCode = dataDic[@"validateCode"];
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
        service.password = self.verifyCode;
    } withResult:^{
        
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
        [self getVerifyCode];
    }
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_loginView.phoneTextField resignFirstResponder];
    [_loginView.codeTextField resignFirstResponder];
}
@end
