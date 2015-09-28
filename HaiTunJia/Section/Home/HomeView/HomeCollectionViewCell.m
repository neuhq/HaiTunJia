
#import "HomeCollectionViewCell.h"
#import "SystemMacro.h"
@implementation HomeCollectionViewCell

#pragma mark -- UI
//头像
-(UIImageView *)avterImageView
{
    if (!_avterImageView)
    {
        _avterImageView = [[UIImageView alloc]init];
    }
    return _avterImageView;
}

//姓名
-(UILabel *)name
{
    if (!_name)
    {
        _name = [[UILabel alloc]init];
        _name.textColor = [UIColor blackColor];
        _name.textAlignment = NSTextAlignmentLeft;
        _name.font = [UIFont systemFontOfSize:12.0f];
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
        _address.textColor = [UIColor blackColor];
        _address.textAlignment = NSTextAlignmentLeft;
        _address.font = [UIFont systemFontOfSize:12.0f];
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
        _content.textColor = [UIColor blackColor];
        _content.textAlignment = NSTextAlignmentLeft;
        _content.font = [UIFont systemFontOfSize:14.0f];
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
    }
    return _bigBgView;
}

//上部背景
-(UIView *)topBgView
{
    if (!_topBgView)
    {
        _topBgView = [[UIView alloc]init];
        _topBgView.backgroundColor = [UIColor whiteColor];
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
        _bottomBgView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomBgView;
}

//横线
-(UIView *)lineView
{
    if (!_lineView)
    {
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor whiteColor];
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
        [self.topBgView addSubview:self.avterImageView];
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

    }
    return self;
}

#pragma mark -- Layout
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    
}
@end
