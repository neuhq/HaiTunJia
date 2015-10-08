
#import "PhotoAlbumViewController+Helper.h"
#import "PhotoAlbumCollectionViewCell.h"
#import "PhotoAlbumModel.h"
@implementation PhotoAlbumViewController (Helper)
-(void)getPhotoAllGroup
{
    ALAssetsLibrary *assetLibrary=[[ALAssetsLibrary alloc] init];
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
    [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupSavedPhotos usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Photo Stream
    [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupPhotoStream usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Album
    [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupAlbum usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Event
    [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupEvent usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];
    
    // Faces
    [assetLibrary enumerateGroupsWithTypes:ALAssetsGroupFaces usingBlock:assetsGroupsEnumerationBlock failureBlock:assetsGroupsFailureBlock];

}
-(void)getAllphotoData:(NSInteger) tag
{
    [self.imageListArray removeAllObjects];
    if (self.photoGroupArray.count) {
      ALAssetsGroup *group = [self.photoGroupArray objectAtIndex:tag];
        [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
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
