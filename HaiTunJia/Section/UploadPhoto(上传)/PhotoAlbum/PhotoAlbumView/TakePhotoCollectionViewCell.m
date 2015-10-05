
#import "TakePhotoCollectionViewCell.h"

@interface TakePhotoCollectionViewCell ()


@property(nonatomic,strong) UIImageView *photoImageView;

@property(nonatomic,strong) UILabel *takePhotoLabel;

@end

@implementation TakePhotoCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor colorWithHexString:@"03a9f6"];
        [self.contentView addSubview:self.takePhotoLabel];
        [self.contentView addSubview:self.photoImageView];
    }
    return self;
}
-(UIImageView *) photoImageView
{
    if (!_photoImageView)
    {
        UIImage *image = [UIImage imageNamed:@"icon_camera"];
        _photoImageView = [[UIImageView alloc]initWithFrame:CGRectMake((self.width - image.size.width)/2, self.takePhotoLabel.top - image.size.height, image.size.width, image.size.height)];
        _photoImageView.image = image;
        _photoImageView.backgroundColor = [UIColor clearColor];
    }
    return _photoImageView;
}
-(UILabel *) takePhotoLabel
{
    if (!_takePhotoLabel)
    {
        NSString *string = @"拍摄照片";
        UIFont *font = [UIFont systemFontOfSize:12.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _takePhotoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.height - 20 - size.height, self.width, size.height)];
        _takePhotoLabel.text = string;
        _takePhotoLabel.textColor = [UIColor colorWithHexString:@"ffffff"];
        _takePhotoLabel.textAlignment = NSTextAlignmentCenter;
        _takePhotoLabel.font = font;
        _takePhotoLabel.backgroundColor = [UIColor clearColor];
    }
    return _takePhotoLabel;
}
@end
