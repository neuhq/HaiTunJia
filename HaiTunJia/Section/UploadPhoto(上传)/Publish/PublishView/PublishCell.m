
#import "PublishCell.h"


@interface PublishCell ()

@property(nonatomic,strong) UIView *line;

@property(nonatomic,strong) UIImageView *tagImageView;

@property(nonatomic,strong) UILabel *tagLabel;


@property(nonatomic,assign) NSInteger section;

@end
@implementation PublishCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSection:(NSInteger) section
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        if (section == 0)
        {
            [self.contentView addSubview:self.publishImageView];
            [self.contentView addSubview:self.contentTV];
            [self.contentView addSubview:self.line];
        }
        else if(section == 1)
        {
            
        }
        else
        {
            
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
        _contentTV = [[UITextView alloc] initWithFrame:CGRectMake(self.publishImageView.right + 10.0f,self.publishImageView.top,kScreenWidth - _contentTV.right - 20.0f,self.publishImageView.height)];
        _contentTV.font = [UIFont systemFontOfSize:16];
        _contentTV.textColor = [UIColor colorWithHexString:@"4a4b4d"];
        _contentTV.delegate = self;
        _contentTV.text = @"分享您的购买使用心得吧！";
        _contentTV.keyboardType = UIKeyboardTypeNumberPad;
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
        _line = [[UIView alloc]initWithFrame:CGRectMake(0, self.publishImageView.bottom + 15.0f, kScreenWidth, 0.5f)];
        _line.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
    }
    return _line;
}











@end
