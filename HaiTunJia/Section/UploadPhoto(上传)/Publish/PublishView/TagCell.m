
#import "TagCell.h"

const CGFloat KtagCellHeight = 46.0f;

@implementation TagCell

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
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        self.frame = CGRectMake(0, 0, kScreenWidth, KtagCellHeight);
//        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, KtagCellHeight - 0.5f, kScreenWidth, 0.5f)];
//        line.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
//        [self.contentView addSubview:line];
    }
    return self;
}

-(void)setData
{
    self.imageView.image = [UIImage imageNamed:@"icon_smalllabel"];
    self.textLabel.text = @"标签";
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.textColor = [UIColor colorWithHexString:@"626a73"];
    self.frame = CGRectMake(0, 0, kScreenWidth, KtagCellHeight);
}
@end
