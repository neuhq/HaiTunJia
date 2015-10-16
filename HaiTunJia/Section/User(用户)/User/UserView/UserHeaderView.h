#import <UIKit/UIKit.h>
#import "UserModel.h"

@protocol UserHeaderViewDelegate <NSObject>


-(void)selectTabAtIndex:(NSInteger )index;

@end

@interface UserHeaderView : UICollectionReusableView

@property(weak,nonatomic) id<UserHeaderViewDelegate> delegate;

+(CGFloat) getHeaderHeight;

-(void)reloadUserInfo:(UserModel *) userModel;

@end
