

#import "RegisterViewController.h"
#import "RegisterTextField.h"
#import "RegisterService.h"
#import "HomeViewController.h"

@interface RegisterViewController ()
<UITextFieldDelegate>

@property (nonatomic,strong) NSMutableArray *placeHolderArray;

@property (nonatomic,strong) UITextField *registerTF1;

@property (nonatomic,strong) UITextField *registerTF2;

@property (nonatomic,strong) UIButton *registerButton;

@end

@implementation RegisterViewController

#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self viewConfig];
    [self initViews];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
#pragma mark -- UI
-(void)initViews
{
    NSArray *array = [NSArray arrayWithObjects:@"请设置昵称",@"请设置您的密码",nil];
    for (NSInteger i = 0; i < 2; i++)
    {
        RegisterTextField *textFied = [[RegisterTextField alloc]initWithFrame:CGRectMake(0, i*44 + 50 + kNavigationBarHeight, kScreenWidth, 44)];
        textFied.customTextField.delegate = self;
        textFied.customTextField.placeholder = array[i];
        textFied.backgroundColor = [UIColor whiteColor];
        if(i== 0)
            self.registerTF1 = textFied.customTextField;
        else
            self.registerTF2 = textFied.customTextField;
        [self.view addSubview:textFied];
    }
    [self.view addSubview:self.registerButton];
    
}
-(UIButton *) registerButton
{
    if (!_registerButton)
    {
        _registerButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _registerButton.frame = CGRectMake(25, 88 + 50 +kNavigationBarHeight + 30.0f, kScreenWidth - 2*25, 55.0f);
        _registerButton.layer.masksToBounds = YES;
        _registerButton.layer.cornerRadius = 2.0f;
        _registerButton.tag = 0;
        _registerButton.enabled = NO;
        [_registerButton setTitle:@"注册" forState:UIControlStateNormal];
        [_registerButton setTitle:@"注册" forState:UIControlStateHighlighted];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_registerButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _registerButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_registerButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"cccccc"] rect:_registerButton.bounds] forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#cccccc" withAlpha:0.8f] rect:_registerButton.bounds] forState:UIControlStateHighlighted];
        [_registerButton addTarget:self action:@selector(registerAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerButton;
}
#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"注册"];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
//设置登陆按钮状态
-(void)isEnableRegisterButton:(BOOL) isEnable
{
    self.registerButton.enabled = isEnable;
    if (isEnable == YES)
    {
        [_registerButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"03a9f6"] rect:_registerButton.bounds] forState:UIControlStateNormal];
        [_registerButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#03a9f6" withAlpha:0.8f] rect:_registerButton.bounds] forState:UIControlStateHighlighted];
    }
    else
    {
        [_registerButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"cccccc"] rect:_registerButton.bounds] forState:UIControlStateNormal];
    }
}
#pragma mark -- HTTP
-(void)requestRegister
{
    RegisterService *service = [[RegisterService alloc]init];
    [service startRequestRegister:^{
        service.name = self.phoneNum;
        service.code = self.code;
        service.nickName = self.registerTF1.text;
        service.password = self.registerTF2.text;
    } repons:^(id object) {
        HomeViewController *home = [[HomeViewController alloc]init];
        [self.navigationController pushViewController:home animated:YES];
    } failed:^(NSError *error) {
        
    }];
}
#pragma mark -- Delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    toBeString = [toBeString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet ]];
    if(textField == self.registerTF1)
    {
        if(toBeString.length < 2)
            [self isEnableRegisterButton:NO];
        else
            [self isEnableRegisterButton:YES];
        
        if(toBeString.length > 5)
            return NO;
    }
    else if (textField == self.registerTF2)
    {
        if(toBeString.length < 12)
            [self isEnableRegisterButton:NO];
        else
            [self isEnableRegisterButton:YES];
        
        
        if (toBeString.length > 15)
            return NO;
    }
    return YES;

}
-(BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self isEnableRegisterButton:NO];
    return YES;
}
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.registerTF2 resignFirstResponder];
    [self.registerTF1 resignFirstResponder];
    return YES;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    [self.registerTF2 resignFirstResponder];
    [self.registerTF1 resignFirstResponder];
}
#pragma mark -- Action
-(void)registerAction:(UIButton *) sender
{
    [self requestRegister];
}
@end
