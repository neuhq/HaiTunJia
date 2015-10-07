
#import "LoginViewPasswordView.h"

static const CGFloat kLoginViewTopOffset = 84.0f;
static const CGFloat kLoginViewLeftOffset = 25.0f;
static const CGFloat kLoginViewMidleOffset = 50.0f;
static const CGFloat kLoginViewBottomOffset  = 100.0f;
static const CGFloat kLoginButtonHeight  = 55.0f;
static const CGFloat kLoginViewLineHeight   = 0.5f;

@interface LoginViewPasswordView ()

<UITextFieldDelegate>
//+86
@property(nonatomic,strong) UILabel *code;

//线
@property(nonatomic,strong) UIView *line;

//横线
@property(nonatomic,strong) UIView *horizontalLine;

@property(nonatomic,strong) UIView *horizontalLine1;

@end
@implementation LoginViewPasswordView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.code];
        [self addSubview:self.line];
        [self addSubview:self.phoneTextField];
        [self addSubview:self.horizontalLine];
        [self addSubview:self.passwordTextField];
        [self addSubview:self.horizontalLine1];
        [self addSubview:self.loginButton];
        [self addSubview:self.forgetPassword];
    }
    return self;
}
#pragma mark  -- UI
-(UILabel *) code
{
    if (!_code)
    {
        NSString *string = @"+86";
        UIFont *font = [UIFont systemFontOfSize:16.0f];
        CGSize nameSize = [@"+86" sizeWithAttributes:@{NSFontAttributeName:font}];
        _code = [[UILabel alloc]initWithFrame:CGRectMake(kLoginViewLeftOffset, kLoginViewTopOffset, nameSize.width, nameSize.height)];
        _code.text = string;
        _code.textAlignment = NSTextAlignmentLeft;
        _code.font = font;
        _code.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _code.backgroundColor = [UIColor clearColor];
    }
    return _code;
}

-(UIView *) line
{
    if (!_line)
    {
        _line = [[UIView alloc]initWithFrame:CGRectMake(self.code.right + 11, self.code.top, kLoginViewLineHeight, self.code.height)];
        _line.backgroundColor = [UIColor colorWithHexString:@"a3a5a8"];
        
    }
    return _line;
}
-(UITextField *) phoneTextField
{
    if (!_phoneTextField)
    {
        // 02 创建手机号输入文本框
        _phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.line.right + 20.0f, self.line.top, kScreenWidth - 2*kLoginViewLeftOffset - self.line.right , self.code.height)];
        _phoneTextField.font = [UIFont systemFontOfSize:16];
        _phoneTextField.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _phoneTextField.delegate = self;
        _phoneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _phoneTextField.placeholder = @"请输入您的手机号码";
        _phoneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _phoneTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _phoneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _phoneTextField.backgroundColor = [UIColor clearColor];
    }
    return _phoneTextField;
}
-(UIView *) horizontalLine
{
    if (!_horizontalLine)
    {
        _horizontalLine = [[UIView alloc]initWithFrame:CGRectMake(kLoginViewLeftOffset  , self.code.bottom + 15.0f, kScreenWidth - 2*kLoginViewLeftOffset, kLoginViewLineHeight)];
        _horizontalLine.backgroundColor = [UIColor colorWithHexString:@"a3a5a8"];
        
    }
    return _horizontalLine;
}

-(UIButton *)loginButton
{
    if (!_loginButton)
    {
        _loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loginButton.frame = CGRectMake(kLoginViewLeftOffset, self.horizontalLine1.bottom + kLoginViewMidleOffset, kScreenWidth - 2*kLoginViewLeftOffset, kLoginButtonHeight);
        _loginButton.layer.masksToBounds = YES;
        _loginButton.layer.cornerRadius = 2.0f;
        _loginButton.tag = 0;
        _loginButton.enabled = NO;
        [_loginButton setTitle:@"确认登陆" forState:UIControlStateNormal];
        [_loginButton setTitle:@"确认登陆" forState:UIControlStateHighlighted];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"cccccc"] rect:_loginButton.bounds] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#cccccc" withAlpha:0.8f] rect:_loginButton.bounds] forState:UIControlStateHighlighted];
    }
    return _loginButton;
}

-(UIButton *) forgetPassword
{
    if (!_forgetPassword)
    {
        NSString *passwordString = @"忘记密码?";
        CGSize size = [passwordString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
        _forgetPassword = [UIButton buttonWithType:UIButtonTypeCustom];
        _forgetPassword.frame = CGRectMake((kScreenWidth - size.width)/2, self.loginButton.bottom + 20.0f, size.width, size.height);
        _forgetPassword.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_forgetPassword setTitle:passwordString forState:UIControlStateNormal];
        [_forgetPassword setTitle:passwordString forState:UIControlStateHighlighted];
        [_forgetPassword setTitleColor:[UIColor colorWithHexString:@"aaaeb2"] forState:UIControlStateNormal];
        [_forgetPassword setTitleColor:[UIColor colorWithHex:@"#aaaeb2" withAlpha:0.8f] forState:UIControlStateHighlighted];
        _forgetPassword.backgroundColor = [UIColor clearColor];
    }
    return _forgetPassword;
}
-(UITextField *) passwordTextField
{
    if (!_passwordTextField)
    {
        // 02 创建手机号输入文本框
        _passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.horizontalLine.left, self.horizontalLine.bottom + (44 - 15 - self.phoneTextField.height),self.horizontalLine.width, self.code.height)];
        _passwordTextField.font = [UIFont systemFontOfSize:16];
        _passwordTextField.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _passwordTextField.delegate = self;
        _passwordTextField.keyboardType = UIKeyboardTypeDefault;
        _passwordTextField.placeholder = @"请输入您的密码";
        _passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _passwordTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _passwordTextField.backgroundColor = [UIColor clearColor];
    }
    return _passwordTextField;
    
}
-(UIView *) horizontalLine1
{
    if (!_horizontalLine1)
    {
        _horizontalLine1 = [[UIView alloc]initWithFrame:CGRectMake(kLoginViewLeftOffset  , self.passwordTextField.bottom + 15.0f, kScreenWidth - 2*kLoginViewLeftOffset, kLoginViewLineHeight)];
        _horizontalLine1.backgroundColor = [UIColor colorWithHexString:@"a3a5a8"];
    }
    return _horizontalLine1;
}
#pragma mark -- Delegete
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
    if(textField == self.phoneTextField)
    {
        if(toBeString.length >= 11 && self.passwordTextField.text.length >= 15)
            [self isEnableLoginButton:YES];
        else
            [self isEnableLoginButton:NO];
        
        if(toBeString.length > 11)
            return NO;
    }
    else if (textField == self.passwordTextField)
    {
        if(toBeString.length >= 15 && self.phoneTextField.text.length >= 11)
            [self isEnableLoginButton:YES];
        else
            [self isEnableLoginButton:NO];
        
        
        if (toBeString.length > 15)
            return NO;
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self isEnableLoginButton:NO];
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
#pragma mark -- helper
//设置登陆按钮状态
-(void)isEnableLoginButton:(BOOL) isEnable
{
    self.loginButton.enabled = isEnable;
    if (isEnable == YES)
    {
        [self.loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"03a9f6"] rect:self.loginButton.bounds] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#03a9f6" withAlpha:0.8f] rect:_loginButton.bounds] forState:UIControlStateHighlighted];
    }
    else
    {
        [self.loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"cccccc"] rect:self.loginButton.bounds] forState:UIControlStateNormal];
    }
}

@end
