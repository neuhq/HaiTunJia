
#import <UIKit/UIKit.h>


/**
 获取验证码还是登陆
 */
typedef enum LoginViewTapButtonActionType{
    LoginViewTapButtonActionType_GetVerifyCode,
    LoginViewTapButtonActionType_Login
    
}LoginViewTapButtonActionType;

/**
 登陆类型：密码登陆还是第三方微信登陆
 */
typedef NS_ENUM(NSInteger,LoginType)  {
    LoginType_PassWordLogin = 100,
    LoginType_WechatLogin
};

@protocol LoginViewDelegate <NSObject>

@optional
/**
 *  获取验证码或登录
 *
 *  @param type LoginViewTapButtonActionType
 */
-(void)getVerifyCodeOrLogin:(LoginViewTapButtonActionType) type;

/**
 *  密码登陆还是第三方微信登陆
 *
 *  @param loginType LoginType
 */
-(void)getLoginType:(LoginType) loginType;

@end

@interface LoginView : UIView

@property(nonatomic,strong) UITextField *phoneTextField;

@property(nonatomic,strong) UITextField *codeTextField;

//登陆按钮
@property(nonatomic,strong) UIButton *loginButton;

//使用密码登陆
@property(nonatomic,strong) UIButton *passWordButton;


@property(nonatomic,weak) id<LoginViewDelegate> delegate;

@property(nonatomic,strong) NSTimer *timer;

@property(nonatomic,assign) int count;


-(void)beginTime:(int) count;

@end
