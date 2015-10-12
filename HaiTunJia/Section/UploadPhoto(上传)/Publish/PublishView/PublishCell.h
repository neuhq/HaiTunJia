
#import <UIKit/UIKit.h>

@interface PublishCell : UITableViewCell
<UITextViewDelegate>
@property(nonatomic,strong) UIImageView *publishImageView;

@property(nonatomic,strong) UITextView *contentTV;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSection:(NSInteger) section;


@end
