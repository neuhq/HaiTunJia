


#import "MyFansViewCell.h"
#import "MyFansListModel.h"
#import "UIImageView+WebCache.h"
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
        _avatarImageView.backgroundColor = [UIColor clearColor];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = 20.0f;
    }
    return _avatarImageView;
}

-(UILabel *) name
{
    if (!_name)
    {
        NSString *string = @"海豚小溪海豚消息海豚消息";
        UIFont *font = [UIFont systemFontOfSize:16.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _name = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.avatarImageView.top, size.width, size.height)];
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
        _content = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.name.bottom + 10.0f,kScreenWidth - self.avatarImageView.right - 10.0f - self.concern.width - 20.0f, size.height)];
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
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.dataModel.userPic] placeholderImage:nil];
    self.name.text = self.dataModel.userName;
    self.content.text = self.dataModel.publishTime;
}
@end
