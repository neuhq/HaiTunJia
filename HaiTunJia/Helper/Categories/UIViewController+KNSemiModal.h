

#define kSemiModalAnimationDuration   0.5

@interface UIViewController (KNSemiModal)   //动画导演类

-(void)presentSemiViewController:(UIViewController*)vc;
-(void)presentSemiView:(UIView*)vc;
-(void)dismissSemiModalView;

@end
