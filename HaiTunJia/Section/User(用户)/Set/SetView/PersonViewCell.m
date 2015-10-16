#import "PersonViewCell.h"

@interface PersonViewCell ()

@property(nonatomic,strong) UIButton *avatarButton;

@property(nonatomic,strong) UILabel *title;

@property(nonatomic,strong) UITextField *detailTF;

@end
@implementation PersonViewCell
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier row:(NSInteger) row
{
    self = [super initWithStyle:UITableViewCellStyleDefault reuseIdentifier:reuseIdentifier];
    if (self)
    {
        if (row == 0)
        {
            
        }
        else
        {
            
        }
    }
    return self;
}
-(UIButton *) avatarButton
{
    if (!_avatarButton)
    {
        
    }
    return _avatarButton;
}
-(UILabel *) title
{
    if (!_title)
    {
        
    }
    return _title;
}
-(UITextField *) detailtF
{
    if (!_detailTF)
    {
        _detailTF = [[UITextField alloc] initWithFrame:CGRectMake(self.title.right + 33.0f,0,kScreenWidth - self.title.right - 15.0f,self.height)];
        _detailTF.font = [UIFont systemFontOfSize:13.0f];
        _detailTF.leftViewMode = UITextFieldViewModeAlways;
        _detailTF.textColor = [UIColor colorWithHexString:@"36383a"];
        _detailTF.layer.masksToBounds = YES;
        _detailTF.layer.cornerRadius = 4;
        _detailTF.layer.borderWidth = 0.5f;
        _detailTF.layer.borderColor = [[UIColor colorWithHexString:@"c9c9ee"] CGColor];
        _detailTF.keyboardType = UIKeyboardTypeDefault;
        _detailTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _detailTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _detailTF.backgroundColor = [UIColor colorWithHexString:@"fcfcfc"];
    }
    return _detailTF;
}
@end
