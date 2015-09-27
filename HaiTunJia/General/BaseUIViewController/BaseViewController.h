
/**************************************
 功能：父类ViewController,做controller
            公用部分,NavBar等
 备注：可根据需求定制
 **************************************/
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController


/**导航栏左边按钮*/
@property(nonatomic,strong) UIButton *leftButton;

/**导航栏右边边按钮*/
@property(nonatomic,strong) UIButton *rightButton;

@end
