
#import "MessageViewCell.h"
#import "UIImageView+WebCache.h"
const CGFloat kMessageViewCellForListTypeHeight = 44.0f;

const CGFloat kMessageViewCellForImageTypeHeight = 174.0f;

const CGFloat kMessageViewCellLeftOffset  = 20.0f;

const CGFloat kMessageViewCellRightOffset = 15.0f;

const CGFloat kMessageViewCellOffset = 9.0f;

@interface MessageViewCell ()

@property(nonatomic,assign) TableViewCellType cellType;

@property(nonatomic,strong) UIView *bgView;

@end
@implementation MessageViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellType:(TableViewCellType)cellType
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.cellType = cellType;
        if (cellType == TableViewCellType_List)
        {
            [self.contentView addSubview:self.leftImageView];
            [self.contentView addSubview:self.text];
            [self.contentView addSubview:self.rightImgeView];
            [self.contentView addSubview:self.messageNumButton];
            self.backgroundColor = [UIColor whiteColor];

        }
        else
        {
            self.backgroundColor = [UIColor clearColor];
            [self.contentView addSubview:self.bgView];
            [self.bgView addSubview:self.activityImageView];
        }
    }
    return self;
}

#pragma mark -- UI
-(UIImageView *) leftImageView
{
    if (!_leftImageView)
    {
        UIImage *image = [UIImage imageNamed:@"list_man"];
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kMessageViewCellLeftOffset, (kMessageViewCellForListTypeHeight - image.size.height)/2, image.size.width, image.size.height)];
        _leftImageView.backgroundColor = [UIColor clearColor];
    }
    return _leftImageView;
}
-(UILabel *) text
{
    if (!_text)
    {
        NSString *string = @"新的粉丝";
        UIFont *font = [UIFont systemFontOfSize:14.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _text = [[UILabel alloc]initWithFrame:CGRectMake(self.leftImageView.right + 10.0f, (kMessageViewCellForListTypeHeight - size.height)/2, size.width, size.height)];
        _text.text = string;
        _text.textAlignment = NSTextAlignmentLeft;
        _text.font = font;
        _text.textColor = [UIColor colorWithHexString:@"626a74"];
        _text.backgroundColor = [UIColor clearColor];
    }
    return _text;
}
-(UIButton *) messageNumButton
{
    if (!_messageNumButton)
    {
        _messageNumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _messageNumButton.layer.masksToBounds = YES;
        _messageNumButton.layer.cornerRadius = 11.0f;
        _messageNumButton.backgroundColor = [UIColor colorWithHexString:@"3299cc"];
        [_messageNumButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_messageNumButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
        _messageNumButton.titleLabel.font = [UIFont systemFontOfSize:11.0f];
    }
    return _messageNumButton;
}
-(UIImageView *) rightImgeView
{
    if (!_rightImgeView)
    {
        UIImage *image = [UIImage imageNamed:@"list_arrow"];
        _rightImgeView = [[UIImageView alloc]initWithFrame:CGRectMake(kScreenWidth - image.size.width, (kMessageViewCellForListTypeHeight - image.size.height)/2, image.size.width, image.size.height)];
        _rightImgeView.image = image;
        _rightImgeView.backgroundColor = [UIColor clearColor];
    }
    return _rightImgeView;
}

-(UIView *) bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kMessageViewCellForImageTypeHeight + kMessageViewCellOffset)];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}
-(UIImageView *) activityImageView
{
    if (!_activityImageView)
    {
        _activityImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kMessageViewCellForImageTypeHeight)];
        _activityImageView.backgroundColor = [UIColor clearColor];
    }
    return _activityImageView;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    if (self.cellType == TableViewCellType_List)
    {
        _leftImageView.image = [self.dataDic objectForKey:@"image"];
        _text.text = [self.dataDic objectForKey:@"title"];
//        self.messageNum = @"10000";
        CGSize size = [self.messageNum sizeWithAttributes:@{NSFontAttributeName:self.messageNumButton.titleLabel.font}];
        self.messageNumButton.frame = CGRectMake(kScreenWidth - self.rightImgeView.width - 7.0f - size.width, (kMessageViewCellForListTypeHeight - (size.height +10))/2, size.width + 10, size.height + 10);
        [self.messageNumButton setTitle:self.messageNum forState:UIControlStateNormal];
    }
    else
    {
        [self.activityImageView sd_setImageWithURL:[NSURL URLWithString:@"http://p1.so.qhimg.com/t01a430ba22a2f43b0b.jpg"] placeholderImage:nil];
    }
}
@end
