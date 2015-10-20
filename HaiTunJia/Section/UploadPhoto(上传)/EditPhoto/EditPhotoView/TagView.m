
#import "TagView.h"


@interface TagView ()

@property(nonatomic,strong) UIImageView *smallDot;

@property(nonatomic,strong) UIImageView *contentView;

@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) NSString *title;

@property(nonatomic,assign) CGFloat position;

@end
@implementation TagView

-(id)initWithFrame:(CGRect)frame withDirection:(DotDirection) directon
{
    self = [super initWithFrame:frame];
    if (self)
    {
            [self addSubview:self.smallDot];
            [self addSubview:self.contentView];
            [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

-(UIImageView *) smallDot
{
    if (!_smallDot)
    {
        _smallDot = [[UIImageView alloc]init];
        _smallDot.backgroundColor = [UIColor clearColor];
    }
    return _smallDot;
}
-(UILabel *) titleLabel
{
    if (!_titleLabel)
    {
       _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.font = [UIFont systemFontOfSize:12.0f];
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}
-(UIImageView *) contentView
{
    if (!_contentView)
    {
        _contentView = [[UIImageView alloc]init];
        _contentView.backgroundColor = [UIColor clearColor];
    }
    return _contentView;
}
-(void)reloadViewWithString:(NSString *) string withXPosition:(CGFloat) position withSuperViewWidth:(CGFloat) width withDirection:(DotDirection) direction
{
    if (direction == DotDirection_Left)
    {
        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil];
        CGSize size = [string boundingRectWithSize:CGSizeMake(width - position - 10.0f, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    }
    else
    {
        
    }
   
}
@end
