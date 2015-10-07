
#import "NoteDetailInfoCell.h"
#import "UIImageView+WebCache.h"
#import "DWTagList.h"
const CGFloat kNoteDetailInfoCellFirstPartHeight  = 60.0f;
const CGFloat kNoteDetailInfoCellAvatarImageViewHeight   = 40.0f;
const CGFloat kNoteDetailInfoCellLeftOffset   = 15.0f;

@interface NoteDetailInfoCell ()

//上部背景
@property(nonatomic,strong) UIView *topView;

//中部背景
@property(nonatomic,strong) UIView *middleView;

//下部背景
@property(nonatomic,strong) UIView *bottomView;

//头像
@property(nonatomic,strong) UIImageView *avatarImageView;

//姓名
@property(nonatomic,strong) UILabel *name;

//地址
@property(nonatomic,strong) UILabel *address;

//关注
@property(nonatomic,strong) UIButton *concern;

//商品图
@property(nonatomic,strong) UIImageView *goodsImageView;

//文本
@property(nonatomic,strong) UILabel *content;

//标签图片
@property(nonatomic,strong) UIImageView *tagImageView;

//标签
@property(nonatomic,strong) DWTagList *tagView;

//时间图
@property(nonatomic,strong) UIImageView *timeImageView;

//发布时间
@property(nonatomic,strong) UILabel *time;

@property(nonatomic,strong) NSArray *tagArray;

//喜欢或赞
@property(nonatomic,strong) UILabel *commentAndLike;

//喜欢或赞的图片
@property(nonatomic,strong) UIButton *commentAndLikeImagevView;

@property(nonatomic,strong) UIView *line1;

@property(nonatomic,strong) UIView *line2;

@end

@implementation NoteDetailInfoCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withCellType:(DetailCellType)cellType
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        if (cellType == DetailCellType_NoteInfo)
        {
            [self initViews];
            self.tagArray = [NSArray arrayWithObjects:@"巴黎春天百货",@"时尚艺术",@"历史古迹",@"新艺术肢体",@"展览",@"新型服装",@"美女",@"世博会",@"琅琊榜", nil];
            [self cellConfig];
            
            [self.contentView addSubview:self.topView];
            [self.contentView addSubview:self.bottomView];
            [self.topView addSubview:self.avatarImageView];
            [self.topView addSubview:self.name];
            [self.topView addSubview:self.address];
            [self.topView addSubview:self.concern];
            [self.middleView addSubview:self.goodsImageView];
            [self.middleView addSubview:self.content];
            [self.contentView addSubview:self.middleView];
            
            [self.bottomView addSubview:self.tagImageView];
            [self.bottomView addSubview:self.tagView];
            [self.bottomView addSubview:self.timeImageView];
            [self.bottomView addSubview:self.time];
        }
        else
        {
//            [self.contentView addSubview:self.line1];
//            [self.contentView addSubview:self.commentAndLike];
//            [self.contentView addSubview:self.line2];
        }
    }
    return self;
}
-(void)cellConfig
{
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    self.backgroundColor = [UIColor whiteColor];
}
#pragma mark -- UI

-(void)initViews
{
    _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kNoteDetailInfoCellFirstPartHeight)];
    _topView.backgroundColor = [UIColor whiteColor];
    
    _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kNoteDetailInfoCellLeftOffset, (kNoteDetailInfoCellFirstPartHeight - kNoteDetailInfoCellAvatarImageViewHeight)/2, kNoteDetailInfoCellAvatarImageViewHeight, kNoteDetailInfoCellAvatarImageViewHeight)];
    _avatarImageView.image = [UIImage imageNamed:@"classfy_muying"];
    _avatarImageView.backgroundColor = [UIColor clearColor];
    
    NSString *string = @"海豚小溪";
    UIFont *font = [UIFont systemFontOfSize:16.0f];
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
    _name = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.avatarImageView.top, size.width, size.height)];
    _name.text = string;
    _name.textAlignment = NSTextAlignmentLeft;
    _name.textColor = [UIColor colorWithHexString:@"626a73"];
    _name.font = font;
    _name.backgroundColor = [UIColor clearColor];

    string = @"北京，海淀区，上地十街";
    font = [UIFont systemFontOfSize:11.0f   ];
    size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
    _address = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.name.bottom + 10.0f, size.width, size.height)];
    _address.text = string;
    _address.textAlignment = NSTextAlignmentLeft;
    _address.textColor = [UIColor colorWithHexString:@"aeaeb2"];
    _address.font = font;
    _address.backgroundColor = [UIColor clearColor];
    
    _concern = [UIButton buttonWithType:UIButtonTypeCustom];
    _concern.frame =CGRectMake(kScreenWidth - kNoteDetailInfoCellLeftOffset - 50.0f, (kNoteDetailInfoCellFirstPartHeight - 27.0f)/2, 55.0f, 27.0f);
    _concern.backgroundColor = [UIColor whiteColor];
    _concern.layer.masksToBounds = YES;
    _concern.layer.cornerRadius = 4.0f;
    _concern.layer.borderWidth = 0.5f;
    _concern.layer.borderColor = [[UIColor colorWithHexString:@"aeaeb2"] CGColor];
    [_concern setTitle:@"关注" forState:UIControlStateNormal];
    [_concern setTitle:@"关注" forState:UIControlStateHighlighted];
    _concern.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [_concern setTitleColor:[UIColor colorWithHexString:@"'aeaeb2"] forState:UIControlStateNormal];
    [_concern setTitleColor:[UIColor colorWithHexString:@"'aeaeb2"] forState:UIControlStateHighlighted];
    [_concern setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    _middleView = [[UIView alloc]init];
    _middleView.backgroundColor = [UIColor whiteColor];
    
    _goodsImageView = [[UIImageView alloc]init];
    _goodsImageView.backgroundColor = [UIColor whiteColor];
    
    _content = [[UILabel alloc]init];
    _content.textColor = [UIColor colorWithHexString:@"626a73"];
    _content.textAlignment = NSTextAlignmentCenter;
    _content.font = [UIFont systemFontOfSize:14.0f];

    UIImage *image = [UIImage imageNamed:@"icon_labelcolor"];
    _tagImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kNoteDetailInfoCellLeftOffset, 0, image.size.width, image.size.height)];
    _tagImageView.image = image;
    _tagImageView.backgroundColor = [UIColor clearColor];
    
    _tagView = [[DWTagList alloc]init];

    _timeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_clock"]];
    _timeImageView.backgroundColor = [UIColor clearColor];

    _time = [[UILabel alloc]init];
    _time.textColor = [UIColor colorWithHexString:@"b6babf"];
    _time.textAlignment = NSTextAlignmentLeft;
    _time.font = [UIFont systemFontOfSize:11.0f];
    _time.backgroundColor = [UIColor whiteColor];
    
    _bottomView = [[UIView alloc]init];
    _bottomView.backgroundColor = [UIColor whiteColor];

//    _commentAndLike = [[UILabel alloc]init];
//    _commentAndLike.textColor = [UIColor colorWithHexString:@"b6babf"];
//    _commentAndLike.textAlignment = NSTextAlignmentLeft;
//    _commentAndLike.font = [UIFont systemFontOfSize:11.0f];
//    _commentAndLike.backgroundColor = [UIColor whiteColor];
//    
//    _line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 31, kScreenWidth, 0.5f)];
//    _line1.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
//    
//    _line2 = [[UIView alloc]init];
//    _line2.backgroundColor = [UIColor colorWithHexString:@"cccccf"];

    
    
}
//-(UIView *) topView
//{
//    if (!_topView)
//    {
//        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kNoteDetailInfoCellFirstPartHeight)];
//        _topView.backgroundColor = [UIColor whiteColor];
//    }
//    return _topView;
//}
//-(UIImageView *) avatarImageView
//{
//    if (!_avatarImageView)
//    {
//        _avatarImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kNoteDetailInfoCellLeftOffset, (kNoteDetailInfoCellFirstPartHeight - kNoteDetailInfoCellAvatarImageViewHeight)/2, kNoteDetailInfoCellAvatarImageViewHeight, kNoteDetailInfoCellAvatarImageViewHeight)];
//        _avatarImageView.image = [UIImage imageNamed:@"classfy_muying"];
//        _avatarImageView.backgroundColor = [UIColor clearColor];
//    }
//    return _avatarImageView;
//}
//-(UILabel *) name
//{
//    if (!_name)
//    {
//        NSString *string = @"海豚小溪";
//        UIFont *font = [UIFont systemFontOfSize:16.0f];
//        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
//        _name = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.avatarImageView.top, size.width, size.height)];
//        _name.text = string;
//        _name.textAlignment = NSTextAlignmentLeft;
//        _name.textColor = [UIColor colorWithHexString:@"626a73"];
//        _name.font = font;
//        _name.backgroundColor = [UIColor clearColor];
//    }
//    return _name;
//}
//-(UILabel *) address
//{
//    if (!_address)
//    {
//        NSString *string = @"北京，海淀区，上地十街";
//        UIFont *font = [UIFont systemFontOfSize:11.0f   ];
//        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
//        _address = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.name.bottom + 10.0f, size.width, size.height)];
//        _address.text = string;
//        _address.textAlignment = NSTextAlignmentLeft;
//        _address.textColor = [UIColor colorWithHexString:@"aeaeb2"];
//        _address.font = font;
//        _address.backgroundColor = [UIColor clearColor];
//    }
//    return _address;
//    
//}
//-(UIButton *) concern
//{
//    if (!_concern)
//    {
//        _concern = [UIButton buttonWithType:UIButtonTypeCustom];
//        _concern.frame =CGRectMake(kScreenWidth - kNoteDetailInfoCellLeftOffset - 50.0f, (kNoteDetailInfoCellFirstPartHeight - 27.0f)/2, 55.0f, 27.0f);
//        _concern.backgroundColor = [UIColor whiteColor];
//        _concern.layer.masksToBounds = YES;
//        _concern.layer.cornerRadius = 4.0f;
//        _concern.layer.borderWidth = 0.5f;
//        _concern.layer.borderColor = [[UIColor colorWithHexString:@"aeaeb2"] CGColor];
//        [_concern setTitle:@"关注" forState:UIControlStateNormal];
//        [_concern setTitle:@"关注" forState:UIControlStateHighlighted];
//        _concern.titleLabel.font = [UIFont systemFontOfSize:12.0f];
//        [_concern setTitleColor:[UIColor colorWithHexString:@"'aeaeb2"] forState:UIControlStateNormal];
//        [_concern setTitleColor:[UIColor colorWithHexString:@"'aeaeb2"] forState:UIControlStateHighlighted];
//        [_concern setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    }
//    return _concern;
//}
//-(UIView *) middleView
//{
//    if (!_middleView)
//    {
//        _middleView = [[UIView alloc]init];
//        _middleView.backgroundColor = [UIColor whiteColor];
//    }
//    return _middleView;
//}
//-(UIImageView *) goodsImageView
//{
//    if (!_goodsImageView)
//    {
//        _goodsImageView = [[UIImageView alloc]init];
//        _goodsImageView.backgroundColor = [UIColor whiteColor];
//    }
//    return _goodsImageView;
//}
//-(UILabel *) content
//{
//    if (!_content)
//    {
//        _content = [[UILabel alloc]init];
//        _content.textColor = [UIColor colorWithHexString:@"626a73"];
//        _content.textAlignment = NSTextAlignmentCenter;
//        _content.font = [UIFont systemFontOfSize:14.0f];
//        _content.backgroundColor = [UIColor whiteColor];
//    }
//    return _content;
//}
//-(UIImageView *)tagImageView
//{
//    if (!_tagImageView)
//    {
//        UIImage *image = [UIImage imageNamed:@"icon_labelcolor"];
//        _tagImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kNoteDetailInfoCellLeftOffset, 0, image.size.width, image.size.height)];
//        _tagImageView.image = image;
//        _tagImageView.backgroundColor = [UIColor clearColor];
//    }
//    return _tagImageView;
//}
//-(DWTagList *) tagView
//{
//    if (!_tagView)
//    {
//        _tagView = [[DWTagList alloc]init];
//    }
//    return _tagView;
//}
//
//-(UIImageView *) timeImageView
//{
//    if (!_timeImageView)
//    {
//        _timeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_clock"]];
//        _timeImageView.backgroundColor = [UIColor clearColor];
//    }
//    return _timeImageView;
//}
//-(UILabel *) time
//{
//    if (!_time)
//    {
//        _time = [[UILabel alloc]init];
//        _time.textColor = [UIColor colorWithHexString:@"b6babf"];
//        _time.textAlignment = NSTextAlignmentLeft;
//        _time.font = [UIFont systemFontOfSize:11.0f];
//        _time.backgroundColor = [UIColor whiteColor];
//    }
//    return _time;
//}
//-(UIView *)bottomView
//{
//    if (!_bottomView)
//    {
//        _bottomView = [[UIView alloc]init];
//        _bottomView.backgroundColor = [UIColor whiteColor];
//    }
//    return _bottomView;
//}
//-(UILabel *) commentAndLike
//{
//    if (!_commentAndLike)
//    {
//        _commentAndLike = [[UILabel alloc]init];
//        _commentAndLike.textColor = [UIColor colorWithHexString:@"b6babf"];
//        _commentAndLike.textAlignment = NSTextAlignmentLeft;
//        _commentAndLike.font = [UIFont systemFontOfSize:11.0f];
//        _commentAndLike.backgroundColor = [UIColor whiteColor];
//    }
//    return _commentAndLike;
//}
//-(UIView *)line1
//{
//    if (!_line1)
//    {
//        _line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 31, kScreenWidth, 0.5f)];
//        _line1.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
////        _line1.backgroundColor = [UIColor redColor];
//    }
//    return _line1;
//}
//-(UIView *)line2
//{
//    if (!_line2)
//    {
//        _line2 = [[UIView alloc]init];
//        _line2.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
//    }
//    return _line2;
//}

#pragma mark -- helper
-(NSInteger) getIconMaxCount
{
    if (iPhone6)
        return 8;
    else if (iPhone6Plus)
        return 8;
    else
        return 6;
}
#pragma mark -- layout
-(void)setData
{
//    [super layoutSubviews];
    NSString *string = @"http://p1.so.qhimg.com/t01a430ba22a2f43b0b.jpg";
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:string]];
    UIImage *image = [UIImage imageWithData:imageData];
    CGFloat imageHeight = image.size.height/image.size.width*kScreenWidth;
    self.goodsImageView.frame = CGRectMake(0, 0, kScreenWidth, imageHeight);
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:nil];
    
    self.content.frame = CGRectMake(kNoteDetailInfoCellLeftOffset, self.goodsImageView.bottom + kNoteDetailInfoCellLeftOffset, kScreenWidth - 2*kNoteDetailInfoCellLeftOffset, 0);
    NSString *contentString = @"这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据这个是测试数据";
    NSMutableAttributedString * attributedString1 = [[NSMutableAttributedString alloc] initWithString:contentString];
    NSMutableParagraphStyle * paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle1 setLineSpacing:10];
    [paragraphStyle1 setLineBreakMode:NSLineBreakByTruncatingTail];
    [attributedString1 addAttribute:NSParagraphStyleAttributeName value:paragraphStyle1 range:NSMakeRange(0, [contentString length])];
    [self.content setAttributedText:attributedString1];
    self.content.numberOfLines = 0;
    [self.content sizeToFit];
    
    self.middleView.frame = CGRectMake(0, self.topView.height, kScreenWidth, self.content.bottom);
    
    UIImage *tagImage = [UIImage imageNamed:@"icon_labelcolor"];
    self.tagImageView.frame = CGRectMake(kNoteDetailInfoCellLeftOffset, 5.0f, tagImage.size.width, tagImage.size.height);
    self.tagImageView.image = tagImage;
    
    self.tagView.frame  =  CGRectMake(self.tagImageView.right + 10.0f, 0, kScreenWidth - 2*kNoteDetailInfoCellLeftOffset - 10.0 - tagImage.size.width, 0);
    [self.tagView setTags:self.tagArray];
    CGSize tagSize =  [self.tagView fittedSize];

    UIImage *timeImg = [UIImage imageNamed:@"icon_clock"];
    self.timeImageView.frame = CGRectMake(kNoteDetailInfoCellLeftOffset, tagSize.height + 17.0f, timeImg.size.width, timeImg.size.height);
    self.timeImageView.image = timeImg;
//
    self.time.frame = CGRectMake(self.tagView.left, self.timeImageView.top, self.tagView.width, 11.0f);
    self.time.text = @"发布于三天前";
    
    self.bottomView.frame = CGRectMake(0, self.middleView.bottom + 31, kScreenWidth,self.timeImageView.bottom + 31.0f);
//
    self.frame = CGRectMake(0, 0, kScreenWidth, self.topView.height + self.middleView.height + self.bottomView.height);

}

-(void)setCommentAndLikeData
{
    NSString *likeCountString = @"400";
    NSString *comentCountString = @"88";
    NSString *string = [NSString stringWithFormat:@"总共有%@个赞,%@条评论",likeCountString,comentCountString];
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:self.commentAndLike.font}];
    NSMutableAttributedString *mutableAttributedString= [[NSMutableAttributedString alloc] initWithString:string];
        [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"13aef7"] range:NSMakeRange(3,likeCountString.length)];
     [mutableAttributedString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"#13aef7"] range:NSMakeRange(likeCountString.length + 6,comentCountString.length)];
    self.commentAndLike.frame = CGRectMake(kNoteDetailInfoCellLeftOffset, 20.0f, size.width, size.height);
    self.commentAndLike.attributedText = mutableAttributedString;
    
    for(UIView *view in self.contentView.subviews)
    {
        if ([view isKindOfClass:[UIButton class]])
        {
            [view removeAllSubviews];
        }
    }
    NSInteger count = [self getIconMaxCount];
    for (NSInteger i = 0; i < count; i++)
    {
        UIImage *image = [UIImage imageNamed:@"classfy_hufu"];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(44*i+15, self.commentAndLike.bottom + 10.0f, 30.0f, 30.0f)];
        self.commentAndLikeImagevView = button;
        [button setBackgroundImage:image forState:UIControlStateNormal];
        [button setBackgroundImage:image forState:UIControlStateHighlighted];
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 30.0/2;
        [self.contentView addSubview:button];
    }
    self.frame = CGRectMake(0, 0, kScreenWidth, self.commentAndLikeImagevView.bottom + 25.0f);
}


















@end
