
#import "BaseViewController.h"


typedef enum MyFansOrFocusType{
       MyFansOrFocusType_Myfans,
       MyFansOrFocusType_Focus
}MyFansOrFocusType;

@interface MyFansViewController : BaseViewController

@property(nonatomic,assign) MyFansOrFocusType type;

@end
