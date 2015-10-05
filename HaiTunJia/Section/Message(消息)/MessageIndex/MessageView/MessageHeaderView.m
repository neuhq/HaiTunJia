

#import "MessageHeaderView.h"
#import "MessageViewCell.h"

@interface MessageHeaderView ()

//图片
@property(nonatomic,strong) UIImageView *imageView;

//标题
@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UIView *bgView;

@end

@implementation MessageHeaderView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.imageView];
        [self.bgView addSubview:self.title];
    }
    return self;
}

-(UIView *) bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, kMessageViewCellOffset, kScreenWidth, kMessageViewCellOffset + kMessageViewCellForListTypeHeight)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
-(UIImageView *) imageView
{
    if (!_imageView)
    {
        UIImage *image = [UIImage imageNamed:@"list_activity"];
        _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20.0f, (self.bgView.height - image.size.height)/2, image.size.width, image.size.height)];
        _imageView.image = image;
        _imageView.backgroundColor = [UIColor clearColor];
    }
    return _imageView;
}
-(UILabel *) title
{
    if (!_title)
    {
        NSString *string = @"专题活动";
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14.0f]}];
        _title = [[UILabel alloc]initWithFrame:CGRectMake(self.imageView.right + 10, (self.bgView.height - size.height)/2 , size.width, size.height)];
        _title.text = string;
        _title.textAlignment = NSTextAlignmentLeft;
        _title.font = [UIFont systemFontOfSize:14.0f];
        _title.textColor = [UIColor colorWithHexString:@"626a73"];
        _title.backgroundColor = [UIColor clearColor];
    }
    return _title;
}
@end
