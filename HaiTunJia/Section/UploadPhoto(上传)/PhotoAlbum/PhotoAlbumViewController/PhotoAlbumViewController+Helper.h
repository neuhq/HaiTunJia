#import "PhotoAlbumViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@class PhotoAlbumCollectionViewCell;
@interface PhotoAlbumViewController (Helper)

-(void)getAllLocalPhotoGroup;

- (void)getImage:(NSString *)urlStr cell:(PhotoAlbumCollectionViewCell *) cell;

@end
