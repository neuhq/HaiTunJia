
#import <UIKit/UIKit.h>


typedef enum LoginViewTapButtonActionType{
    LoginViewTapButtonActionType_GetVerifyCode,
    LoginViewTapButtonActionType_Login
    
}LoginViewTapButtonActionType;

@protocol LoginViewDelegate <NSObject>

/**
 *  获取验证码或登录
 *
 *  @param type LoginViewTapButtonActionType
 */
-(void)getVerifyCodeOrLogin:(LoginViewTapButtonActionType) type;

@end

@interface LoginView : UIView

@property(nonatomic,strong) UITextField *phoneTextField;

@property(nonatomic,strong) UITextField *codeTextField;

@property(nonatomic,weak) id<LoginViewDelegate> delegate;

@property(nonatomic,strong) NSTimer *timer;

@property(nonatomic,assign) int count;


-(void)beginTime:(int) count;

@end
