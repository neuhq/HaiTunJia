

#import "ForgetPasswordViewController.h"
#import "ForgetPasswordView.h"
#import "GetVerifyCodeService.h"

@interface ForgetPasswordViewController ()
<FotgetViewDelegate>
@property(nonatomic,strong) ForgetPasswordView *forgetPasswordView;

@end

@implementation ForgetPasswordViewController

#pragma mark  -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self.view addSubview:self.forgetPasswordView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
#pragma mark  -- UI
-(ForgetPasswordView *) forgetPasswordView
{
    if (!_forgetPasswordView)
    {
        _forgetPasswordView = [[ForgetPasswordView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
        _forgetPasswordView.delegate = self;
        _forgetPasswordView.backgroundColor = [UIColor whiteColor];

    }
    return _forgetPasswordView;
}

#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"忘记密码"];
}
#pragma mark --- HTTP
//获取验证码
-(void)getVerifyCode
{
    GetVerifyCodeService *service = [[GetVerifyCodeService alloc]init];
    [service startGetVerifyCodeWithparams:^{
        service.name = self.forgetPasswordView.phoneTextField.text;
    } withResult:^(NSDictionary *result) {
        NSDictionary *stateDic = result[@"state"];
        if([stateDic[@"code"] integerValue] == 0)
        {
            [self.forgetPasswordView beginTime:60];
        }
        iToast *toast= [iToast makeText:stateDic[@"message"]];
        [toast show];
    } withFailed:^(NSError *error) {
        
    }];
}
#pragma mark -- Delegate
//LoginViewDelegete
-(void)getVerifyCodeOrLogin:(LoginViewTapButtonActionType)type
{
    if (type == LoginViewTapButtonActionType_Login)
    {

    }
    else
    {
        [self getVerifyCode];
    }
}

@end
