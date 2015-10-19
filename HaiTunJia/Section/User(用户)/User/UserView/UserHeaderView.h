#import <UIKit/UIKit.h>
#import "UserModel.h"

@protocol UserHeaderViewDelegate <NSObject>


-(void)selectTabAtIndex:(NSInteger )index;

@end

@interface UserHeaderView : UICollectionReusableView

@property(weak,nonatomic) id<UserHeaderViewDelegate> delegate;

@property(nonatomic,strong) UIButton *concernButton;

@property(nonatomic,strong) UIButton *fansButton;

+(CGFloat) getHeaderHeight;

-(void)reloadUserInfo:(UserModel *) userModel;

@end
