#import "BaseViewController.h"

@class UserModel;
typedef void(^VerifyUserInfoEndBlock)();
@interface PersonalDataViewController : BaseViewController

@property(nonatomic,strong) UITableView *personTableView;

@property(nonatomic,strong) NSArray *titleArray;

@property(nonatomic,strong) UserModel *userModel;

@property(nonatomic,strong) UIPickerView *pickerView;

@property(nonatomic,strong) VerifyUserInfoEndBlock endBlock;

@end
