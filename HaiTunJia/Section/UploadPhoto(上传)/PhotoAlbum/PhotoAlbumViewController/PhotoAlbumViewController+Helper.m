
#import "PhotoAlbumViewController+Helper.h"
#import "PhotoAlbumCollectionViewCell.h"
@implementation PhotoAlbumViewController (Helper)

-(void)getAllLocalPhotoGroup
{
    ALAssetsLibrary *assetsLibrary;
    NSMutableArray *groupArray;
    assetsLibrary = [[ALAssetsLibrary alloc] init];
    groupArray=[[NSMutableArray alloc] initWithCapacity:1];
    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
        if (group)
        {
            NSInteger count = [group numberOfAssets];
            [group enumerateAssetsUsingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
                if (result)
                {
                    NSString *urlstr=[NSString stringWithFormat:@"%@",result.defaultRepresentation.url];//图片的url
                    [assetsLibrary assetForURL:[NSURL URLWithString:urlstr] resultBlock:^(ALAsset *asset) {
                        UIImage *image = [UIImage imageWithCGImage:asset.thumbnail];
                        [self.imageListArray addObject:image];
                        [self.photoCollectionView reloadData];
                    } failureBlock:^(NSError *error) {
                        
                    }];
                }
            }];

        }
    } failureBlock:^(NSError *error) {
        NSLog(@"Group not found!\n");
    }];
}
@end
