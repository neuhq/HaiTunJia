#import "PersonViewCell.h"
#import "UIButton+WebCache.h"
const CGFloat kPersonViewFirstCell = 60.0f;
const CGFloat kPersonViewSecondCell = 44.0f;
const CGFloat kPersonViewCellLeftOffset = 15.0f;
const CGFloat kPersonViewCellAvatarHeight = 50.0f;

@interface PersonViewCell ()


@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UILabel *verifyAvatar;

@end
@implementation PersonViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier row:(NSInteger) row
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        if (row == 0)
        {
            [self.contentView addSubview:self.avatarButton];
            [self.contentView addSubview:self.verifyAvatar];
        }
        else
        {
            [self.contentView addSubview:self.title];
            [self.contentView addSubview:self.detail];
        }
    }
    return self;
}
-(UIButton *) avatarButton
{
    if (!_avatarButton)
    {
        _avatarButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _avatarButton.frame = CGRectMake(kPersonViewCellLeftOffset, (kPersonViewFirstCell - kPersonViewCellAvatarHeight)/2, kPersonViewCellAvatarHeight, kPersonViewCellAvatarHeight);
        _avatarButton.layer.masksToBounds = YES;
        _avatarButton.layer.cornerRadius = kPersonViewCellAvatarHeight/2;
        _avatarButton.backgroundColor = [UIColor clearColor];
    }
    return _avatarButton;
}
-(UILabel *) verifyAvatar
{
    if (!_verifyAvatar)
    {
        NSString *string = @"修改头像";
        UIFont *font = [UIFont systemFontOfSize:13.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _verifyAvatar = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarButton.right + 33.0f, 0, size.width,kPersonViewFirstCell)];
        _verifyAvatar.text = string;
        _verifyAvatar.textColor = [UIColor colorWithHexString:@"36383a"];
        _verifyAvatar.textAlignment = NSTextAlignmentLeft;
        _verifyAvatar.backgroundColor = [UIColor clearColor];
        _verifyAvatar.font =font;

    }
    return _verifyAvatar;
}
-(UILabel *) title
{
    if (!_title)
    {
        NSString *string = @"修改头像";
        UIFont *font = [UIFont systemFontOfSize:12.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _title = [[UILabel alloc]initWithFrame:CGRectMake(self.avatarButton.left, 0, size.width,kPersonViewSecondCell)];
        _title.text = string;
        _title.textColor = [UIColor colorWithHexString:@"848a91"];
        _title.textAlignment = NSTextAlignmentLeft;
        _title.backgroundColor = [UIColor clearColor];
        _title.font =font;
    }
    return _title;
}
-(UILabel *) detail
{
    if (!_detail)
    {
        UIFont *font = [UIFont systemFontOfSize:13.0f];
        _detail = [[UILabel alloc]initWithFrame:CGRectMake(self.title.right + 33.0f, 0,kScreenWidth - kPersonViewCellLeftOffset - self.title.right - 33.0f,kPersonViewSecondCell)];
        _detail.textColor = [UIColor colorWithHexString:@"36383a"];
        _detail.textAlignment = NSTextAlignmentLeft;
        _detail.backgroundColor = [UIColor clearColor];
        _detail.font =font;
    }
    return _detail;
}
-(void)reloadAvatar:(UserModel*) userModel
{
    [self.avatarButton sd_setBackgroundImageWithURL:[NSURL URLWithString:userModel.data.pic] forState:UIControlStateNormal];
    [self.avatarButton sd_setBackgroundImageWithURL:[NSURL URLWithString:userModel.data.pic] forState:UIControlStateHighlighted];
}
-(void)reloadTitle:(NSString *)title
{
    self.title.text = title;
}
-(void)reloadSecondCellData:(UserModel *) userModel row:(NSInteger) row
{
    if (row == 1)
    {
        self.detail.text = userModel.data.nick;
    }
    else if (row == 2)
    {
        self.detail.text = userModel.data.sexDesc;
    }
    else if (row == 3)
    {
        self.detail.text = @"";
    }
    else if (row == 4)
    {
        self.detail.text = @"";
    }
}
@end
