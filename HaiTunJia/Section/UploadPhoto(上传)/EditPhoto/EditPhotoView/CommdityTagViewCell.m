#import "CommdityTagViewCell.h"

@implementation CommdityTagViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier row:(NSInteger ) row
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithHexString:@"000000"];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        if (row == 0 || row == 1)
        {
            [self.contentView addSubview:self.leftImageView];
            [self.contentView addSubview:self.leftTextField];
            [self.contentView addSubview:self.rightTextField];
        }
        else
        {
            [self.contentView addSubview:self.leftImageView];
            [self.contentView addSubview:self.oneTextField];
        }
    }
    return self;
}
-(UIImageView *) leftImageView
{
    if (!_leftImageView )
    {
        UIImage *image = [UIImage imageNamed:@"label_diqu"];
        _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(20.0f, 10.0f, image.size.width, image.size.height)];
        _leftImageView.backgroundColor = [UIColor clearColor];
    }
    return _leftImageView;
}
-(UITextField *) leftTextField
{
    if (!_leftTextField)
    {
        _leftTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.leftImageView.right + 20.0f,0,(kScreenWidth - 4*20 -self.leftImageView.size.width)/2,41.0f)];
        _leftTextField.font = [UIFont systemFontOfSize:13];
        _leftTextField.borderStyle = UITextBorderStyleNone;
        [_leftTextField setValue:[UIColor colorWithHexString:@"ffffff"] forKeyPath:@"_placeholderLabel.textColor"];
        _leftTextField.textColor = [UIColor colorWithHexString:@"ffffff"];
        [_leftTextField setValue:[UIColor redColor] forKeyPath:@"_placeholderLabel.textColor"];
        _leftTextField.delegate = self;
        _leftTextField.placeholder = @"fddkdg";
        _leftTextField.keyboardType = UIKeyboardTypeNumberPad;
        _leftTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _leftTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _leftTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _leftTextField.backgroundColor = [UIColor clearColor];
        _leftTextField.layer.masksToBounds = YES;
        _leftTextField.layer.cornerRadius = 4.0f;
        _leftTextField.layer.borderWidth = 0.5f;
        _leftTextField.layer.borderColor = [[UIColor colorWithHexString:@"f9f7f7"] CGColor];
    }
    return _leftTextField;
}
-(UITextField *) rightTextField
{
    if (!_rightTextField)
    {
        _rightTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.leftTextField.right + 20.0f,0,(kScreenWidth - 4*20 -self.leftImageView.size.width)/2,41.0f)];
        _rightTextField.font = [UIFont systemFontOfSize:13];
        _rightTextField.borderStyle = UITextBorderStyleNone;
        [_rightTextField setValue:[UIColor colorWithHexString:@"ffffff"] forKeyPath:@"_placeholderLabel.textColor"];
        _rightTextField.textColor = [UIColor colorWithHexString:@"ffffff"];
        _rightTextField.delegate = self;
        _rightTextField.keyboardType = UIKeyboardTypeNumberPad;
        _rightTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _rightTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _rightTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _rightTextField.backgroundColor = [UIColor clearColor];
        _rightTextField.layer.masksToBounds = YES;
        _rightTextField.layer.cornerRadius = 4.0f;
        _rightTextField.layer.borderWidth = 0.5f;
        _rightTextField.layer.borderColor = [[UIColor colorWithHexString:@"f9f7f7"] CGColor];

    }
    return _rightTextField;
}
-(UITextField *) oneTextField
{
    if (!_oneTextField)
    {
        _oneTextField = [[UITextField alloc] initWithFrame:CGRectMake(self.leftTextField.left ,0,kScreenWidth - 3*20 -self.leftImageView.size.width ,41.0f)];
        _oneTextField.font = [UIFont systemFontOfSize:13];
        _oneTextField.borderStyle = UITextBorderStyleNone;
        [_oneTextField setValue:[UIColor colorWithHexString:@"ffffff"] forKeyPath:@"_placeholderLabel.textColor"];
        _oneTextField.textColor = [UIColor colorWithHexString:@"ffffff"];
        _oneTextField.delegate = self;
        _oneTextField.keyboardType = UIKeyboardTypeNumberPad;
        _oneTextField.autocorrectionType = UITextAutocorrectionTypeNo;
        _oneTextField.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _oneTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
        _oneTextField.backgroundColor = [UIColor clearColor];
        _oneTextField.layer.masksToBounds = YES;
        _oneTextField.layer.cornerRadius = 4.0f;
        _oneTextField.layer.borderWidth = 0.5f;
        _oneTextField.layer.borderColor = [[UIColor colorWithHexString:@"f9f7f7"] CGColor];
    }
    return _oneTextField;
}
-(void)reloadFirstImage:(UIImage *) image row:(NSInteger) row
{
    self.leftImageView.image = image;
    if (row == 0)
    {
        self.leftTextField.placeholder = @"品牌";
        self.rightTextField.placeholder = @"商品名";
    }
    else
    {
        self.leftTextField.placeholder = @"币种";
        self.rightTextField.placeholder = @"价格";
    }
}

-(void)reloadSecondImage:(UIImage *) image row:(NSInteger) row
{
    self.leftImageView.image = image;
    if (row == 3)
    {
        self.oneTextField.placeholder = @"电商名称/具体购买地点";
    }
    else
    {
        self.oneTextField.placeholder = @"类别";
    }
}
@end
