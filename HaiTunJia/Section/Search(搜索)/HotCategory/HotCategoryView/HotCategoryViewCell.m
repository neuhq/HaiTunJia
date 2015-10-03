#import "HotCategoryViewCell.h"


const CGFloat kHotCategoryViewCellLeftOffset = 20.0f;

@implementation HotCategoryViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView addSubview:self.categoryButton];
    }
    return self;
}

-(UIButton *) categoryButton
{
    if (!_categoryButton)
    {
        float width = (kScreenWidth - 5*kHotCategoryViewCellLeftOffset)/4;
        _categoryButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _categoryButton.layer.masksToBounds = YES;
        _categoryButton.layer.cornerRadius = width/2;
        _categoryButton.frame = CGRectMake(0, 0, width, width);
        _categoryButton.backgroundColor = [UIColor redColor];
//        [_categoryButton setBackgroundImage:[UIImage imageNamed:@"classfy_hufu"] forState:UIControlStateNormal];
//        [_categoryButton setBackgroundImage:[UIImage imageNamed:@"classfy_hufu"] forState:UIControlStateHighlighted];
//        [_categoryButton setTitle:@"护肤" forState:UIControlStateNormal];
//        [_categoryButton setTitle:@"护肤" forState:UIControlStateHighlighted];
        _categoryButton.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        [_categoryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [_categoryButton setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    }
    return _categoryButton;
}
@end
