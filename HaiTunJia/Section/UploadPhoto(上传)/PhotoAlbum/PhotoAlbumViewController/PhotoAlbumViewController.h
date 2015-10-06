#import "BaseViewController.h"

@interface PhotoAlbumViewController : BaseViewController

@property(nonatomic,strong) UICollectionView *photoCollectionView;

@property(nonatomic,strong) NSMutableArray *imageListArray;

@property(nonatomic,strong) NSMutableArray *photoModelArray;

@end
