

#import "BaseViewController.h"


typedef void(^PassTagValueBlock)(id object);
@interface AddTagViewController : BaseViewController

@property(nonatomic,copy) PassTagValueBlock passTagValueBlock;


-(id)initWithTagArray:(NSMutableArray *) tagArray;

@end
