
#import "NoteDetailInfoCell.h"
#import "UIImageView+WebCache.h"
#import "DWTagList.h"
#import "UIButton+WebCache.h"
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
@property(nonatomic,strong) UIButton *avatarImageView;

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
        [self cellConfig];
        if (cellType == DetailCellType_NoteInfo)
        {
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
            [self.contentView addSubview:self.line1];
            [self.contentView addSubview:self.commentAndLike];
            [self.contentView addSubview:self.line2];
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
-(UIView *) topView
{
    if (!_topView)
    {
        _topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kNoteDetailInfoCellFirstPartHeight)];
        _topView.backgroundColor = [UIColor whiteColor];
    }
    return _topView;
}
-(UIButton *) avatarImageView
{
    if (!_avatarImageView)
    {
        _avatarImageView = [[UIButton alloc]initWithFrame:CGRectMake(kNoteDetailInfoCellLeftOffset, (kNoteDetailInfoCellFirstPartHeight - kNoteDetailInfoCellAvatarImageViewHeight)/2, kNoteDetailInfoCellAvatarImageViewHeight, kNoteDetailInfoCellAvatarImageViewHeight)];
//        _avatarImageView.image = [UIImage imageNamed:@"classfy_muying"];
        _avatarImageView.backgroundColor = [UIColor clearColor];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = kNoteDetailInfoCellAvatarImageViewHeight/2;
    }
    return _avatarImageView;
}
-(UILabel *) name
{
    if (!_name)
    {
        NSString *string = @"海豚小溪海豚消息海豚消息海豚消息";
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
-(UILabel *) address
{
    if (!_address)
    {
        NSString *string = @"北京，海淀区，上地十街，上地世界是世界世界世界";
        UIFont *font = [UIFont systemFontOfSize:11.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _address = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarImageView.right + 10.0f, self.name.bottom + 10.0f, size.width, size.height)];
        _address.textAlignment = NSTextAlignmentLeft;
        _address.textColor = [UIColor colorWithHexString:@"aeaeb2"];
        _address.font = font;
        _address.backgroundColor = [UIColor clearColor];
    }
    return _address;
    
}
-(UIButton *) concern
{
    if (!_concern)
    {
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
    }
    return _concern;
}
-(UIView *) middleView
{
    if (!_middleView)
    {
        _middleView = [[UIView alloc]init];
        _middleView.backgroundColor = [UIColor whiteColor];
    }
    return _middleView;
}
-(UIImageView *) goodsImageView
{
    if (!_goodsImageView)
    {
        _goodsImageView = [[UIImageView alloc]init];
        _goodsImageView.backgroundColor = [UIColor whiteColor];
    }
    return _goodsImageView;
}
-(UILabel *) content
{
    if (!_content)
    {
        _content = [[UILabel alloc]init];
        _content.textColor = [UIColor colorWithHexString:@"626a73"];
        _content.textAlignment = NSTextAlignmentCenter;
        _content.font = [UIFont systemFontOfSize:14.0f];
        _content.backgroundColor = [UIColor whiteColor];
    }
    return _content;
}
-(UIImageView *)tagImageView
{
    if (!_tagImageView)
    {
        UIImage *image = [UIImage imageNamed:@"icon_labelcolor"];
        _tagImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kNoteDetailInfoCellLeftOffset, 0, image.size.width, image.size.height)];
        _tagImageView.image = image;
        _tagImageView.backgroundColor = [UIColor clearColor];
    }
    return _tagImageView;
}
-(DWTagList *) tagView
{
    if (!_tagView)
    {
        _tagView = [[DWTagList alloc]init];
    }
    return _tagView;
}

-(UIImageView *) timeImageView
{
    if (!_timeImageView)
    {
        _timeImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon_clock"]];
        _timeImageView.backgroundColor = [UIColor clearColor];
    }
    return _timeImageView;
}
-(UILabel *) time
{
    if (!_time)
    {
        _time = [[UILabel alloc]init];
        _time.textColor = [UIColor colorWithHexString:@"b6babf"];
        _time.textAlignment = NSTextAlignmentLeft;
        _time.font = [UIFont systemFontOfSize:11.0f];
        _time.backgroundColor = [UIColor whiteColor];
    }
    return _time;
}
-(UIView *)bottomView
{
    if (!_bottomView)
    {
        _bottomView = [[UIView alloc]init];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
-(UILabel *) commentAndLike
{
    if (!_commentAndLike)
    {
        _commentAndLike = [[UILabel alloc]init];
        _commentAndLike.textColor = [UIColor colorWithHexString:@"b6babf"];
        _commentAndLike.textAlignment = NSTextAlignmentLeft;
        _commentAndLike.font = [UIFont systemFontOfSize:11.0f];
        _commentAndLike.backgroundColor = [UIColor whiteColor];
    }
    return _commentAndLike;
}
-(UIView *)line1
{
    if (!_line1)
    {
        _line1 = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5f)];
        _line1.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
//        _line1.backgroundColor = [UIColor redColor];
    }
    return _line1;
}
-(UIView *)line2
{
    if (!_line2)
    {
        _line2 = [[UIView alloc]init];
        _line2.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
    }
    return _line2;
}

#pragma mark -- helper
-(NSInteger) getIconMaxCount
{
    if (iPhone6)
        return 9;
    else if (iPhone6Plus)
        return 9;
    else
        return 7;
}
#pragma mark -- layout
-(void)setDataWithModel:(DetailDataModel*) detailModel
{
    self.tagArray = [NSArray arrayWithObjects:detailModel.commodity.tag1,detailModel.commodity.tag2,detailModel.commodity.tag3 ,nil];
    self.name.text = detailModel.follow.userName;
    [self.avatarImageView sd_setBackgroundImageWithURL:[NSURL URLWithString:detailModel.follow.userPic] forState:UIControlStateNormal];
    [self.avatarImageView sd_setBackgroundImageWithURL:[NSURL URLWithString:detailModel.follow.userPic] forState:UIControlStateHighlighted];
    NSString *string = detailModel.commodity.picture;
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:string]];
    UIImage *image = [UIImage imageWithData:imageData];
    CGFloat imageHeight = image.size.height/image.size.width*kScreenWidth;
    self.goodsImageView.frame = CGRectMake(0, 0, kScreenWidth, imageHeight);
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:string] placeholderImage:nil];
    
    self.content.frame = CGRectMake(kNoteDetailInfoCellLeftOffset, self.goodsImageView.bottom + kNoteDetailInfoCellLeftOffset, kScreenWidth - 2*kNoteDetailInfoCellLeftOffset, 0);
    NSString *contentString =detailModel.commodity.content;
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
    self.time.text = [NSString stringWithFormat:@"发布于:%@",detailModel.commodity.publishTime];
    
    self.bottomView.frame = CGRectMake(0, self.middleView.bottom + 31, kScreenWidth,self.timeImageView.bottom + 31.0f);

    self.frame = CGRectMake(0, 0, kScreenWidth, self.bottomView.bottom);

}

-(void)setCommentAndLikeData:(DetailDataModel *) detailModel
{
    NSString *likeCountString = [NSString stringWithFormat:@"%ld",detailModel.praises.count];
    NSString *comentCountString = [NSString stringWithFormat:@"%ld",detailModel.comments.count];
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
    NSInteger imageCount = detailModel.praises.count;
    NSInteger count = [self getIconMaxCount];
    if (imageCount > count)
    {
        imageCount = count;
    }
    for (NSInteger i = 0; i < imageCount; i++)
    {
        PraisesModel *model = detailModel.praises[i];
//        UIImage *image = [UIImage imageNamed:@"classfy_hufu"];
        NSURL *url = [NSURL URLWithString:model.userPic];
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(44*i+15, self.commentAndLike.bottom + 10.0f, 30.0f, 30.0f)];
        button.tag = i;
        self.commentAndLikeImagevView = button;
        [button sd_setImageWithURL:url forState:UIControlStateNormal] ;
        [button sd_setImageWithURL:url forState:UIControlStateHighlighted] ;
        button.layer.masksToBounds = YES;
        button.layer.cornerRadius = 30.0/2;
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:button];
    }
    self.line2.frame = CGRectMake(0, self.commentAndLike.bottom + 10 + self.commentAndLikeImagevView.height + 25.0f, kScreenWidth, 0.5f);
    self.frame = CGRectMake(0, 0, kScreenWidth, self.line2.bottom);
}
-(void)buttonAction:(UIButton *) sender
{
    if (self.delegate &&[self.delegate respondsToSelector:@selector(seeUser:)])
    {
        [self.delegate seeUser:sender.tag];
    }
}

















@end
