
#import "BaseViewController.h"

@interface PublishViewController : BaseViewController


@property(nonatomic,strong) UIImage *publishImage;

@property(nonatomic,strong) UIImage *addImage;

+ (PublishViewController *)sharedManager;

-(void)addNewImage:(UIImage *) newImage;

-(id)initWithPublishImge:(UIImage *) image;

@end
