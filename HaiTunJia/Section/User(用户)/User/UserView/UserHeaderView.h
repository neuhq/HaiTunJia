#import <UIKit/UIKit.h>

@protocol UserHeaderViewDelegate <NSObject>


-(void)selectTabAtIndex:(NSInteger )index;

@end

@interface UserHeaderView : UICollectionReusableView

@property(weak,nonatomic) id<UserHeaderViewDelegate> delegate;

@end
