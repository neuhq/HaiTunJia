

#import "ForgetPasswordView.h"

static const CGFloat kLoginViewTopOffset = 84.0f;
static const CGFloat kLoginViewLeftOffset = 25.0f;
static const CGFloat kLoginViewMidleOffset = 50.0f;
static const CGFloat kLoginViewBottomOffset  = 100.0f;
static const CGFloat kLoginButtonHeight  = 55.0f;
static const CGFloat kLoginViewLineHeight   = 0.5f;

@interface ForgetPasswordView ()
<UITextFieldDelegate>
//+86
@property(nonatomic,strong) UILabel *code;

//线
@property(nonatomic,strong) UIView *line;

//横线
@property(nonatomic,strong) UIView *horizontalLine;

@property(nonatomic,strong) UIView *horizontalLine1;

//登陆按钮
@property(nonatomic,strong) UIButton *loginButton;

//发送验证码
@property(nonatomic,strong) UIButton *sendCode;

@end

@implementation ForgetPasswordView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.code];
        [self addSubview:self.line];
        [self addSubview:self.phoneTextField];
        [self addSubview:self.horizontalLine];
        [self addSubview:self.sendCode];
        [self addSubview:self.codeTextField];
        [self addSubview:self.horizontalLine1];
        [self addSubview:self.loginButton];
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
        _loginButton.frame = CGRectMake(kLoginViewLeftOffset, self.horizontalLine.bottom + kLoginViewMidleOffset, kScreenWidth - 2*kLoginViewLeftOffset, kLoginButtonHeight);
        _loginButton.layer.masksToBounds = YES;
        _loginButton.layer.cornerRadius = 2.0f;
        _loginButton.tag = 0;
        _loginButton.enabled = NO;
        [_loginButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_loginButton setTitle:@"发送验证码" forState:UIControlStateHighlighted];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"cccccc"] rect:_loginButton.bounds] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#cccccc" withAlpha:0.8f] rect:_loginButton.bounds] forState:UIControlStateHighlighted];
        [_loginButton addTarget:self action:@selector(sendVerfifyCode:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginButton;
}

-(UIButton *) sendCode
{
    if (!_sendCode)
    {
        NSString *passwordString = @"重新发送";
        CGSize size = [passwordString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
        _sendCode = [UIButton buttonWithType:UIButtonTypeCustom];
        _sendCode.hidden = YES;
        _sendCode.tag = 0;
        _sendCode.frame = CGRectMake(self.horizontalLine.right- size.width, self.horizontalLine.bottom + (44 - 15 - self.phoneTextField.height), size.width, self.code.height);
        _sendCode.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_sendCode setTitleColor:[UIColor colorWithHexString:@"03a9f6"] forState:UIControlStateNormal];
        [_sendCode setTitleColor:[UIColor colorWithHex:@"#03a9f6" withAlpha:0.8f] forState:UIControlStateHighlighted];
        _sendCode.backgroundColor = [UIColor clearColor];
        [_sendCode addTarget:self action:@selector(sendVerfifyCode:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sendCode;
}

-(UITextField *) codeTextField
{
    if (!_codeTextField)
    {
        // 02 创建手机号输入文本框
        _codeTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.horizontalLine.left, self.sendCode.top,self.horizontalLine.width - self.sendCode.width - 10, self.code.height)];
        _codeTextField.hidden = YES;
        _codeTextField.font = [UIFont systemFontOfSize:16];
        _codeTextField.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _codeTextField.delegate = self;
        _codeTextField.keyboardType = UIKeyboardTypeNumberPad;
        _codeTextField.placeholder = @"请输入您的验证码";
        _codeTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _codeTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _codeTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _codeTextField.backgroundColor = [UIColor clearColor];
    }
    return _codeTextField;
    
}
-(UIView *) horizontalLine1
{
    if (!_horizontalLine1)
    {
        _horizontalLine1 = [[UIView alloc]initWithFrame:CGRectMake(kLoginViewLeftOffset  , self.codeTextField.bottom + 15.0f, kScreenWidth - 2*kLoginViewLeftOffset, kLoginViewLineHeight)];
        _horizontalLine1.hidden = YES;
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
        if(toBeString.length < 11)
            [self isEnableLoginButton:NO];
        else
            [self isEnableLoginButton:YES];
        
        if(toBeString.length > 11)
            return NO;
    }
    else if (textField == self.codeTextField)
    {
        if(toBeString.length < 4)
            [self isEnableLoginButton:NO];
        else
            [self isEnableLoginButton:YES];
        
        
        if (toBeString.length > 4)
            return NO;
    }
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    [self isEnableLoginButton:NO];
    return YES;
}
#pragma mark -- Action
//点击发送验证码或登陆
-(void)sendVerfifyCode:(UIButton *) sender
{
    sender.tag++;
    if (sender.tag > 1)
    {
        if(self.delegate && [self.delegate respondsToSelector:@selector(getVerifyCodeOrLogin:)])
            [self.delegate getVerifyCodeOrLogin:LoginViewTapButtonActionType_Login];
    }
    else
    {
        [UIView animateWithDuration:0.5f animations:^{
            [self moveFrame];
            [self showVerifyCodeTextField];
            if(self.delegate && [self.delegate respondsToSelector:@selector(getVerifyCodeOrLogin:)])
                [self.delegate getVerifyCodeOrLogin:LoginViewTapButtonActionType_GetVerifyCode];
        } completion:^(BOOL finished) {
            
        }];
    }
}
#pragma mark -- helper
//坐标移动
-(void)moveFrame
{
    CGRect loginBtnRect = self.loginButton.frame;
    loginBtnRect.origin.y = self.horizontalLine1.bottom + 40.0f;
    self.loginButton.frame = loginBtnRect;
 }

-(void)showVerifyCodeTextField
{
    self.codeTextField.hidden = NO;
    self.horizontalLine1.hidden = NO;
    self.sendCode.hidden = NO;
    [self.loginButton setTitle:@"下一步" forState:UIControlStateNormal];
    [self.loginButton setTitle:@"下一步" forState:UIControlStateHighlighted];
    [self.codeTextField becomeFirstResponder];
    [self isEnableLoginButton:NO];
}
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
//验证码开始倒计时
-(void)beginTime:(int) count
{
    self.count = count;
    self.timer =   [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(countdown) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
}
//倒计时方法
-(void)countdown
{
    self.count -- ;
    if (self.count == 0)
    {
        [self.timer invalidate];
        self.timer = nil;
        [self setSendCodeButtonTitle:@"重新发送" isEnable:YES];
    }
    else
    {
        [self setSendCodeButtonTitle:[NSString stringWithFormat:@"%ds",self.count] isEnable:NO];
    }
}
//发送验证码按钮设置
-(void)setSendCodeButtonTitle:(NSString *) title isEnable:(BOOL) isEnable
{
    [self.sendCode setTitle:title forState:UIControlStateNormal];
    self.sendCode.enabled = isEnable;
}
-(void)touchesBegan:(NSSet*)touches withEvent:(UIEvent *)event
{
    [self.phoneTextField resignFirstResponder];
    [self.codeTextField resignFirstResponder];
}

@end
