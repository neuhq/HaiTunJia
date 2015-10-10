
/**************************************
 功能：父类ViewController,做controller
            公用部分,NavBar等
 备注：可根据需求定制
 **************************************/
#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

// 自定导航栏
@property (nonatomic, strong) UIView *customNavigationBar;

// 返回按钮
@property (nonatomic, assign) BOOL isBackButton;

// 是否有导航控制器
@property (nonatomic, assign) BOOL isNavigationBar;

// 左侧导航栏按钮
@property (nonatomic, strong) UIButton *leftBarButton;

//左边按钮文字模式
@property (nonatomic,strong) UIButton *leftButtonWithWord;

@property (nonatomic,strong) NSString *leftButtonWithWordString;

// 右侧导航栏按钮
@property (nonatomic, strong) UIButton *rightBarButton;

//是否隐藏横线
@property (nonatomic,assign) BOOL isLineHiden;

@property (nonatomic,strong) id rightView;

@property (nonatomic,strong) UIButton *navTitleView;

@property (nonatomic,strong) NSString *navTitle;

//判断导航头部图片切换
@property(nonatomic,assign) BOOL isTapNavBarTitleView;

@property(nonatomic,assign) BOOL isLoadView;

/**
 *  重写navBarTitle方法
 *
 *  @param title title description
 */
- (void)setTitle:(NSString *)title;

/**
 *  是否隐藏tabbar
 *
 *  @param isHiden yes or no
 */
-(void)hideTabbar:(BOOL) isHiden;

/**
 *  重写navBarTitleView点击方法
 */
-(void)tapTitleViewAction;


-(void)rightButtonAction;

-(void)goBackAction;

@end
