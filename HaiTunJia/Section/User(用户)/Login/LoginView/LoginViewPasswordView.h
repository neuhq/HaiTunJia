

#import <UIKit/UIKit.h>

@interface LoginViewPasswordView : UIView

@property(nonatomic,strong) UITextField *phoneTextField;

@property(nonatomic,strong) UITextField *passwordTextField;

//登陆按钮
@property(nonatomic,strong) UIButton *loginButton;

//使用密码登陆
@property(nonatomic,strong) UIButton *forgetPassword;

@end
