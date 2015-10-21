
#import <UIKit/UIKit.h>
#import "PublishModel.h"

typedef NS_ENUM(NSInteger, DotDirection){
    DotDirection_Left,
    DotDirection_Right
};
@interface TagView : UIView

-(void)reloadViewWithString:(PublishModel *) publishModel withXPosition:(CGFloat) position withSuperViewWidth:(CGFloat) width withDirection:(DotDirection) direction;

-(CGFloat)reloadTagViewWidth;

@end
