#import "DetailTableViewFooterView.h"

const CGFloat kDetailTableViewFooterViewLeftOffset  = 15.0f;

const CGFloat kDetailTableViewFooterViewHeight = 70;

@interface DetailTableViewFooterView ()
<UITextFieldDelegate>

@end
@implementation DetailTableViewFooterView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
//        [self addSubview:self.loadMoreButton];
        [self addSubview:self.addCommentTF];
    }
    return self;
}
-(UIButton *) loadMoreButton
{
    if (!_loadMoreButton)
    {
        _loadMoreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _loadMoreButton.frame = CGRectMake(0, 0, kScreenWidth, 45.0f);
        [_loadMoreButton setTitle:@"加载更多评论" forState:UIControlStateNormal];
        [_loadMoreButton setTitle:@"加载更多评论" forState:UIControlStateHighlighted];
        _loadMoreButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_loadMoreButton setTitleColor:[UIColor colorWithHexString:@"bcbcc4"] forState:UIControlStateNormal];
        [_loadMoreButton setTitleColor:[UIColor colorWithHexString:@"bcbcc4"] forState:UIControlStateHighlighted];
        _loadMoreButton.backgroundColor = [UIColor clearColor];
    }
    return _loadMoreButton;
}
-(UITextField *) addCommentTF
{
    if (!_addCommentTF)
    {
        UIImage *image = [UIImage imageNamed:@"me_edit"];
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
        imageView.image =  image;
        _addCommentTF = [[UITextField alloc] initWithFrame:CGRectMake(kDetailTableViewFooterViewLeftOffset,15.0f,kScreenWidth - 2*kDetailTableViewFooterViewLeftOffset,40.0f)];
        _addCommentTF.font = [UIFont systemFontOfSize:13.0f];
        _addCommentTF.leftView = imageView;
        _addCommentTF.leftViewMode = UITextFieldViewModeAlways;
        _addCommentTF.textColor = [UIColor colorWithHexString:@"989fa6"];
        _addCommentTF.delegate = self;
//        _addCommentTF.enabled = NO;
        _addCommentTF.layer.masksToBounds = YES;
        _addCommentTF.layer.cornerRadius = 4;
        _addCommentTF.layer.borderWidth = 0.5f;
        _addCommentTF.layer.borderColor = [[UIColor colorWithHexString:@"c9c9ee"] CGColor];
        _addCommentTF.placeholder = @"添加一条评论！";
        _addCommentTF.keyboardType = UIKeyboardTypeDefault;
        _addCommentTF.autocorrectionType = UITextAutocorrectionTypeNo;
        _addCommentTF.autocapitalizationType = UITextAutocapitalizationTypeNone;
        _addCommentTF.backgroundColor = [UIColor colorWithHexString:@"fcfcfc"];
        
    }
    return _addCommentTF;
}
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    return NO;
}
@end
