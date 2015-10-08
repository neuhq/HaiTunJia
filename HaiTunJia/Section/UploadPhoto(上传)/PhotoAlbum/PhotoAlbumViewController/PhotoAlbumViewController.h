#import "BaseViewController.h"

@class SelectPhotoGroupView;
@interface PhotoAlbumViewController : BaseViewController

@property(nonatomic,strong) UICollectionView *photoCollectionView;

@property(nonatomic,strong) NSMutableArray *imageListArray;

@property(nonatomic,strong) NSMutableArray *photoGroupArray;

@property(nonatomic,strong) SelectPhotoGroupView *groupView;

@end
