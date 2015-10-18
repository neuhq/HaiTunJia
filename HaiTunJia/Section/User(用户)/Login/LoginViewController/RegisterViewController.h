

#import "BaseViewController.h"

typedef void(^RegisterEndBlock)();
@interface RegisterViewController : BaseViewController

@property(nonatomic,strong) NSString *code;

@property(nonatomic,strong) NSString *phoneNum;

@property(nonatomic,copy) RegisterEndBlock endBlock;

@end
