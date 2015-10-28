
#import "PublishCell.h"

const CGFloat kPublishCellHeight = 90.0f;

@interface PublishCell ()

@property(nonatomic,strong) UIView *line;

@property(nonatomic,strong) UIImageView *tagImageView;

@property(nonatomic,strong) UILabel *tagLabel;

@property(nonatomic,strong) UILabel *placeHolder;

@property(nonatomic,assign) NSInteger section;

@property(nonatomic,strong) UIImageView *photoImageView;

@property(nonatomic,strong) UILabel *discriLabel;

@property(nonatomic,strong) UIImageView *linkImge;

@end
@implementation PublishCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSection:(NSInteger) section
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        if (section == 0)
        {
            [self.contentView addSubview:self.publishImageView];
            [self.contentView addSubview:self.contentTV];
            [self.contentView addSubview:self.line];
        }
        else if(section == 1)
        {
            [self.contentView addSubview:self.photoImageView];
            [self.contentView addSubview:self.discriLabel];
            [self.contentView addSubview:self.addImageButton];
            
        }
        else
        {
            [self.contentView addSubview:self.linkImge];
            [self.contentView addSubview:self.linkTF];
        }
           
    }
    return self;
}
#pragma mark -- UI
-(UIImageView *)publishImageView
{
    if (!_publishImageView)
    {
        _publishImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15.0f, 15.0f, 60, 60)];
        _publishImageView.backgroundColor = [UIColor clearColor];
    }
    return _publishImageView;
}
-(UITextView *) contentTV
{
    if (!_contentTV)
    {
        _contentTV = [[UITextView alloc] initWithFrame:CGRectMake(self.publishImageView.right + 10.0f,self.publishImageView.top,kScreenWidth - 2*15 - self.publishImageView.right,self.publishImageView.height)];
        _contentTV.font = [UIFont systemFontOfSize:16];
        _contentTV.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _contentTV.delegate = self;
        _contentTV.editable = YES;
//        _contentTV.text = @"分享您的购买使用心得吧！";
        [_contentTV becomeFirstResponder];
        _contentTV.keyboardType = UIKeyboardTypeDefault;
        _contentTV.autocorrectionType = UITextAutocorrectionTypeNo;
        _contentTV.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _contentTV.backgroundColor = [UIColor clearColor];

    }
    return _contentTV;
}
-(UIView *) line
{
    if (!_line)
    {
        _line = [[UIView alloc]init];
        _line.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
    }
    return _line;
}

-(UIImageView *) photoImageView
{
    if (!_photoImageView)
    {
        UIImage *image = [UIImage imageNamed:@"icon_pic"];
        _photoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(15.0f, 15.0f, image.size.width, image.size.height)];
        _photoImageView.image = image;
        _photoImageView.backgroundColor = [UIColor clearColor];
    }
    return _photoImageView;
}
-(UILabel *) discriLabel
{
    if (!_discriLabel)
    {
        NSString *string = @"添加补充图片";
        UIFont *font = [UIFont systemFontOfSize:14.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _discriLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.photoImageView.right + 15.0f, self.photoImageView.top, size.width, size.height)];
        _discriLabel.textColor = [UIColor colorWithHexString:@"626A73"];
        _discriLabel.textAlignment = NSTextAlignmentLeft;
        _discriLabel.font = font;
        _discriLabel.text = string;
        _discriLabel.backgroundColor = [UIColor clearColor];

    }
    return _discriLabel;
}
-(UIButton *) addImageButton
{
    if (!_addImageButton)
    {
        _addImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _addImageButton.frame = CGRectMake(40, self.photoImageView.bottom + 15.0f, 60, 60);
        _addImageButton.backgroundColor = [UIColor clearColor];
    }
    return _addImageButton;
}
-(UIImageView *) linkImge
{
    if (!_linkImge)
    {
        UIImage *image = [UIImage imageNamed:@"icon_link"];
        _linkImge = [[UIImageView alloc]initWithFrame:CGRectMake(15.0f, (46 - image.size.height)/2, image.size.width, image.size.height)];
        _linkImge.image = image;
    }
    return _linkImge;
}
-(UITextField *) linkTF
{
    if (!_linkTF)
    {
        _linkTF = [[UITextField alloc] initWithFrame:CGRectMake(self.linkImge.right + 10.0f,0,kScreenWidth - 2*15 - self.linkImge.right,46)];
        _linkTF.font = [UIFont systemFontOfSize:16];
        _linkTF.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _linkTF.placeholder = @"添加购买链接";
        _linkTF.keyboardType = UIKeyboardTypeDefault;
        _linkTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _linkTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _linkTF.backgroundColor = [UIColor clearColor];
    }
    return _linkTF;
}
#pragma mark -- Delegate
- (void)textViewDidBeginEditing:(UITextView *)textView {
    if ([textView.text isEqualToString:@"分享您的购买使用心得吧！"]) {
        textView.text = @"";
    }
}
//在结束编辑的代理方法中进行如下操作
- (void)textViewDidEndEditing:(UITextView *)textView {
    if (textView.text.length<1) {
        textView.text = @"分享您的购买使用心得吧！";
    }
}
-(void)setFirstCellData:(UIImage *) photoImage
{
    _publishImageView.image = photoImage;
    
//    _contentTV.frame = CGRectMake(self.publishImageView.right + 10.0f,self.publishImageView.top,kScreenWidth - _contentTV.right - 20.0f,self.publishImageView.height);
    
    _line.frame = CGRectMake(0,kPublishCellHeight - 0.5f,kScreenWidth,0.5f);
    self.frame = CGRectMake(0, 0, kScreenWidth, self.line.bottom);

}
-(void)setSecendCellData:(UIImage *) addImage
{
    self.discriLabel.text = @"添加补充图片";
    
    [_addImageButton setBackgroundImage:addImage forState:UIControlStateNormal];
    [_addImageButton setBackgroundImage:addImage forState:UIControlStateHighlighted];
    self.frame  = CGRectMake(0, 0, kScreenWidth, self.addImageButton.bottom + 15.0f);
}

-(void)setThirdCellData
{
    
}






@end
