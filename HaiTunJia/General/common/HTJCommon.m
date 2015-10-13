

#import "HTJCommon.h"

@implementation HTJCommon
+ (HTJCommon *)sharedManager
{
    static HTJCommon *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}

+(UIImage *)orientationALAsset:(ALAsset *) asset
{
    ALAssetRepresentation *assetRepresentation = [asset defaultRepresentation];
    CGImageRef fullResImage = [assetRepresentation fullResolutionImage];
    NSString *adjustment = [[assetRepresentation metadata] objectForKey:@"AdjustmentXMP"];
    if (adjustment) {
        NSData *xmpData = [adjustment dataUsingEncoding:NSUTF8StringEncoding];
        CIImage *image = [CIImage imageWithCGImage:fullResImage];
        
        NSError *error = nil;
        NSArray *filterArray = [CIFilter filterArrayFromSerializedXMP:xmpData
                                                     inputImageExtent:image.extent
                                                                error:&error];
        CIContext *context = [CIContext contextWithOptions:nil];
        if (filterArray && !error) {
            for (CIFilter *filter in filterArray) {
                [filter setValue:image forKey:kCIInputImageKey];
                image = [filter outputImage];
            }
            fullResImage = [context createCGImage:image fromRect:[image extent]];
        }
    }
    UIImage *img = [UIImage imageWithCGImage:fullResImage
                                       scale:[assetRepresentation scale]
                                 orientation:(UIImageOrientation)[assetRepresentation orientation]];
    return img;
}

@end
