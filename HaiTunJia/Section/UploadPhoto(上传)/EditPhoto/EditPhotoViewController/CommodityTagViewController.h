

#import "BaseViewController.h"

typedef void(^AddTagEndBlock)(id object,BOOL isEdit,BOOL isDelete);
@interface CommodityTagViewController : BaseViewController


@property(nonatomic,copy) AddTagEndBlock endBlock;

//是否有标签进来编辑
@property(nonatomic,assign) BOOL isEdit;

@end
