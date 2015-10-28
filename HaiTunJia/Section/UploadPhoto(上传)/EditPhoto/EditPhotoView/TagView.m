
#import "TagView.h"


@interface TagView ()

@property(nonatomic,strong) UIImageView *smallDot;

@property(nonatomic,strong) UIImageView *contentView;

@property(nonatomic,strong) UILabel *titleLabel;

@property(nonatomic,strong) NSString *title;

@property(nonatomic,assign) CGFloat position;

@end
@implementation TagView

-(id)initWithFrame:(CGRect)frame
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
-(void)reloadViewWithString:(PublishModel *) publishModel withXPosition:(CGFloat) position withSuperViewWidth:(CGFloat) width withDirection:(DotDirection) direction;
{
    UIImage *dotImage = [UIImage imageNamed:@"label_dot_small"];
    UIImage *smallBg = [UIImage imageNamed:@"label_leftbg_small"];
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:14],NSFontAttributeName, nil];
    if([publishModel.name isEqualToString:@""] && [publishModel.price isEqualToString:@""] && [publishModel.moneyType isEqualToString:@""])
        return;
    
    if (direction == DotDirection_Left)
    {
        CGFloat viewWidth = width - position - 10 - 10;
        NSString *string = [NSString stringWithFormat:@"%@%@%@",publishModel.name,publishModel.price,publishModel.moneyType];
        CGSize size = [string boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        CGSize sizeHeight = [string sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        self.smallDot.frame = CGRectMake(0, (smallBg.size.height - dotImage.size.height)/2, dotImage.size.width, dotImage.size.height);
        self.smallDot.image = dotImage;
        self.titleLabel.frame = CGRectMake(10, ((smallBg.size.height - sizeHeight.height)/2), size.width, sizeHeight.height);
        self.titleLabel.text = string;
        
        smallBg = [smallBg stretchableImageWithLeftCapWidth:10 topCapHeight:0];
        self.contentView.frame = CGRectMake(self.smallDot.right, 0, self.titleLabel.width + 10, smallBg.size.height);
        self.contentView.image = smallBg;
    }
    else
    {
        UIImage *image = [UIImage imageNamed:@"label_rightbg_small"];
        CGFloat viewWidth = position - 10 - 10;
        NSString *string = [NSString stringWithFormat:@"%@%@%@%@",publishModel.name,publishModel.price,publishModel.moneyType,publishModel.source];
        CGSize size = [string boundingRectWithSize:CGSizeMake(viewWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
        CGSize sizeHeight = [string sizeWithAttributes:@{NSFontAttributeName:self.titleLabel.font}];
        self.titleLabel.frame = CGRectMake(0, ((image.size.height - sizeHeight.height)/2), size.width, sizeHeight.height);
        self.titleLabel.text = string;
//        self.titleLabel.numberOfLines = 1;
//        [self.titleLabel sizeToFit];
        image = [image stretchableImageWithLeftCapWidth:10 topCapHeight:0];
        self.contentView.frame = CGRectMake(0, 0, size.width + 10, image.size.height);
        self.contentView.image = image;
        self.smallDot.frame = CGRectMake(self.contentView.right, (image.size.height - dotImage.size.height)/2, dotImage.size.width, dotImage.size.height);
        self.smallDot.image = dotImage;
    }
    
  
   
}
-(CGFloat)reloadTagViewWidth
{
    CGFloat  width = self.smallDot.width + self.contentView.width;
    return width;
}
@end
