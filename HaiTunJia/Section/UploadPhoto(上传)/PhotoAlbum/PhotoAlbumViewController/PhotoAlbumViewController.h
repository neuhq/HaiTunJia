#import "BaseViewController.h"
#import <AssetsLibrary/AssetsLibrary.h>
@class SelectPhotoGroupView;
@interface PhotoAlbumViewController : BaseViewController

@property(nonatomic,strong) UICollectionView *photoCollectionView;

@property(nonatomic,strong) NSMutableArray *imageListArray;

@property(nonatomic,strong) NSMutableArray *photoGroupArray;

@property(nonatomic,strong) SelectPhotoGroupView *groupView;

@property(nonatomic,strong)  ALAssetsLibrary *assetLibrary;

@property(nonatomic,strong) ALAssetsGroup *group;

@property(nonatomic,strong) UIImagePickerController *picker;

@end
