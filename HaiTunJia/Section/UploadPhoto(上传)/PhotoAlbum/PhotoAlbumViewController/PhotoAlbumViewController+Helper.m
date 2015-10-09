
#import "PhotoAlbumViewController+Helper.h"
#import "PhotoAlbumCollectionViewCell.h"
#import "PhotoAlbumModel.h"
#import "SelectPhotoGroupView.h"
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
    if (self.photoGroupArray.count) {
      self.group = [self.photoGroupArray objectAtIndex:tag];
        self.navTitleView.hidden = NO;
        NSString *title = [self.group valueForProperty:ALAssetsGroupPropertyName];
        if ([title isEqualToString:@"Camera Roll"])
            title = @"相机胶卷";
            self.navTitle = title;
        [self.group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
            if (result)
            {
                NSString *type=[result valueForProperty:ALAssetPropertyType];
                if ([type isEqualToString:ALAssetTypePhoto])
                {
                    [self.imageListArray addObject:[UIImage imageWithCGImage:[result thumbnail]]];
                }
                [self.photoCollectionView reloadData];
            }
        }];
    }

}

@end
