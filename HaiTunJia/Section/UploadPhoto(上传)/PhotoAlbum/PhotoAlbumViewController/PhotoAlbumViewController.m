
#import "PhotoAlbumViewController.h"
#import "PhotoAlbumCollectionViewCell.h"
#import "TakePhotoCollectionViewCell.h"
#import "PhotoAlbumViewController+Helper.h"
static NSString *kPhotoAlbumImageIndentifer   = @"kPhotoAlbumImageIndentifer";
static NSString *kPhotoAlbumTakePhotoIndentifer  =  @"kPhotoAlbumTakePhotoIndentifer";

@interface PhotoAlbumViewController ()
<UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource>


@end
@implementation PhotoAlbumViewController


#pragma mark  --- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initArray];
    
    [self viewConfig];
    
    [self getAllLocalPhotoGroup];
    
    [self.view addSubview:self.photoCollectionView];

}
-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [self hideTabbar:NO];
    [super viewDidAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [self hideTabbar:YES];
    
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
#pragma mark --- UI
-(UICollectionView *) photoCollectionView
{
    if(!_photoCollectionView)
    {
        // UICollectionViewFlowLayout的初始化（与刷新控件无关）
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth,kScreenHeight - kNavigationBarHeight - CONTENT_TABBAR_HEIGHT) collectionViewLayout:layout];
        _photoCollectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        _photoCollectionView.dataSource = self;
        _photoCollectionView.delegate = self;
        _photoCollectionView.alwaysBounceVertical = YES;
        _photoCollectionView.backgroundColor = [UIColor whiteColor];
        _photoCollectionView.clipsToBounds = YES;
        [_photoCollectionView registerClass:[PhotoAlbumCollectionViewCell class]
                       forCellWithReuseIdentifier:kPhotoAlbumImageIndentifer];
        [_photoCollectionView registerClass:[TakePhotoCollectionViewCell class]
                 forCellWithReuseIdentifier:kPhotoAlbumTakePhotoIndentifer];

    }
    return _photoCollectionView;
}


#pragma mark -- helper
-(void)viewConfig
{
    self.leftBarButton.hidden = YES;
    [self.customNavigationBar addSubview:self.leftButtonWithWord];
    self.leftButtonWithWordString = @"取消";
}
-(void)initArray
{
    self.imageListArray = [[NSMutableArray alloc]init];
}
#pragma mark  - delegate
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageListArray.count + 1;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == 0)
    {
        TakePhotoCollectionViewCell *cell =
        (TakePhotoCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kPhotoAlbumTakePhotoIndentifer
                                                                                  forIndexPath:indexPath];
        return cell;
    }
    else
    {
        PhotoAlbumCollectionViewCell *cell =
        (PhotoAlbumCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:kPhotoAlbumImageIndentifer
                                                                                  forIndexPath:indexPath];
        cell.photoImageView.image = self.imageListArray[indexPath.row - 1];
        return cell;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat width = (kScreenWidth - 20)/3;
    width = width*100/100;
    CGSize size = CGSizeMake(width, width);
    return size;
}
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}



#pragma mark -- Action/jump
@end
