

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
    self.imageView.frame = CGRectMake(20.0f, 5, 60, 60);
    
    NSString *title = [self.assetsGroup valueForProperty:ALAssetsGroupPropertyName];
    if ([title isEqualToString:@"Camera Roll"])
        title = @"相机胶卷";
    
    
    self.textLabel.frame = CGRectMake(self.imageView.right + 20.0f, 25, kScreenWidth - self.imageView.right - 20, 0);
    self.textLabel.text = [NSString stringWithFormat:@"%@(%ld)",title,self.assetsGroup.numberOfAssets];
    self.textLabel.textAlignment = NSTextAlignmentLeft;
    self.textLabel.font = [UIFont systemFontOfSize:15.0f];
    [self.textLabel sizeToFit];
}
@end
