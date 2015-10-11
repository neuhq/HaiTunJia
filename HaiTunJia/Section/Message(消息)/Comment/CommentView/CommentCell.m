
#import "CommentCell.h"
#import "UIButton+WebCache.h"
@interface CommentCell ()

@property(nonatomic,strong) UIButton *avatarButton;

@property(nonatomic,strong) UILabel *name;

@property(nonatomic,strong) UILabel *time;

@property(nonatomic,strong) UILabel *content;

@property(nonatomic,strong) UIButton *commdityPic;

@property(nonatomic,strong) UIView *contentBgView;

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
        [self.contentView addSubview:self.avatarButton];
        [self.contentView addSubview:self.name];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.commdityPic];
        [self.contentView addSubview:self.contentBgView];
        [self.contentBgView addSubview:self.content];
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
    }
    return _avatarButton;
}
-(UILabel *)time
{
    if (!_time)
    {
        NSString *string = @"海豚消息海豚海豚海豚海豚海豚海豚";
        UIFont *font = [UIFont systemFontOfSize:16.0f];
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
-(void)setDataWithModel:(CommentsListModel *) commentModel
{
//    [self.avatarButton sd_setImageWithURL:[NSURL URLWithString:commentModel] forState:<#(UIControlState)#>]
}
@end
