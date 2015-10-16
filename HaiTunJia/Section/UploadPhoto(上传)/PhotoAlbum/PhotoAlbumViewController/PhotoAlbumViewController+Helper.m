
#import "PhotoAlbumViewController+Helper.h"
#import "PhotoAlbumCollectionViewCell.h"
#import "PhotoAlbumModel.h"
#import "SelectPhotoGroupView.h"
#import "EditPhotoViewController.h"

@implementation PhotoAlbumViewController (Helper)
-(void)getPhotoAllGroup
{
    self.assetLibrary=[[ALAssetsLibrary alloc] init];
    void (^assetsGroupsEnumerationBlock)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *assetsGroup, BOOL *stop) {
        if(assetsGroup)
        {
            [assetsGroup setAssetsFilter:[ALAssetsFilter allPhotos]];
            if(assetsGroup.numberOfAssets > 0)
            {
                [self.photoGroupArray addObject:assetsGroup];
            }
        }
        [self getAllphotoData:0];
    };
    
    void (^assetsGroupsFailureBlock)(NSError *) = ^(NSError *error) {
        NSLog(@"Error: %@", [error localizedDescription]);
    };
    
    // Enumerate Camera Roll
    [self.assetLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Photo Stream
    [self.assetLibrary enumerateGroupsWithTypes:ALAssetsGroupPhotoStream usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Album
    [self.assetLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Event
    [self.assetLibrary enumerateGroupsWithTypes:ALAssetsGroupEvent usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Faces
    [self.assetLibrary enumerateGroupsWithTypes:ALAssetsGroupFaces usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];

}
-(void)getAllphotoData:(NSInteger) tag
{
    [self.imageListArray removeAllObjects];
    [self.fullImageArray removeAllObjects];
    if (self.photoGroupArray.count) {
      self.group = [self.photoGroupArray objectAtIndex:tag];
        self.navTitleView.hidden = NO;
        NSString *title = [self.group valueForProperty:ALAssetsGroupPropertyName];
        if ([title isEqualToString:@"Camera Roll"])
            title = @"相机胶卷";
            self.navTitle = title;
        self.isTapNavBarTitleView = YES;
        [self.group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (result)
            {
                NSString *type=[result valueForProperty:ALAssetPropertyType];
                if ([type isEqualToString:ALAssetTypePhoto])
                {
                    [self.imageListArray addObject:[UIImage imageWithCGImage:[result thumbnail]]];
                    [self.fullImageArray addObject:result];
                    
                }
                [self.photoCollectionView reloadData];
            }
        }];
    }

}
-(void)getCamera
{
    self.picker = [[UIImagePickerController alloc]init];
    //判断相机是否可用,因为模拟机是不可以的
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
        self.picker.sourceType=UIImagePickerControllerSourceTypeCamera;//设置 pick 的类型为相机
        self.picker.allowsEditing=NO;//设置是否可以编辑相片涂鸦
        self.picker.delegate=self;
        [self presentViewController:self.picker animated:true completion:nil];
    }
    else
    {
        NSLog(@"相机不可用");
    }
}
///代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSLog(@"xuanze");
    NSString *type=[info objectForKey:UIImagePickerControllerMediaType];
    //判断选择的是否是图片,这个 public.image和public.movie是固定的字段.
    if ([type isEqualToString:@"public.image"])
    {
        UIImage *image=[info objectForKey:UIImagePickerControllerOriginalImage];
        EditPhotoViewController *edit = [[EditPhotoViewController alloc]initWithImage:image];
        [self.navigationController pushViewController:edit animated:YES];
        //这一步主要是判断当是用相机拍摄的时候，保存到相册
        if (picker.sourceType==UIImagePickerControllerSourceTypeCamera) {
            UIImageWriteToSavedPhotosAlbum(image, self, nil, nil);
        }        
    }
    //判断选择的是否是视频
    if ([type isEqualToString:@"public.movie"]) {
        
    }
    [picker dismissViewControllerAnimated:false completion:nil];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    NSLog(@"取消");
    [picker dismissViewControllerAnimated:false completion:nil];
}
@end
