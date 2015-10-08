
#import "BaseViewController.h"
#import "UIColor+Expanded.h"

static const CGFloat kBaseViewControllerLineHeight = 0.5f;
static const CGFloat kBaseViewControllerOffset   = 10.0f;

@interface BaseViewController ()

@property (nonatomic,strong) UILabel *navBarTitle;

@property(nonatomic,strong) UIView *navBarLine;

//判断导航头部图片切换
@property(nonatomic,assign) BOOL isTap;

@end

@implementation BaseViewController

#pragma mark -- lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = YES;
    //设置通用的背景颜色
//     self.view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.customNavigationBar];
    [self.customNavigationBar addSubview:self.leftBarButton];
    [self.customNavigationBar addSubview:self.rightBarButton];
    [self.customNavigationBar addSubview:self.navBarTitle];
    [self.customNavigationBar addSubview:self.navBarLine];
    [self.customNavigationBar addSubview:self.navTitleView];
    self.rightBarButton.hidden = YES;
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
        _customNavigationBar.userInteractionEnabled = YES;
    }
    return _customNavigationBar;
}
-(UILabel *)navBarTitle
{
    if (!_navBarTitle)
    {
        // 2.创建标题视图
//        UIImage *image = [UIImage imageNamed:@"icon_back"];
         _navBarTitle = [[UILabel alloc] initWithFrame:CGRectMake(44, 20 - kStatusBar_Height, kScreenWidth  - 88, 44)];
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
        _leftBarButton.frame= CGRectMake(kBaseViewControllerOffset, (44 - _leftBarButton.height) / 2.0 + (20 -kStatusBar_Height), _leftBarButton.width, _leftBarButton.height);
        // 添加按钮事件
        [_leftBarButton addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftBarButton;
}
- (UIButton *)leftButtonWithWord
{
    if(!_leftButtonWithWord)
    {
        // 创建返回按钮
        _leftButtonWithWord = [UIButton buttonWithType:UIButtonTypeCustom];
        [_leftButtonWithWord sizeToFit];
        _leftButtonWithWord.frame= CGRectMake(kBaseViewControllerOffset, (44 - _leftBarButton.height) / 2.0 + (20 -kStatusBar_Height), _leftBarButton.width, _leftBarButton.height);
        // 添加按钮事件
        _leftButtonWithWord.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_leftButtonWithWord setTitleColor:[UIColor colorWithHexString:@"a4a4ae"] forState:UIControlStateNormal];
        [_leftButtonWithWord setTitleColor:[UIColor colorWithHex:@"#a4a4ae" withAlpha:0.7f] forState:UIControlStateHighlighted];
        [_leftButtonWithWord addTarget:self action:@selector(goBackAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _leftButtonWithWord;
}

-(UIButton *) rightBarButton
{
    if (!_rightBarButton)
    {
        // 创建返回按钮
        _rightBarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 添加按钮事件
        [_rightBarButton addTarget:self action:@selector(rightButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBarButton;
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
-(UIButton *) navTitleView
{
    if (!_navTitleView)
    {
         UIImage *image =  [UIImage imageNamed:@"icon_xiala"];
        _navTitleView = [UIButton buttonWithType:UIButtonTypeCustom];
        _navTitleView.frame = CGRectMake(50, 20, kScreenWidth - 100, 44.0f);
        _navTitleView.imageEdgeInsets = UIEdgeInsetsMake((_navTitleView.height - image.size.height)/2,135, (_navTitleView.height - image.size.height)/2, 0);
        [_navTitleView setTitleEdgeInsets:UIEdgeInsetsMake(0, -35, 0, 0)];
        _navTitleView.hidden = YES;
        [_navTitleView setImage:image forState:UIControlStateNormal];
        [_navTitleView setImage:image forState:UIControlStateHighlighted];
        [_navTitleView setTitleColor:[UIColor colorWithHexString:@"626a73"] forState:UIControlStateNormal];
        [_navTitleView setTitleColor:[UIColor colorWithHexString:@"626a73"] forState:UIControlStateHighlighted];
        [_navTitleView addTarget:self action:@selector(tapTitleViewAction) forControlEvents:UIControlEventTouchUpInside];
        _navTitleView.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        _navTitleView.backgroundColor = [UIColor clearColor];
    }
    return _navTitleView;
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
-(void)setRightView:(NSObject *)rightView
{
    if ([rightView isKindOfClass:[UIImage class]])
    {
        UIImage *image = (UIImage *) rightView;
        self.rightBarButton.frame = CGRectMake(kScreenWidth - kBaseViewControllerOffset - image.size.width,(44 - image.size.height) / 2.0 + (20 -kStatusBar_Height) , image.size.width, image.size.height);
        [self.rightBarButton setBackgroundImage:image forState:UIControlStateNormal];
        [self.rightBarButton setBackgroundImage:image forState:UIControlStateHighlighted];
    }
    else if ([rightView isKindOfClass:[NSString class]])
    {
        NSString *string = (NSString *) rightView;
        UIFont *font = [UIFont systemFontOfSize:14.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        self.rightBarButton.frame = CGRectMake(kScreenWidth - kBaseViewControllerOffset - size.width,(44 - size.height) / 2.0 + (20 -kStatusBar_Height) , size.width, size.height);
        [self.rightBarButton setTitle:string forState:UIControlStateNormal];
        [self.rightBarButton setTitle:string forState:UIControlStateHighlighted];
        self.rightBarButton.titleLabel.font = font;
        [self.rightBarButton setTitleColor:[UIColor colorWithHexString:@"a4a4ae"] forState:UIControlStateNormal];
        [self.rightBarButton setTitleColor:[UIColor colorWithHex:@"#a4a4ae" withAlpha:0.7f] forState:UIControlStateHighlighted];
    }
}
-(void)setLeftButtonWithWordString:(NSString *)leftButtonWithWordString
{
//    self.leftButtonWithWordString = leftButtonWithWordString;
    [self.leftButtonWithWord setTitle:leftButtonWithWordString forState:UIControlStateNormal];
    [self.leftButtonWithWord setTitle:leftButtonWithWordString forState:UIControlStateNormal];
}
-(void)setNaTitle:(NSString *)naTitle
{
   
    [self.navTitleView setTitle:naTitle forState:UIControlStateNormal];
    [self.navTitleView setTitle:naTitle forState:UIControlStateHighlighted];
}
#pragma mark -- Action
-(void)goBackAction
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)rightButtonAction
{
    
}
-(void)tapTitleViewAction
{
    _isTap = !_isTap;
    if (_isTap == YES)
    {
        [self.navTitleView setImage:[UIImage imageNamed:@"icon_shangla"] forState:UIControlStateNormal];
        [self.navTitleView setImage:[UIImage imageNamed:@"icon_shangla"] forState:UIControlStateHighlighted];
    }
    else
    {
        [_navTitleView setImage:[UIImage imageNamed:@"icon_xiala"] forState:UIControlStateNormal];
        [_navTitleView setImage:[UIImage imageNamed:@"icon_xiala"] forState:UIControlStateHighlighted];
    }
}
@end
