

#import "TagListCell.h"
#import "DWTagList.h"


@interface TagListCell ()

@property(nonatomic,strong) DWTagList *tagView;

@end
@implementation TagListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        [self.contentView addSubview:self.tagView];
    }
    return self;
}
-(DWTagList *) tagView
{
    if (!_tagView)
    {
        _tagView = [[DWTagList alloc]init];
    }
    return _tagView;
}
-(void)setData:(NSMutableArray *) array
{
    self.tagView.frame  =  CGRectMake( 10.0f, 10, kScreenWidth - 20, 0);
    [self.tagView setTags:array];
    CGSize tagSize =  [self.tagView fittedSize];
    self.frame = CGRectMake(0, 0, kScreenWidth, 10 + tagSize.height + 10);
}
@end
