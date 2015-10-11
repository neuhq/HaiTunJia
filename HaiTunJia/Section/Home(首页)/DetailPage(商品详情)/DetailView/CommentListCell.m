
#import "CommentListCell.h"
#import "UIButton+WebCache.h"
const CGFloat kCommentListCellLeftOffset    =  15.0f;
const CGFloat kCommentListCellTopOffset    =  15.0f;

@interface CommentListCell ()

@property(nonatomic,strong) UILabel *hot;

@property(nonatomic,strong) UIButton *avatarButton;

@property(nonatomic,strong) UILabel *content;

@property(nonatomic,strong) UILabel *praiseNum;

@property(nonatomic,strong) UIButton *praiseButton;

@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UILabel *time;

@property(nonatomic,strong) UIView *line;

@end
@implementation CommentListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self.contentView addSubview:self.hot];
        [self.contentView addSubview:self.avatarButton];
        [self.contentView addSubview:self.content];
        [self.contentView addSubview:self.praiseNum];
        [self.contentView addSubview:self.praiseButton];
        [self.contentView addSubview:self.time];
        [self.contentView addSubview:self.title];
        [self.contentView addSubview:self.line];
    }
    return self;
}
-(UILabel *) hot
{
    if (!_hot)
    {
        NSString *string = @"热门评论";
        UIFont *font = [UIFont systemFontOfSize:11.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _hot = [[UILabel alloc]initWithFrame:CGRectMake(kCommentListCellLeftOffset, kCommentListCellTopOffset, size.width, size.height)];
        _hot.textColor = [UIColor colorWithHexString:@"b6babf"];
        _hot.textAlignment = NSTextAlignmentLeft;
        _hot.backgroundColor = [UIColor clearColor];
        _hot.font = font;
    }
    return _hot;
}
-(UILabel *) content
{
    if (!_content)
    {
        UIFont *font = [UIFont systemFontOfSize:15.0f];
        _content = [[UILabel alloc]init];
        _content.textColor = [UIColor colorWithHexString:@"b6babf"];
        _content.textAlignment = NSTextAlignmentCenter;
        _content.backgroundColor = [UIColor clearColor];
        _content.font = font;

    }
    return _content;
}
-(UILabel *) title
{
    if (!_title)
    {
        UIFont *font = [UIFont systemFontOfSize:16.0f];
        _title = [[UILabel alloc]init];
        _title.textColor = [UIColor colorWithHexString:@"626a73"];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.backgroundColor = [UIColor clearColor];
        _title.font = font;

    }
    return _title;
}
-(UIButton *) avatarButton
{
    if (!_avatarButton)
    {
        _avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _avatarButton.backgroundColor = [UIColor clearColor];
        _avatarButton.layer.masksToBounds = YES;
        _avatarButton.layer.cornerRadius = 30.0/2;
    }
    return _avatarButton;
}
-(UILabel *) praiseNum
{
    if (!_praiseNum)
    {
        UIFont *font = [UIFont systemFontOfSize:11.0f];
        _praiseNum = [[UILabel alloc]init];
        _praiseNum.textColor = [UIColor colorWithHexString:@"d0d0d6"];
        _praiseNum.textAlignment = NSTextAlignmentCenter;
        _praiseNum.backgroundColor = [UIColor clearColor];
        _praiseNum.font = font;
    }
    return _praiseNum;
}
-(UIButton *) praiseButton
{
    if (!_praiseButton)
    {
        _praiseButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _praiseButton.backgroundColor = [UIColor clearColor];
    }
    return _praiseButton;
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
-(void)setCellDataWithCommentModel:(CommentsModel *) commentsModel row:(NSInteger) row
{
    if (row ==0)
    {
        self.hot.text = @"热门评论";
        self.hot.hidden = NO;
        self.avatarButton.frame = CGRectMake(kCommentListCellLeftOffset, self.hot.bottom + 13.0f, 30.0f, 30.0f);

    }
    else if (row == 1)
    {
        self.hot.text = @"所有评论";
        self.hot.hidden = NO;
        self.avatarButton.frame = CGRectMake(kCommentListCellLeftOffset, self.hot.bottom + 13.0f, 30.0f, 30.0f);

    }
    else
    {
        self.hot.hidden = YES;
        self.avatarButton.frame = CGRectMake(kCommentListCellLeftOffset,  13.0f, 30.0f, 30.0f);
    }
    [self.avatarButton sd_setImageWithURL:[NSURL URLWithString:commentsModel.userPic] forState:UIControlStateNormal];
    [self.avatarButton sd_setImageWithURL:[NSURL URLWithString:commentsModel.userPic] forState:UIControlStateHighlighted];
    
    NSString *titleString = commentsModel.userName;
    CGSize titleSize = [titleString sizeWithAttributes:@{NSFontAttributeName:self.title.font}];
    self.title.frame = CGRectMake(self.avatarButton.right + 8, self.avatarButton.top, titleSize.width, titleSize.height);
    self.title.text = titleString;
    
    NSString *content = commentsModel.content;
    CGFloat width = kScreenWidth - kCommentListCellLeftOffset - self.title.left;
    CGFloat height = [content heightForWidth:width usingFont:self.title.font];
    self.content.frame = CGRectMake(self.title.left, self.title.bottom + 15.0f,width,height);
    self.content.numberOfLines = 0;
    self.content.text = content;
    [self.content sizeToFit];
    
    self.frame = CGRectMake(0, 0, kScreenWidth, self.content.bottom + kCommentListCellLeftOffset);
    self.line.frame = CGRectMake(0, self.height - 0.5f, kScreenWidth, 0.5f);
    
}
@end
