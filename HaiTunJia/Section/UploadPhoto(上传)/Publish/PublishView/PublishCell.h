
#import <UIKit/UIKit.h>

extern const CGFloat kPublishCellHeight;

@interface PublishCell : UITableViewCell
<UITextViewDelegate>
@property(nonatomic,strong) UIImageView *publishImageView;

@property(nonatomic,strong) UITextView *contentTV;

@property(nonatomic,strong) UIButton *addImageButton;

@property(nonatomic,strong) UILabel *linkLabel;

@property(nonatomic,strong) UITextField *linkTF;

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier withSection:(NSInteger) section;

-(void)setFirstCellData:(UIImage *) photoImage;

-(void)setSecendCellData:(UIImage *) addImage;

@end
