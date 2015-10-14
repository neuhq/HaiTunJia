
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
        [self.contentView addSubview:self.detailLabel];
        self.frame = CGRectMake(0, 0, kScreenWidth, KtagCellHeight);
//        UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, KtagCellHeight - 0.5f, kScreenWidth, 0.5f)];
//        line.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
//        [self.contentView addSubview:line];
    }
    return self;
}
-(UILabel *) detailLabel
{
    if (!_detailLabel)
    {
        _detailLabel = [[UILabel alloc]init];
        _detailLabel.textColor = [UIColor colorWithHexString:@"03a9f6"];
        _detailLabel.font = [UIFont systemFontOfSize:14.0f];
        _detailLabel.backgroundColor = [UIColor clearColor];
        _detailLabel.textAlignment = NSTextAlignmentRight;
    }
    return _detailLabel;
}
-(void)setData:(NSMutableArray *) array
{
    self.imageView.image = [UIImage imageNamed:@"icon_smalllabel"];
    self.textLabel.text = @"标签";
    self.textLabel.font = [UIFont systemFontOfSize:14.0f];
    self.textLabel.textColor = [UIColor colorWithHexString:@"626a73"];
    self.detailLabel.text = @"";
    for(NSInteger i = 0; i < array.count;i++)
    {
        self.detailLabel.text = [self.detailLabel.text stringByAppendingString:[NSString stringWithFormat:@" %@",array[i]]];
    }
    CGSize size = [self.detailLabel.text sizeWithAttributes:@{NSFontAttributeName:self.detailLabel.font}];
    self.detailLabel.frame = CGRectMake(kScreenWidth - 30 - size.width , 0, size.width, KtagCellHeight);
    self.frame = CGRectMake(0, 0, kScreenWidth, KtagCellHeight);
}
@end
