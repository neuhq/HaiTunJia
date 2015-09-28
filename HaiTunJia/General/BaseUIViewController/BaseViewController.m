
#import "BaseViewController.h"
#import "UIColor+Expanded.h"
@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark -- lift cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置通用的背景颜色
    self.view.backgroundColor = [UIColor colorWithHexString:@"efeff4"];
    
    [self.navigationItem setHidesBackButton:YES];
    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -- UI
//导航栏左边按钮
-(UIButton *) leftButton
{
    if(!_leftButton)
    {
        _leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _leftButton.frame = CGRectMake(0, 20, 45, 45);
        _leftButton.backgroundColor = [UIColor redColor];
        [_leftButton addTarget: self action: @selector(goBackAction) forControlEvents: UIControlEventTouchUpInside];
        UIBarButtonItem*back=[[UIBarButtonItem alloc]initWithCustomView:_leftButton];
        self.navigationItem.leftBarButtonItem=back;
    }
    return _leftButton;
}


#pragma mark -- Action
-(void)goBackAction
{
    
}
@end
