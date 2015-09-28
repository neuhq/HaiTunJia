
#import "HomeCollectionViewCell.h"
#import "SystemMacro.h"


static const CGFloat kHomeCellLeftOffset              = 10.0f;
static const CGFloat kHomeCellTopOffset              = 10.0f;
static const CGFloat kHomeCellAvatarHeight         =  30.0f;

@implementation HomeCollectionViewCell

#pragma mark -- UI
//头像
-(UIImageView *)avatarImageView
{
    if (!_avatarImageView)
    {
        _avatarImageView = [[UIImageView alloc]init];
        _avatarImageView.frame  = CGRectMake(kHomeCellLeftOffset,
                                                 kHomeCellTopOffset,
                                                 kHomeCellAvatarHeight,
                                                 kHomeCellAvatarHeight);
        _avatarImageView.backgroundColor = [UIColor blueColor];
        _avatarImageView.layer.masksToBounds = YES;
        _avatarImageView.layer.cornerRadius = kHomeCellAvatarHeight / 2;
    }
    return _avatarImageView;
}

//姓名
-(UILabel *)name
{
    if (!_name)
    {
        _name = [[UILabel alloc]init];
        _name.textColor = [UIColor colorWithHexString:@"626a73"];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont systemFontOfSize:13.0f];
        _name.backgroundColor = [UIColor clearColor];
    }
    return _name;
}

//地址
-(UILabel *)address
{
    if(!_address)
    {
        _address = [[UILabel alloc]init];
        _address.textColor = [UIColor colorWithHexString:@"aeaeb2"];
        _address.textAlignment = NSTextAlignmentLeft;
        _address.font = [UIFont systemFontOfSize:9.0f];
        _address.backgroundColor = [UIColor clearColor];
    }
    return _address;
}

//大图
-(UIImageView *)goodsImageView
{
    if (!_goodsImageView)
    {
        _goodsImageView = [[UIImageView alloc]init];
//        _goodsImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    }
    return _goodsImageView;
}

//文本
-(UILabel *)content
{
    if(!_content)
    {
        _content = [[UILabel alloc]init];
        _content.textColor = [UIColor colorWithHexString:@"48484c"];
        _content.textAlignment = NSTextAlignmentLeft;
        _content.font = [UIFont systemFontOfSize:12.0f];
        _content.backgroundColor = [UIColor clearColor];
    }
    return _content;
}
//评论图片
-(UIButton *)commentImageButton
{
    if(!_commentImageButton)
    {
       _commentImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
       _commentImageButton.backgroundColor = [UIColor clearColor];
    }
    return _commentImageButton;
}

//评论数
-(UIButton *)commentNumButton
{
    if(!_commentNumButton)
    {
        _commentNumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _commentNumButton.backgroundColor = [UIColor clearColor];
    }
    return _commentNumButton;
}
//贊图片
-(UIButton *)zanImageButton
{
    if(!_zanImageButton)
    {
        _zanImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _zanImageButton.backgroundColor = [UIColor clearColor];
    }
    return _zanImageButton;
}

//贊数量
-(UIButton *)zanNumButton
{
    if(!_zanNumButton)
    {
        _zanNumButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _zanNumButton.backgroundColor = [UIColor clearColor];
    }
    return _zanNumButton;
}

//大背景
-(UIView *)bigBgView
{
    if (!_bigBgView)
    {
        _bigBgView = [[UIView alloc]init];
        _bigBgView.backgroundColor = [UIColor redColor];
//        _bigBgView.layer.masksToBounds = YES;
//        _bigBgView.layer.cornerRadius = 4.0f;
//        _bigBgView.layer.borderWidth = 0.5f;
//        _bigBgView.layer.borderColor = [[UIColor colorWithHexString:@"eeeeee"] CGColor];
        
    }
    return _bigBgView;
}

//上部背景
-(UIView *)topBgView
{
    if (!_topBgView)
    {
        _topBgView = [[UIView alloc]init];
        _topBgView.backgroundColor = [UIColor clearColor];
    }
    return _topBgView;
}

//中部背景
-(UIView *)middleBgView
{
    if (!_middleBgView)
    {
        _middleBgView = [[UIView alloc]init];
        _middleBgView.backgroundColor = [UIColor whiteColor];
    }
    return _middleBgView;
}

//下部背景
-(UIView *)bottomBgView
{
    if (!_bottomBgView)
    {
        _bottomBgView = [[UIView alloc]init];
        _bottomBgView.backgroundColor = [UIColor blueColor];
    }
    return _bottomBgView;
}

//横线
-(UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor colorWithHexString:@"eeeeee"];
    }
    return _lineView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView addSubview:self.bigBgView];
        [self.bigBgView addSubview:self.topBgView];
        [self.bigBgView addSubview:self.middleBgView];
        [self.bigBgView addSubview:self.bottomBgView];
        [self.topBgView addSubview:self.avatarImageView];
        [self.topBgView addSubview:self.name];
        [self.topBgView addSubview:self.address];
        [self.middleBgView addSubview:self.goodsImageView];
        [self.middleBgView addSubview:self.content];
        [self.bottomBgView addSubview:self.lineView];
        [self.bottomBgView addSubview:self.commentImageButton];
        [self.bottomBgView addSubview:self.commentNumButton];
        [self.bottomBgView addSubview:self.zanImageButton];
        [self.bottomBgView addSubview:self.zanNumButton];
        
        self.backgroundColor = [UIColor yellowColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0f;
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = [[UIColor colorWithHexString:@"eeeeee"] CGColor];

    }
    return self;
}

#pragma mark -- Layout
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.avatarImageView.image  = [UIImage imageNamed:@"cat1"];
    
    NSString *nameString = @"安吉丽娜来得及看到过两个阿里苦尽甘来刚看见过";
    CGSize nameSize = [nameString sizeWithAttributes:@{NSFontAttributeName:self.name.font}];
    self.name.frame = CGRectMake(self.avatarImageView.right + kHomeCellLeftOffset,
                                                         self.avatarImageView.top,
                                                         self.width - self.avatarImageView.right - 2*kHomeCellLeftOffset,
                                                         nameSize.height);
    self.name.text    = nameString;
    
    NSString *addressString = @"日本，东京，美国";
    CGSize addressSize = [addressString sizeWithAttributes:@{NSFontAttributeName:self.address.font}];
    self.address.frame  = CGRectMake(self.name.left,
                                                              self.name.bottom + 5.0f,
                                                             self.name.width,
                                                             addressSize.height);
    self.address.text = addressString;
    
    self.topBgView.frame = CGRectMake(0,
                                                                 0,
                                                                 self.frame.size.width,
                                                                2*kHomeCellTopOffset + kHomeCellAvatarHeight);
    
    UIImage *image  = [UIImage imageNamed:@"test"];
    self.goodsImageView.frame = CGRectMake(0, 0,self.width,150);
    self.goodsImageView.image = image;
    
    NSString *contentString = @"白净的魅力白净饿魅力时刻看到过健康噶是客观环境阿里看过后两个";
    NSMutableAttributedString * attributedString = [[NSMutableAttributedString alloc] initWithString:contentString];
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:5.0f];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [contentString length])];
    self.content.frame = CGRectMake(kHomeCellLeftOffset, self.goodsImageView.bottom + kHomeCellTopOffset,self.width - 2*kHomeCellLeftOffset,0);
    self.content.text = contentString;
    self.content.numberOfLines = 2;
    [self.content sizeToFit];
    
    self.middleBgView.frame = CGRectMake(0, self.topBgView.bottom, self.width, self.content.bottom + kHomeCellTopOffset);

    self.lineView.frame = CGRectMake(0, 0, self.width, 0.5f);
    UIImage *commentImage = [UIImage imageNamed:@"icon_message"];
    self.commentImageButton.frame = CGRectMake(kHomeCellLeftOffset, kHomeCellTopOffset, commentImage.size.width, commentImage.size.height);
    [self.commentImageButton setBackgroundImage:commentImage forState:UIControlStateNormal];
    [self.commentImageButton setBackgroundImage:commentImage forState:UIControlStateHighlighted];

    self.bottomBgView.frame = CGRectMake(0, self.middleBgView.bottom, self.width, self.commentImageButton.bottom + 50);
}
@end
