#import <UIKit/UIKit.h>
#import "PublishModel.h"

@interface CommdityTagViewCell : UITableViewCell
<UITextFieldDelegate>
@property(nonatomic,strong) UITextField *leftTextField;

@property(nonatomic,strong) UITextField *rightTextField;

@property(nonatomic,strong) UITextField *oneTextField;

@property(nonatomic,strong) UIImageView *leftImageView;


-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier row:(NSInteger ) row;


-(void)reloadFirstImage:(UIImage *) image row:(NSInteger) row model:(PublishModel *) model;

-(void)reloadSecondImage:(UIImage *) image row:(NSInteger) row model:(PublishModel *) model;


@end
