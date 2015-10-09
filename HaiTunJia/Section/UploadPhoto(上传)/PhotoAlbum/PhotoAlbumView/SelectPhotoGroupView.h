
#import <UIKit/UIKit.h>


@protocol SelectPhotoGroupViewDelegate <NSObject>

-(void)selectAtIndex:(NSInteger) index;

@end

@interface SelectPhotoGroupView : UIView
<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic,strong) UITableView *photoGroupTable;

@property(nonatomic,weak) id<SelectPhotoGroupViewDelegate> delegate;

@property(nonatomic,strong) UIView *bgView;

-(id)initWithFrame:(CGRect)frame
withPhotoGroupData:(NSArray *) groupArray;

-(void) show;
@end
