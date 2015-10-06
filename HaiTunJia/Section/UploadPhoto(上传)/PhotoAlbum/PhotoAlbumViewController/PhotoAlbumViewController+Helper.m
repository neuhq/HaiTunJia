
#import "PhotoAlbumViewController+Helper.h"
#import "PhotoAlbumCollectionViewCell.h"
#import "PhotoAlbumModel.h"
@implementation PhotoAlbumViewController (Helper)

//-(void)getAllLocalPhotoGroup
//{
//    ALAssetsLibrary *assetsLibrary;
//    NSMutableArray *groupArray;
//    assetsLibrary = [[ALAssetsLibrary alloc] init];
//    groupArray=[[NSMutableArray alloc] initWithCapacity:1];
//    [assetsLibrary enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:^(ALAssetsGroup *group, BOOL *stop) {
//        if (group)
//        {
//            [groupArray addObject:group];
//            
//            for (NSInteger i = 0; i < groupArray.count; i++)
//            {
//                ALAssetsGroup *assetsGroup = [groupArray objectAtIndex:i];
//                [assetsGroup enumerateAssetsWithOptions:NSEnumerationReverse usingBlock:^(ALAsset *result, NSUInteger index, BOOL *stop) {
//                    if (result)
//                    {
//                        NSString *urlstr=[NSString stringWithFormat:@"%@",result.defaultRepresentation.url];//图片的url
//                        [group setAssetsFilter:[ALAssetsFilter allPhotos]];
//                        [assetsLibrary assetForURL:[NSURL URLWithString:urlstr] resultBlock:^(ALAsset *asset) {
//                            PhotoAlbumModel *model = [[PhotoAlbumModel alloc]init];
//                            model.photo = [UIImage imageWithCGImage:asset.thumbnail];
//                            model.posterImage = [UIImage imageWithCGImage:[assetsGroup posterImage]];
//                            model.imageTotleCount = [group numberOfAssets];
//                            model.groupName =  [group valueForProperty:ALAssetsGroupPropertyName];
//                            [self.imageListArray addObject:model];
//                            [self.photoCollectionView reloadData];
//                        } failureBlock:^(NSError *error) {
//                            
//                        }];
//                    }
//                    
//                }];
//            }
//        }
//    } failureBlock:^(NSError *error) {
//        NSLog(@"Group not found!\n");
//    }];
//}
-(void)getAllLocalPhotoGroup
{
    //获取相册的所有图片
        dispatch_async(dispatch_get_main_queue(), ^{
            
            @autoreleasepool {
                ALAssetsLibraryAccessFailureBlock failureblock = ^(NSError *myerror)
                {
                    NSLog(@"相册访问失败 =%@", [myerror localizedDescription]);
                    if ([myerror.localizedDescription rangeOfString:@"Global denied access"].location!=NSNotFound)
                    {
                        NSLog(@"无法访问相册.请在'设置->定位服务'设置为打开状态.");
                    }
                    else
                    {
                        NSLog(@"相册访问失败.");
                    }
                };
                
                ALAssetsGroupEnumerationResultsBlock groupEnumerAtion = ^(ALAsset *result, NSUInteger index, BOOL *stop){
                    if (result!=NULL)
                    {
                        if ([[result valueForProperty:ALAssetPropertyType] isEqualToString:ALAssetTypePhoto])
                        {
                            NSString *urlstr=[NSString stringWithFormat:@"%@",result.defaultRepresentation.url];//图片的url
                            [self.imageListArray addObject:urlstr];
                            [self.photoCollectionView reloadData];
                        }
                    }
                };
                
                ALAssetsLibraryGroupsEnumerationResultsBlock libraryGroupsEnumeration = ^(ALAssetsGroup* group, BOOL* stop){

                    if (group == nil)
                    {
                        ;
                    }
                    
                    if (group!=nil)
                    {
                        PhotoAlbumModel *model = [[PhotoAlbumModel alloc]init];
                        NSString *groupName=[NSString stringWithFormat:@"%@",group];//获取相簿的组
                         groupName =  [group valueForProperty:ALAssetsGroupPropertyName];
                        model.posterImage = [UIImage imageWithCGImage:[group posterImage]];
                        model.imageTotleCount = [group numberOfAssets];
                        [self.photoModelArray addObject:model];
                        [group enumerateAssetsUsingBlock:groupEnumerAtion];
                    }
                    
                };
                
                ALAssetsLibrary* library = [[ALAssetsLibrary alloc] init];
                [library enumerateGroupsWithTypes:ALAssetsGroupAll
                                       usingBlock:libraryGroupsEnumeration
                                     failureBlock:failureblock];
            }
            
        });
}
- (void)getImage:(NSString *)urlStr cell:(PhotoAlbumCollectionViewCell *) cell
{
    ALAssetsLibrary *assetLibrary=[[ALAssetsLibrary alloc] init];
    NSURL *url=[NSURL URLWithString:urlStr];
    [assetLibrary assetForURL:url resultBlock:^(ALAsset *asset)  {
        UIImage *image=[UIImage imageWithCGImage:asset.thumbnail];
        cell.photoImageView.image=image;
        
    }failureBlock:^(NSError *error) {
        NSLog(@"error=%@",error);
    }];
}
@end
