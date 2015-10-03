
#import "LoginView.h"

static const CGFloat kLoginViewTopOffset = 84.0f;
static const CGFloat kLoginViewLeftOffset = 25.0f;
static const CGFloat kLoginViewMidleOffset = 50.0f;
static const CGFloat kLoginViewBottomOffset  = 100.0f;
static const CGFloat kLoginButtonHeight  = 55.0f;
static const CGFloat kLoginViewLineHeight   = 0.5f;

@interface LoginView ()
<UITextFieldDelegate>
//+86
@property(nonatomic,strong) UILabel *code;

//线
@property(nonatomic,strong) UIView *line;

//横线
@property(nonatomic,strong) UIView *horizontalLine;

@property(nonatomic,strong) UITextField *phoneTextField;

//登陆按钮
@property(nonatomic,strong) UIButton *loginButton;

//使用密码登陆
@property(nonatomic,strong) UIButton *passWordButton;

//微信登陆
@property(nonatomic,strong) UIButton *wechatButton;

//第三方登陆
@property(nonatomic,strong) UILabel *thirdLogin;

@property(nonatomic,strong) UITextField *codeTextField;


@end

@implementation LoginView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.code];
        [self addSubview:self.line];
        [self addSubview:self.textField];
        [self addSubview:self.horizontalLine];
        [self addSubview:self.loginButton];
        [self addSubview:self.passWordButton];
        [self addSubview:self.wechatButton];
        [self addSubview:self.thirdLogin];
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
-(UITextField *) textField
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
        [_loginButton setTitle:@"发送验证码" forState:UIControlStateNormal];
        [_loginButton setTitle:@"发送验证码" forState:UIControlStateHighlighted];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _loginButton.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"03a9f6"] rect:_loginButton.bounds] forState:UIControlStateNormal];
        [_loginButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#03a9f6" withAlpha:0.8f] rect:_loginButton.bounds] forState:UIControlStateHighlighted];
    }
    return _loginButton;
}

-(UIButton *) passWordButton
{
    if (!_passWordButton)
    {
        NSString *passwordString = @"使用密码登陆";
        CGSize size = [passwordString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
        _passWordButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _passWordButton.frame = CGRectMake((kScreenWidth - size.width)/2, self.loginButton.bottom + 20.0f, size.width, size.height);
        _passWordButton.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_passWordButton setTitle:passwordString forState:UIControlStateNormal];
        [_passWordButton setTitle:passwordString forState:UIControlStateHighlighted];
        [_passWordButton setTitleColor:[UIColor colorWithHexString:@"aaaeb2"] forState:UIControlStateNormal];
        [_passWordButton setTitleColor:[UIColor colorWithHex:@"#aaaeb2" withAlpha:0.8f] forState:UIControlStateHighlighted];
        _passWordButton.backgroundColor = [UIColor clearColor];
    }
    return _passWordButton;
}

-(UIButton *) wechatButton
{
    if (!_wechatButton)
    {
        UIImage *image = [UIImage imageNamed:@"regiter_weixin"];
        _wechatButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _wechatButton.frame = CGRectMake((kScreenWidth - image.size.width)/2,kScreenHeight - kLoginViewBottomOffset - image.size.height, image.size.width, image.size.height);
        [_wechatButton setBackgroundImage: image forState:UIControlStateNormal];
        [_wechatButton setBackgroundImage: image forState:UIControlStateHighlighted];
    }
    return _wechatButton;
}

-(UILabel *) thirdLogin
{
    if (!_thirdLogin)
    {
        NSString *string = @"第三方账户登陆";
        UIFont *font = [UIFont systemFontOfSize:12.0f];
        CGSize thirdSize = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _thirdLogin = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth - thirdSize.width)/2 , self.wechatButton.top - 24.0f - thirdSize.height, thirdSize.width, thirdSize.height)];
        _thirdLogin.text = string;
        _thirdLogin.textAlignment = NSTextAlignmentCenter;
        _thirdLogin.font = font;
        _thirdLogin.textColor = [UIColor colorWithHexString:@"aaaeb2"];
        _thirdLogin.backgroundColor = [UIColor clearColor];
    }
    return _thirdLogin;
}






@end
