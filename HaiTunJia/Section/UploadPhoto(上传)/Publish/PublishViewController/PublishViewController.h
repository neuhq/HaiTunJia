
#import "BaseViewController.h"

@interface PublishViewController : BaseViewController


@property(nonatomic,strong) UIImage *publishImage;

+ (PublishViewController *)sharedManager;

-(void)addNewImage:(UIImage *) newImage;

@end
