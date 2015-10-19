//
//  OtherUserHeaderVIew.m
//  HaiTunJia
//
//  Created by lizhe  on 15/10/16.
//  Copyright (c) 2015年 李哲. All rights reserved.
//

#import "OtherUserHeaderVIew.h"
#import "CustomTabView.h"
#import "UIImageView+WebCache.h"
#import "UIButton+WebCache.h"
const CGFloat kUserHeaderTopBgViewHeight  =  124.0f;
const CGFloat kUserHeaderBottomBgViewHeight  = 55.0f;
const CGFloat kUserHeaderSamllAvatarBgHeight   = 85.0f;
const CGFloat kUserHeaderSamllAvatarHeight   = 74.0;

@interface OtherUserHeaderVIew ()
<CustomTabViewDelegete>

@property(nonatomic,strong) UIView *bgView;

@property(nonatomic,strong) UIView *topBgView;

@property(nonatomic,strong) UIView *midleBgView;

@property(nonatomic,strong) UIView *bottomBgView;

@property(nonatomic,strong) UIImageView *bigAvatar;

@property(nonatomic,strong) UIView *samllAvatarBgView;

@property(nonatomic,strong) UIButton *smallAvatar;

@property(nonatomic,strong) UILabel *name;

@property(nonatomic,strong) UILabel *concernLabel;

@property(nonatomic,strong) UILabel *concerNum;

@property(nonatomic,strong) UILabel *fansLabel;

@property(nonatomic,strong) UILabel *fansNum;

@property(nonatomic,strong) UILabel *address;

@property(nonatomic,strong) UILabel *Introduction;

@property(nonatomic,strong) CustomTabView *tab;

@property(nonatomic,strong) UIView *line;



@end
@implementation OtherUserHeaderVIew
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.topBgView];
        [self.topBgView addSubview:self.bigAvatar];
        [self.topBgView addSubview:self.samllAvatarBgView];
        [self.topBgView addSubview:self.smallAvatar];
        
        [self.midleBgView addSubview:self.name];
        [self.midleBgView addSubview:self.concernButton];
        [self.midleBgView addSubview:self.fansButton];
        [self.midleBgView addSubview:self.address];
        [self.midleBgView addSubview:self.Introduction];
        [self.midleBgView addSubview:self.line];
        
        [self.bgView addSubview:self.midleBgView];
        
        [self.bgView addSubview:self.bottomBgView];
        [self.bottomBgView addSubview:self.tab];
    }
    return self;
}

-(UIView *) bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, self.height)];
        _bgView.backgroundColor = [UIColor whiteColor];
    }
    return _bgView;
}
-(UIView *) topBgView
{
    if (!_topBgView)
    {
        _topBgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kUserHeaderTopBgViewHeight)];
        _topBgView.backgroundColor = [UIColor whiteColor];
    }
    return _topBgView;
}
-(UIView *) midleBgView
{
    if (!_midleBgView)
    {
        _midleBgView = [[UIView alloc]initWithFrame:CGRectMake(0, self.topBgView.bottom, kScreenWidth, self.Introduction.bottom + 16.0f)];
        _midleBgView.backgroundColor = [UIColor whiteColor];
    }
    return _midleBgView;
}
-(UIView *) bottomBgView
{
    if (!_bottomBgView)
    {
        _bottomBgView = [[UIView alloc]initWithFrame:CGRectMake(0, self.midleBgView.bottom, kScreenWidth, kUserHeaderBottomBgViewHeight)];
        _bottomBgView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomBgView;
}
-(UIImageView *) bigAvatar
{
    if (!_bigAvatar)
    {
        _bigAvatar = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 104)];
        _bigAvatar.backgroundColor = [UIColor clearColor];
//        [_bigAvatar sd_setImageWithURL:[NSURL URLWithString:@"http://p1.so.qhimg.com/t01a430ba22a2f43b0b.jpg"]];
    }
    return _bigAvatar;
}

-(UIView *) samllAvatarBgView
{
    if (!_samllAvatarBgView)
    {
        _samllAvatarBgView = [[UIView alloc]initWithFrame:CGRectMake((kScreenWidth - kUserHeaderSamllAvatarBgHeight)/2, self.topBgView.height - kUserHeaderSamllAvatarBgHeight, kUserHeaderSamllAvatarBgHeight, kUserHeaderSamllAvatarBgHeight)];
        _samllAvatarBgView.backgroundColor = [UIColor whiteColor];
        _samllAvatarBgView.layer.masksToBounds = YES;
        _samllAvatarBgView.layer.cornerRadius = kUserHeaderSamllAvatarBgHeight/2;
        _samllAvatarBgView.layer.borderWidth = 0.5f;
        _samllAvatarBgView.layer.borderColor = [[UIColor colorWithHex:@"#bbbbbb"] CGColor];
        
    }
    return _samllAvatarBgView;
}
-(UIButton *) smallAvatar
{
    if (!_smallAvatar)
    {
        _smallAvatar = [UIButton buttonWithType:UIButtonTypeCustom];
        _smallAvatar.frame = CGRectMake((kScreenWidth - kUserHeaderSamllAvatarHeight)/2, self.topBgView.height - kUserHeaderSamllAvatarHeight - 5, kUserHeaderSamllAvatarHeight, kUserHeaderSamllAvatarHeight);
        _smallAvatar.layer.masksToBounds = YES;
        _smallAvatar.layer.cornerRadius = kUserHeaderSamllAvatarHeight/2;
        _smallAvatar.backgroundColor = [UIColor clearColor];
//        [_smallAvatar sd_setImageWithURL:[NSURL URLWithString:@"http://p1.so.qhimg.com/t01a430ba22a2f43b0b.jpg"] forState:UIControlStateNormal];
    }
    return _smallAvatar;
}
-(UILabel *) name
{
    if (!_name)
    {
        NSString *string= @"海豚家";
        UIFont *font = [UIFont boldSystemFontOfSize:18.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _name = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, kScreenWidth, size.height)];
//        _name.text = string;
        _name.textColor = [UIColor colorWithHex:@"#464b51"];
        _name.font = [UIFont systemFontOfSize:18.0f];
        _name.textAlignment = NSTextAlignmentCenter;
        _name.backgroundColor = [UIColor clearColor];
    }
    return _name;
}
-(UIButton *) concernButton
{
    if (!_concernButton)
    {
        _concernButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _concernButton.frame = CGRectMake(0, self.name.bottom + 12.0f, kScreenWidth/2, 25.0f);
        _concernButton.backgroundColor = [UIColor whiteColor];
//        [_concernButton setTitle:@"关注：809" forState:UIControlStateNormal];
//        [_concernButton setTitle:@"关注：809" forState:UIControlStateHighlighted];
        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:13.0f];
        _concernButton.titleLabel.font = font;
        [_concernButton setTitleColor:[UIColor colorWithHex:@"#9696a0"] forState:UIControlStateNormal];
    }
    return _concernButton;
}
-(UIButton *)fansButton
{
    if (!_fansButton)
    {
        _fansButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _fansButton.frame = CGRectMake(kScreenWidth/2, self.concernButton.top, self.concernButton.width, 25.0f);
        _fansButton.backgroundColor = [UIColor whiteColor];
//        [_fansButton setTitle:@"粉丝：809" forState:UIControlStateNormal];
//        [_fansButton setTitle:@"粉丝：809" forState:UIControlStateHighlighted];
        UIFont *font = [UIFont fontWithName:@"Helvetica-Bold" size:13.0f];
        _fansButton.titleLabel.font = font;
        [_fansButton setTitleColor:[UIColor colorWithHex:@"#9696a0"] forState:UIControlStateNormal];
    }
    return _fansButton;
}
-(UILabel *)address
{
    if (!_address)
    {
        NSString *string= @"中国，北京" ;
        UIFont *font = [UIFont systemFontOfSize:12.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _address = [[UILabel alloc]initWithFrame:CGRectMake(0, self.concernButton.bottom + 20.0f, kScreenWidth/2, size.height)];
        _address.text = string;
        _address.textColor = [UIColor colorWithHex:@"#7a8187"];
        _address.font = [UIFont systemFontOfSize:12.0f];
        _address.textAlignment = NSTextAlignmentCenter;
        _address.backgroundColor = [UIColor clearColor];
    }
    return _address;
}
-(UILabel *) Introduction
{
    if (!_Introduction)
    {
        NSString *string= @"简介：爱生活，爱海豚家" ;
        UIFont *font = [UIFont systemFontOfSize:12.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _Introduction = [[UILabel alloc]initWithFrame:CGRectMake(kScreenWidth/2 + 10, self.address.top, kScreenWidth/2 - 20, size.height)];
        _Introduction.text = string;
        _Introduction.textColor = [UIColor colorWithHex:@"#7a8187"];
        _Introduction.font = [UIFont systemFontOfSize:12.0f];
        _Introduction.textAlignment = NSTextAlignmentCenter;
        _Introduction.backgroundColor = [UIColor clearColor];
    }
    return _Introduction;
}

-(UIView *) line
{
    if (!_line)
    {
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, self.midleBgView.height - 0.5f, kScreenWidth, 0.5f)];
        _line.backgroundColor = [UIColor colorWithHex:@"#7a8187"];
    }
    return _line;
}
-(CustomTabView *) tab
{
    if (!_tab)
    {
        _tab = [[CustomTabView alloc]initWithDlegate:self withArr:@[@"笔记",@"收藏"]];
        _tab.backgroundColor = [UIColor whiteColor];
    }
    return _tab;
}

#pragma mark -- helper
+(CGFloat) getHeaderHeight
{
    CGSize size1 = [self getStringSize:@"海豚消息" font:[UIFont boldSystemFontOfSize:18.0f]];
    CGSize size2 = [self getStringSize:@"简介：爱生活，爱海豚家"  font: [UIFont systemFontOfSize:12.0f]];
    return kUserHeaderTopBgViewHeight + kUserHeaderBottomBgViewHeight + size1.height  + 12.0f + size2.height + 20+ 25.0f + 15.0f;
}

+(CGSize) getStringSize:(NSString *) string font:(UIFont*) font
{
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
    return size;
}

-(void)tapIndex:(NSInteger)index
{
    if(self.delegate &&[self.delegate respondsToSelector:@selector(selectTabAtIndex:)])
        [self.delegate selectTabAtIndex:index];
}

-(void)reloadUserInfo:(UserModel *) userModel
{
    [self.smallAvatar sd_setBackgroundImageWithURL:[NSURL URLWithString:userModel.data.pic] forState:UIControlStateNormal];
    [self.smallAvatar sd_setBackgroundImageWithURL:[NSURL URLWithString:userModel.data.pic] forState:UIControlStateHighlighted];

    [self.bigAvatar sd_setImageWithURL:[NSURL URLWithString:userModel.data.pic] placeholderImage:nil];
    
    self.name.text = userModel.data.nick;
    [self.concernButton setTitle:[NSString stringWithFormat:@"关注：%ld",userModel.data.followNum] forState:UIControlStateNormal];
    [self.fansButton setTitle:[NSString stringWithFormat:@"粉丝：%ld",userModel.data.followerNum] forState:UIControlStateNormal];
}

@end
