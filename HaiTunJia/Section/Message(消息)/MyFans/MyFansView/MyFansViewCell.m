


#import "MyFansViewCell.h"

const CGFloat kMyFansViewCellLeftOffset   =  15.0f;
const CGFloat kMyFansViewCellHeight = 65.0f;

@implementation MyFansViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        [self.contentView addSubview:self.avatarImageView];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.line];
        [self.contentView addSubview:self.concern];
    }
    return self;
}
#pragma mark -- UI
-(UIImageView *) avatarImageView
{
    if (!_avatarImageView)
    {
        _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kMyFansViewCellLeftOffset, (kMyFansViewCellHeight - 40.0f)/2, 40.0f, 40.0f)];
        _avatarImageView.image = [UIImage imageNamed:@"classfy_muying"];
        _avatarImageView.backgroundColor = [UIColor clearColor];
    }
    return _avatarImageView;
}

-(UILabel *) name
{
    if (!_name)
    {
        NSString *string = @"海豚小溪";
        UIFont *font = [UIFont systemFontOfSize:16.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _name = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.avatarImageView.top, size.width, size.height)];
        _name.text = string;
        _name.textAlignment = NSTextAlignmentLeft;
        _name.textColor = [UIColor colorWithHexString:@"626a73"];
        _name.font = font;
        _name.backgroundColor = [UIColor clearColor];
    }
    return _name;
}
-(UILabel *) content
{
    if (!_content)
    {
        NSString *string = @"我的地盘我做主";
        UIFont *font = [UIFont systemFontOfSize:11.0f   ];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _content = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.name.bottom + 10.0f, size.width, size.height)];
        _content.text = string;
        _content.textAlignment = NSTextAlignmentLeft;
        _content.textColor = [UIColor colorWithHexString:@"989fa6"];
        _content.font = font;
        _content.backgroundColor = [UIColor clearColor];
    }
    return _content;

}
-(UIButton *) concern
{
    if (!_concern)
    {
        _concern = [UIButton buttonWithType:UIButtonTypeCustom];
        _concern.frame =CGRectMake(kScreenWidth - kMyFansViewCellLeftOffset - 50.0f, (kMyFansViewCellHeight - 30)/2, 50.0f, 30.0f);
        _concern.backgroundColor = [UIColor whiteColor];
        _concern.layer.masksToBounds = YES;
        _concern.layer.cornerRadius = 6.0f;
        _concern.layer.borderWidth = 0.5f;
        _concern.layer.borderColor = [[UIColor colorWithHexString:@"ced3d9"] CGColor];
        [_concern setTitle:@"关注" forState:UIControlStateNormal];
        [_concern setTitle:@"关注" forState:UIControlStateHighlighted];
        _concern.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_concern setTitleColor:[UIColor colorWithHexString:@"'626a73"] forState:UIControlStateNormal];
        [_concern setTitleColor:[UIColor colorWithHexString:@"'626a73"] forState:UIControlStateHighlighted];
    }
    return _concern;
}

-(UIView *) line
{
    if (!_line)
    {
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, kMyFansViewCellHeight - 0.5f, kScreenWidth, 0.5f)];
        _line.backgroundColor = [UIColor colorWithHexString:@"ced3d9"];
    }
    return _line;
}
@end
