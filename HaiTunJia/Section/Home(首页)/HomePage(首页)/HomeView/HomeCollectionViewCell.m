
#import "HomeCollectionViewCell.h"
#import "SystemMacro.h"
#import "HomeListModel.h"
#import "UIImageView+WebCache.h"
#import "UILabel+Additions.h"
static const CGFloat kHomeCellLeftOffset              = 10.0f;
static const CGFloat kHomeCellTopOffset              = 10.0f;
static const CGFloat kHomeCellAvatarHeight         =  30.0f;
static const CGFloat kHomeCellLineHeight            = 0.5f;
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
        _avatarImageView.backgroundColor = [UIColor whiteColor];
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
-(UILabel *)commentNum
{
    if(!_commentNum)
    {
        _commentNum = [[UILabel alloc]init];
        _commentNum.textColor = [UIColor colorWithHexString:@"bcbcc4"];
        _commentNum.textAlignment = NSTextAlignmentLeft;
        _commentNum.font = [UIFont systemFontOfSize:12.0f];
        _commentNum.backgroundColor = [UIColor clearColor];
    }
    return _commentNum;
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
-(UILabel *)zanNum
{
    if(!_zanNum)
    {
        _zanNum = [[UILabel alloc]init];
        _zanNum.textColor = [UIColor colorWithHexString:@"bcbcc4"];
        _zanNum.textAlignment = NSTextAlignmentLeft;
        _zanNum.font = [UIFont systemFontOfSize:12.0f];
        _zanNum.backgroundColor = [UIColor clearColor];
    }
    return _zanNum;

}

//大背景
-(UIView *)bigBgView
{
    if (!_bigBgView)
    {
        _bigBgView = [[UIView alloc]init];
        _bigBgView.backgroundColor = [UIColor whiteColor];
        _bigBgView.userInteractionEnabled = YES;
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
        _topBgView.userInteractionEnabled = YES;
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
        _middleBgView.userInteractionEnabled = YES;
    }
    return _middleBgView;
}

//下部背景
-(UIView *)bottomBgView
{
    if (!_bottomBgView)
    {
        _bottomBgView = [[UIView alloc]init];
        _bottomBgView.backgroundColor = [UIColor whiteColor];
        _bottomBgView.userInteractionEnabled = YES;
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

-(UIButton *)bottomLeftView
{
    if (!_bottomLeftView)
    {
        _bottomLeftView = [[UIButton alloc]init];
        _bottomLeftView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomLeftView;
}

-(UIButton *)bottomRightView
{
    if (!_bottomRightView)
    {
        _bottomRightView = [[UIButton alloc]init];
        _bottomRightView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomRightView;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView               addSubview:self.bigBgView];
        [self.bigBgView                  addSubview:self.topBgView];
        [self.bigBgView                  addSubview:self.middleBgView];
        [self.bigBgView                  addSubview:self.bottomBgView];
        [self.topBgView                  addSubview:self.avatarImageView];
        [self.topBgView                  addSubview:self.name];
        [self.topBgView                  addSubview:self.address];
        [self.middleBgView            addSubview:self.goodsImageView];
        [self.middleBgView            addSubview:self.content];
        [self.bottomBgView           addSubview:self.lineView];
        [self.bottomBgView           addSubview:self.bottomLeftView];
        [self.bottomBgView           addSubview:self.bottomRightView];
        [self.bottomLeftView         addSubview:self.commentImageButton];
        [self.bottomLeftView         addSubview:self.commentNum];
        [self.bottomRightView       addSubview:self.zanImageButton];
        [self.bottomRightView       addSubview:self.zanNum];
        
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 4.0f;
        self.layer.borderWidth = 0.5f;
        self.layer.borderColor = [[UIColor colorWithHexString:@"e5e5e6"] CGColor];
        self.userInteractionEnabled = YES;
    }
    return self;
}

#pragma mark -- Layout
-(void)setCellData:(DataModel *)dataModel{
    self.dataModel = dataModel;
    //头像
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.dataModel.userPic] placeholderImage:nil];
    
    //姓名
    NSString *nameString  = self.dataModel.userName;
    CGSize nameSize = [nameString sizeWithAttributes:@{NSFontAttributeName:self.name.font}];
    self.name.frame = CGRectMake(self.avatarImageView.right + kHomeCellLeftOffset,
                                                         self.avatarImageView.top,
                                                         self.width - self.avatarImageView.right - 2*kHomeCellLeftOffset,
                                                         nameSize.height);
    self.name.text    = nameString;
    
    //地点
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
    
    //大图
    [self.goodsImageView sd_setImageWithURL:[NSURL URLWithString:self.dataModel.picture] placeholderImage:nil];
    self.goodsImageView.frame = CGRectMake(0, 0,self.width,self.dataModel.imageHeight);
    
    //描述文本
    NSString *contentString = self.dataModel.name;
    CGSize size = [contentString sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
    self.content.frame = CGRectMake(kHomeCellLeftOffset,
                                                           self.goodsImageView.bottom + kHomeCellTopOffset,
                                                           self.width - 2*kHomeCellLeftOffset,
                                                           size.height * 2);
    self.content.text = contentString;
    self.content.numberOfLines = 2;
    self.middleBgView.frame = CGRectMake(0,
                                                                      self.topBgView.bottom,
                                                                      self.width,
                                                                      self.content.bottom + kHomeCellTopOffset);
    

    self.lineView.frame = CGRectMake(0,
                                                             0,
                                                            self.width,
                                                            kHomeCellLineHeight);
    
    //评论图片
    UIImage *commentImage = [UIImage imageNamed:@"icon_message"];
    self.commentImageButton.frame = CGRectMake(5.0f,
                                                                                   5.0f,
                                                                                   commentImage.size.width,
                                                                                   commentImage.size.height);
    [self.commentImageButton setBackgroundImage:commentImage forState:UIControlStateNormal];
    [self.commentImageButton setBackgroundImage:commentImage forState:UIControlStateHighlighted];
    
    //评论数
    NSString *commentNumStr = [NSString stringWithFormat:@"%ld",self.dataModel.commentNum];
    CGSize commentNumSize = [commentNumStr sizeWithAttributes:@{NSFontAttributeName:self.commentNum.font}];
    self.commentNum.frame = CGRectMake(self.commentImageButton.right,
                                                                      kHomeCellTopOffset,
                                                                      commentNumSize.width,
                                                                      commentNumSize.height);
    self.commentNum.text = commentNumStr;
    
    
    self.bottomLeftView.frame = CGRectMake(0,
                                                                         self.lineView.bottom,
                                                                         self.width/2,
                                                                         50);
    self.bottomRightView.frame = CGRectMake(self.bottomLeftView.right,
                                                                           self.bottomLeftView.top,
                                                                           self.bottomLeftView.width,
                                                                           self.bottomLeftView.height);
    
    //赞数量
    NSString *zanNumStr =  [NSString stringWithFormat:@"%ld",self.dataModel.likeNum];
    CGSize zanNumSize = [zanNumStr sizeWithAttributes:@{NSFontAttributeName:self.zanNum.font}];
    self.zanNum.frame = CGRectMake(self.bottomRightView.width - kHomeCellLeftOffset - zanNumSize.width,
                                       kHomeCellTopOffset,
                                       zanNumSize.width,
                                       zanNumSize.height);
    self.zanNum.text = zanNumStr;

    UIImage *loveImage;
    if (self.dataModel.isPraised == 0)
            loveImage = [UIImage imageNamed:@"icon_love_normal"];
    else
            loveImage = [UIImage imageNamed:@"icon_love_active"];

    self.zanImageButton.frame = CGRectMake(self.zanNum.left - loveImage.size.width,
                                               5.0f,
                                               loveImage.size.width,
                                               loveImage.size.height);
    [self.zanImageButton setBackgroundImage:loveImage forState:UIControlStateNormal];
    [self.zanImageButton setBackgroundImage:loveImage forState:UIControlStateHighlighted];
    
    self.bottomBgView.frame = CGRectMake(0,
                                         self.middleBgView.bottom,
                                         self.width,
                                         5.0f + loveImage.size.width+ 5.0f);
    self.bigBgView.frame = CGRectMake(0, 0, self.width, self.bottomBgView.bottom);
    [self.bottomLeftView addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomRightView addTarget:self action:@selector(test) forControlEvents:UIControlEventTouchUpInside];
}
-(void)test
{
    NSLog(@"123");
}
@end
