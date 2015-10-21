
#import "PhotoAlbumViewController.h"
#import "PhotoAlbumCollectionViewCell.h"
#import "TakePhotoCollectionViewCell.h"
#import "PhotoAlbumViewController+Helper.h"
#import "PhotoAlbumModel.h"
#import "SelectPhotoGroupView.h"
#import "EditPhotoViewController.h"
#import "HTJCommon.h"
static NSString *kPhotoAlbumImageIndentifer   = @"kPhotoAlbumImageIndentifer";
static NSString *kPhotoAlbumTakePhotoIndentifer  =  @"kPhotoAlbumTakePhotoIndentifer";

@interface PhotoAlbumViewController ()
<UICollectionViewDelegate,
UICollectionViewDelegateFlowLayout,
UICollectionViewDataSource,
SelectPhotoGroupViewDelegate,
UIGestureRecognizerDelegate>

@property (nonatomic,assign) NSInteger index;

@end

@implementation PhotoAlbumViewController
+ (PhotoAlbumViewController *)sharedManager
{
    static PhotoAlbumViewController *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[PhotoAlbumViewController alloc] init];
    });
    return sharedAccountManagerInstance;
}
-(id)init
{
    self = [super init];
    if (self)
    {
//        [self initArray];
//        [self.view addSubview:self.photoCollectionView];
//        [self performSelectorInBackground:@selector(getPhotoAllGroup) withObject:nil];

    }
    return self;
}
#pragma mark  --- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [WSProgressHUD showWithStatus:@"Loading..." maskType:WSProgressHUDMaskTypeDefault];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [WSProgressHUD dismiss];
    });
    [self initArray];
    
    [self viewConfig];
    [self.view addSubview:self.photoCollectionView];

    [self getPhotoAllGroup];
    

}

-(void)viewWillAppear:(BOOL)animated
{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleDefault];
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    if([HTJCommon sharedManager].isAddImage == NO)
          [self hideTabbar:NO];
    
    if (self.isHidenLeftButton)
    {
        self.leftBarButton.hidden = YES;
    }
    else
    {
        self.leftBarButton.hidden = NO;
        [self.leftButtonWithWord setTitle:@"取消" forState:UIControlStateNormal];
    }
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
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        layout.minimumInteritemSpacing = 5;
        layout.minimumLineSpacing = 5;
        if([HTJCommon sharedManager].isAddImage == NO)
            _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth,kScreenHeight - kNavigationBarHeight - CONTENT_TABBAR_HEIGHT) collectionViewLayout:layout];
        else
             _photoCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth,kScreenHeight - kNavigationBarHeight) collectionViewLayout:layout];
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
-(SelectPhotoGroupView *) groupView
{
    if (!_groupView)
    {
        _groupView = [[SelectPhotoGroupView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) withPhotoGroupData:self.photoGroupArray];
        _groupView.backgroundColor = [UIColor clearColor];
        _groupView.delegate = self;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapBgViewAction)];
        tap.delegate = self;
        [_groupView.bgView addGestureRecognizer:tap];
    }
    return _groupView;
}
#pragma mark -- helper
-(void)viewConfig
{
//    self.navTitleView.hidden = NO;
//    self.navTitle = @"相机胶卷";
//    self.leftBarButton.hidden = YES;
//    [self.customNavigationBar addSubview:self.leftButtonWithWord];
//    self.leftButtonWithWordString = @"取消";
}
-(void)initArray
{
    self.imageListArray = [[NSMutableArray alloc]init];
    self.photoGroupArray = [[NSMutableArray alloc]initWithCapacity:10];
    self.fullImageArray = [[NSMutableArray alloc]init];
}
#pragma mark  - delegate
-(void)selectAtIndex:(NSInteger)index
{
    [self getAllphotoData:index];
    self.index = index;
    [self.groupView removeFromSuperview];
    self.isTapNavBarTitleView = NO;
    [self.groupView.photoGroupTable selectRowAtIndexPath:[NSIndexPath indexPathForRow:index inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    // 输出点击的view的类名
    NSLog(@"%@", NSStringFromClass([touch.view class]));
    
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return  YES;
}
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
        cell.photoImageView.image = self.imageListArray[indexPath.item - 1];
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
    if (indexPath.row == 0)
    {
         [self getCamera];
    }
    else
    {
        ALAsset *result = self.fullImageArray[indexPath.item - 1];
        UIImage *img =  [HTJCommon orientationALAsset:result];
        EditPhotoViewController *edit = [[EditPhotoViewController alloc]initWithImage:img];
        [self.navigationController pushViewController:edit animated:YES];
    }
}



#pragma mark -- Action/jump
-(void)tapTitleViewAction
{
    [super tapTitleViewAction];
    if (self.photoGroupArray)
    {
        if (self.isTapNavBarTitleView == YES)
        {
            [self.view addSubview:self.groupView];
        }
        else
        {
            [self.groupView removeFromSuperview];
        }
    }
}
-(void)tapBgViewAction
{
    [self.groupView removeFromSuperview];
}
-(void)goBackAction
{
    [super goBackAction];
}
@end
