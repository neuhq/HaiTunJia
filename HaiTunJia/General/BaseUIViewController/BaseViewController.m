
#import "BaseViewController.h"
#import "UIColor+Expanded.h"

static const CGFloat kBaseViewControllerLineHeight = 0.5f;

@interface BaseViewController ()

@property (nonatomic,strong) UILabel *navBarTitle;

@property(nonatomic,strong) UIView *navBarLine;

@end

@implementation BaseViewController

#pragma mark -- lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    //设置通用的背景颜色
     self.view.backgroundColor = [UIColor colorWithHexString:@"ffffff"];
    [self.view addSubview:self.customNavigationBar];
    [self.customNavigationBar addSubview:self.leftBarButton];
    [self.customNavigationBar addSubview:self.navBarTitle];
    [self.customNavigationBar addSubview:self.navBarLine];
}
- (void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- UI
// 创建导航栏
- (UIView *)customNavigationBar
{
    if (!_customNavigationBar)
    {
        // 1.创建导航栏
        _customNavigationBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kNavigationBarHeight)];
        _customNavigationBar.backgroundColor = [UIColor whiteColor];
        _customNavigationBar.userInteractionEnabled = YES;
    }
    return _customNavigationBar;
}
-(UILabel *)navBarTitle
{
    if (!_navBarTitle)
    {
        // 2.创建标题视图
        UIImage *image = [UIImage imageNamed:@"icon_back"];
         _navBarTitle = [[UILabel alloc] initWithFrame:CGRectMake(self.leftBarButton.right, 20 - kStatusBar_Height, kScreenWidth - 40 - 2*image.size.width, 44)];
        _navBarTitle.backgroundColor = [UIColor clearColor];
        _navBarTitle.textColor = [UIColor colorWithHexString:@"626a73"];
        _navBarTitle.font = [UIFont boldSystemFontOfSize:17];
        _navBarTitle.textAlignment = NSTextAlignmentCenter;

    }
    return _navBarTitle;
}
// 创建返回按钮
- (UIButton *)leftBarButton
{
    if(!_leftBarButton)
    {
        // 创建返回按钮
        _leftBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 设置按钮图片
        [_leftBarButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [_leftBarButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateHighlighted];
        [_leftBarButton sizeToFit];
        _leftBarButton.frame= CGRectMake(10, (44 - _leftBarButton.height) / 2.0 + (20 -kStatusBar_Height), _leftBarButton.width, _leftBarButton.height);
        // 添加按钮事件
        [_leftBarButton addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBarButton;
}

-(UIView *)navBarLine
{
    if (!_navBarLine)
    {
        _navBarLine = [[UIView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight - kBaseViewControllerLineHeight, kScreenWidth, kBaseViewControllerLineHeight)];
        _navBarLine.backgroundColor = [UIColor colorWithHexString:@"ced3d9"];
    }
    return _navBarLine;
}
#pragma mark - helper
//重写title
- (void)setTitle:(NSString *)title
{
    [super setTitle:title];
    self.navBarTitle.text = title;
}
//是否隐藏bar横线
-(void)setIsLineHiden:(BOOL)isLineHiden
{
    self.navBarLine.hidden = isLineHiden;
}
//是否隐藏导航栏
-(void)setIsNavigationBar:(BOOL)isNavigationBar
{
    self.customNavigationBar.hidden = isNavigationBar;
}
//是否隐藏tabbar
-(void)hideTabbar:(BOOL) isHiden
{
    AppDelegate * appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [appDelegate.leveyTabBarController  hidesTabBar:isHiden animated:YES];

}
#pragma mark -- Action
-(void)goBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
@end
