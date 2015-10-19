
#import <UIKit/UIKit.h>
#import "UserModel.h"

@protocol OtherUserHeaderVIewDelegate <NSObject>


-(void)selectTabAtIndex:(NSInteger )index;

@end

@interface OtherUserHeaderVIew : UICollectionReusableView

@property(weak,nonatomic) id<OtherUserHeaderVIewDelegate> delegate;

+(CGFloat) getHeaderHeight;

-(void)reloadUserInfo:(UserModel *) userModel;

@property(nonatomic,strong) UIButton *concernButton;

@property(nonatomic,strong) UIButton *fansButton;
@end
