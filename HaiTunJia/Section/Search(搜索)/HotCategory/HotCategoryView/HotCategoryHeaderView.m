
#import "HotCategoryHeaderView.h"
#import "HotCategoryViewCell.h"

const CGFloat kHotCategoryHeaderViewTopOffset = 20.0f;

@interface HotCategoryHeaderView ()

@property(nonatomic,strong) UILabel *hotCategory;

@end
@implementation HotCategoryHeaderView


-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    {
        [self addSubview:self.hotCategory];
    }
    return self;
}

-(UILabel *) hotCategory
{
    if (!_hotCategory)
    {
        NSString *hotString = @"热门类别";
        UIFont *font = [UIFont systemFontOfSize:12.0f];
        CGSize size = [hotString sizeWithAttributes:@{NSFontAttributeName:font}];
        _hotCategory = [[UILabel alloc]initWithFrame:CGRectMake(kHotCategoryViewCellLeftOffset + 10, kHotCategoryHeaderViewTopOffset, kScreenWidth - 2*30, size.height)];
        _hotCategory.text = hotString;
        _hotCategory.textColor = [UIColor colorWithHexString:@"48484c"];
        _hotCategory.textAlignment = NSTextAlignmentLeft;
        _hotCategory.font = [UIFont systemFontOfSize:12.0f];
        _hotCategory.backgroundColor = [UIColor clearColor];

    }
    return _hotCategory;
}
@end
