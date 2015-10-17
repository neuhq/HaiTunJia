
#import "TagView.h"


@interface TagView ()

@property(nonatomic,strong) UIImageView *smallDot;

@property(nonatomic,strong) UIImageView *contentView;


@end
@implementation TagView

-(id)initWithFrame:(CGRect)frame 
{
    self = [super initWithFrame:frame];
    if (self)
    {
        
    }
    return self;
}

-(UIImageView *) smallDot
{
    if (!_smallDot)
    {
        
    }
    return _smallDot;
}
-(UIImageView *) contentView
{
    if (!_contentView)
    {
        
    }
    return _contentView;
}
@end
