
#import <UIKit/UIKit.h>
#import "UserModel.h"

extern const CGFloat kPersonViewFirstCell;
extern const CGFloat kPersonViewSecondCell;

@interface PersonViewCell : UITableViewCell

@property(nonatomic,strong) UILabel *detail;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier row:(NSInteger) row;

-(void)reloadSecondCellData:(UserModel *) userModel row:(NSInteger) row ;

-(void)reloadTitle:(NSString *)title;

-(void)reloadAvatar:(UserModel*) userModel;

@end
