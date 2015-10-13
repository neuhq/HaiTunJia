
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
@interface HTJCommon : NSObject


@property(nonatomic,assign) BOOL isAddImage;

+ (HTJCommon *)sharedManager;

+(UIImage *)orientationALAsset:(ALAsset *) asset;


@end
