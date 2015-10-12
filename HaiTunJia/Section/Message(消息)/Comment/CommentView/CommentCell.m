
#import "CommentCell.h"
#import "UIButton+WebCache.h"
@interface CommentCell ()

@property(nonatomic,strong) UIButton *avatarButton;

@property(nonatomic,strong) UILabel *name;

@property(nonatomic,strong) UILabel *time;

@property(nonatomic,strong) UILabel *content;

@property(nonatomic,strong) UIButton *commdityPic;

@property(nonatomic,strong) UIView *contentBgView;

@property(nonatomic,strong) UIView *line;

@end
@implementation CommentCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:self.avatarButton];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.commdityPic];
        [self.contentView addSubview:self.contentBgView];
        [self.contentBgView addSubview:self.content];
        [self.contentView addSubview:self.line];
    }
    return self;
}
-(UIButton *) avatarButton
{
    if (!_avatarButton)
    {
        _avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _avatarButton.frame = CGRectMake(15.0f, 11.0f, 40.0f, 40.0f);
        _avatarButton.layer.masksToBounds = YES;
        _avatarButton.layer.cornerRadius = 40.0f/2;
        [_avatarButton setBackgroundImage:[UIImage imageNamed:@"classfy_muying"] forState:UIControlStateNormal];
        [_avatarButton setBackgroundImage:[UIImage imageNamed:@"classfy_muying"] forState:UIControlStateHighlighted];
    }
    return _avatarButton;
}
-(UILabel *)time
{
    if (!_time)
    {
        NSString *string = @"海豚消息海豚海豚海豚海豚海豚海豚";
        UIFont *font = [UIFont systemFontOfSize:12.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _time = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarButton.right + 10.0f, self.name.bottom + 10, size.width, size.height)];
        _time.textColor = [UIColor colorWithHexString:@"94989d"];
        _time.textAlignment = NSTextAlignmentLeft;
        _time.backgroundColor = [UIColor clearColor];
        _time.font = font;

    }
    return _time;
}
-(UILabel *) content
{
    if (!_content)
    {
        _content = [[UILabel alloc]init];
        _content.textColor = [UIColor colorWithHexString:@"94989d"];
        _content.textAlignment = NSTextAlignmentLeft;
        _content.backgroundColor = [UIColor clearColor];
        _content.font = [UIFont systemFontOfSize:12.0f];
    }
    return _content;
}
-(UILabel *) name
{
    if (!_name)
    {
        NSString *string = @"海豚消息海豚消息海豚消息海豚消息";
        UIFont *font = [UIFont systemFontOfSize:16.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
       _name = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarButton.right + 10.0f, self.avatarButton.top, size.width, size.height)];
        _name.textColor = [UIColor colorWithHexString:@"626a73"];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.backgroundColor = [UIColor clearColor];
        _name.font = font;
    }
    return _name;
}
-(UIButton *) commdityPic
{
    if (!_commdityPic)
    {
        _commdityPic = [UIButton buttonWithType:UIButtonTypeCustom];
        _commdityPic.frame = CGRectMake(kScreenWidth - 15.0f - 50.0f, self.avatarButton.top, 50.0f, 34.0f);
        _commdityPic.backgroundColor = [UIColor clearColor];
    }
    return _commdityPic;
}
-(UIView *) contentBgView
{
    if (!_contentBgView)
    {
        _contentBgView = [[UIView alloc]init];
        _contentBgView.backgroundColor = [UIColor colorWithHexString:@"#f3f3f3"];
        _contentBgView.layer.masksToBounds = YES;
        _contentBgView.layer.cornerRadius = 6.0f;
    }
    return _contentBgView;
}
-(UIView *) line
{
    if (!_line)
    {
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
    }
    return _line;
}
-(void)setDataWithModel:(CommentsListModel *) commentModel
{
    self.name.text = commentModel.userName;
    self.time.text = commentModel.publishTime;
    [self.commdityPic sd_setBackgroundImageWithURL:[NSURL URLWithString:commentModel.commodityPic] forState:UIControlStateNormal];
    [self.commdityPic sd_setBackgroundImageWithURL:[NSURL URLWithString:commentModel.commodityPic] forState:UIControlStateHighlighted];
    NSString *contentStr = commentModel.content;
    CGFloat width =kScreenWidth - 15.0f -self.name.left;
    CGFloat height = [contentStr heightForWidth:width usingFont:self.content.font];
    self.content.frame = CGRectMake(10, 10, width, height);
    self.content.numberOfLines = 0;
    self.content.text = commentModel.content;
    self.contentBgView.frame = CGRectMake(self.name.left, self.time.bottom + 13.0f, width, height + 20);
    self.frame = CGRectMake(0, 0, kScreenWidth, self.contentBgView.bottom + 15);
    self.line.frame = CGRectMake(0, self.height - 0.5f, kScreenWidth, 0.5f);
}
@end
