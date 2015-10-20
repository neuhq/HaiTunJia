

#import "BaseViewController.h"

typedef void(^AddTagEndBlock)(id object);
@interface CommodityTagViewController : BaseViewController


@property(nonatomic,copy) AddTagEndBlock endBlock;

@end
