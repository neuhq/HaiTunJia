
#import "BaseViewController.h"
#import "PublishModel.h"

@interface PublishViewController : BaseViewController


@property(nonatomic,strong) UIImage *publishImage;

@property(nonatomic,strong) UIImage *addImage;

@property(nonatomic,strong) PublishModel *publishModel;

+ (PublishViewController *)sharedManager;

-(void)addNewImage:(UIImage *) newImage;

-(id)initWithPublishImge:(UIImage *) image;

-(void)setModel:(PublishModel *) model;

@end
