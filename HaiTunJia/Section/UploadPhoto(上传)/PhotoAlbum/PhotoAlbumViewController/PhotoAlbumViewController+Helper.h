#import "PhotoAlbumViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@class PhotoAlbumCollectionViewCell;
@interface PhotoAlbumViewController (Helper)
<UIImagePickerControllerDelegate,
UINavigationControllerDelegate>
/**
 *
 *  @brief  获取相册分组
 */
-(void)getPhotoAllGroup;

-(void)getAllphotoData:(NSInteger) tag;

-(void)getCamera;

@end
