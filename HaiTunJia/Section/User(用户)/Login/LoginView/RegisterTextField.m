
#import "RegisterTextField.h"

const CGFloat kRegisterViewLeftOffset  =  25.0f;
const CGFloat kRegisterViewHeight = 40.0f;
@interface RegisterTextField ()
<UITextFieldDelegate>

@property(nonatomic,strong) UIView *line;

@end

@implementation RegisterTextField

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.line];
        [self addSubview:self.customTextField];
    }
    return self;
}

-(UIView *) line
{
    if (!_line)
    {
        _line = [[UIView alloc]initWithFrame:CGRectMake(kRegisterViewLeftOffset, kRegisterViewHeight - 0.5f, kScreenWidth - 2*kRegisterViewLeftOffset, 0.5f)];
        _line.backgroundColor = [UIColor colorWithHexString:@"a3a5a8"];
    }
    return _line;
}
-(UITextField *) customTextField
{
    if (!_customTextField)
    {
        _customTextField = [[UITextField alloc] initWithFrame:CGRectMake(kRegisterViewLeftOffset,0,kScreenWidth - 2*kRegisterViewLeftOffset,30)];
        _customTextField.font = [UIFont systemFontOfSize:16];
        _customTextField.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _customTextField.delegate = self;
        _customTextField.keyboardType = UIKeyboardTypeDefault;
        _customTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _customTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _customTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _customTextField.backgroundColor = [UIColor whiteColor];
    }
    return _customTextField;
}
@end
