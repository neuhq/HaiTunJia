#import "PhotoAlbumViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@class PhotoAlbumCollectionViewCell;
@interface PhotoAlbumViewController (Helper)

/**
 *
 *  @brief  获取相册分组
 */
-(void)getPhotoAllGroup;

-(void)getAllphotoData:(NSInteger) tag;

@end
