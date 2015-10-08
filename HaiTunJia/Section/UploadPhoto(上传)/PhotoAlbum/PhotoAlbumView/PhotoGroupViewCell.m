

#import "PhotoGroupViewCell.h"

@implementation PhotoGroupViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    self.imageView.image = [UIImage imageWithCGImage:self.assetsGroup.posterImage];
    self.textLabel.text = [NSString stringWithFormat:@"%@(%ld)",[self.assetsGroup valueForProperty:ALAssetsGroupPropertyName],self.assetsGroup.numberOfAssets];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.font = [UIFont systemFontOfSize:15.0f];
}
@end
