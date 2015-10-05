
#import "PhotoAlbumCollectionViewCell.h"

@implementation PhotoAlbumCollectionViewCell

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self.contentView addSubview:self.photoImageView];
    }
    return self;
}

-(UIImageView *) photoImageView
{
    if (!_photoImageView)
    {
        CGFloat width = (kScreenWidth - 20)/3;
        _photoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,width,width)];
        _photoImageView.backgroundColor = [UIColor redColor];
    }
    return _photoImageView;
}
@end
