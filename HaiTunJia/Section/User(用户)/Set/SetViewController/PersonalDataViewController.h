#import "BaseViewController.h"

@class UserModel;
@interface PersonalDataViewController : BaseViewController

@property(nonatomic,strong) UITableView *personTableView;

@property(nonatomic,strong) NSArray *titleArray;

@property(nonatomic,strong) UserModel *userModel;

@property(nonatomic,strong) UIPickerView *pickerView;

@end
