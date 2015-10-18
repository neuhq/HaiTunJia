
#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "UserViewController.h"

@interface HTJCommon : NSObject

@property(nonatomic,strong) UserViewController *userVC;

@property(nonatomic,assign) BOOL isAddImage;

+ (HTJCommon *)sharedManager;

+(UIImage *)orientationALAsset:(ALAsset *) asset;


@end
