/***************************
 功能：登陆页
 说明：
 *************************/
#import "BaseViewController.h"

typedef void(^LoginEndBlock)();
@interface LoginViewController : BaseViewController

@property(nonatomic,copy) LoginEndBlock endBlock;

@end
