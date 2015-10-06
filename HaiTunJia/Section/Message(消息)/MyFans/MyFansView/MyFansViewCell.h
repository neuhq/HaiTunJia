
#import <UIKit/UIKit.h>

extern const CGFloat kMyFansViewCellHeight;

@interface MyFansViewCell : UITableViewCell

@property(nonatomic,strong) UIImageView *avatarImageView;

@property(nonatomic,strong) UILabel *name;

@property(nonatomic,strong) UILabel *content;

@property(nonatomic,strong) UIButton *concern;

@property(nonatomic,strong) UIView *line;

@end
