//
//  ForgetPasswordView.h
//  HaiTunJia
//
//  Created by 李哲 on 15/10/7.
//  Copyright © 2015年 李哲. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 获取验证码还是登陆
 */
typedef enum LoginViewTapButtonActionType{
    LoginViewTapButtonActionType_GetVerifyCode,
    LoginViewTapButtonActionType_Login
    
}LoginViewTapButtonActionType;

@protocol FotgetViewDelegate <NSObject>

@optional
/**
 *  获取验证码或登录
 *
 *  @param type LoginViewTapButtonActionType
 */
-(void)getVerifyCodeOrLogin:(LoginViewTapButtonActionType) type;


@end

@interface ForgetPasswordView : UIView

@property(nonatomic,strong) UITextField *phoneTextField;

@property(nonatomic,strong) UITextField *codeTextField;

@property(nonatomic,weak) id<FotgetViewDelegate> delegate;

@property(nonatomic,strong) NSTimer *timer;

@property(nonatomic,assign) int count;


-(void)beginTime:(int) count;

@end
