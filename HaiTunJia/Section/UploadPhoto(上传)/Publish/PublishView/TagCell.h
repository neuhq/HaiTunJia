
#import <UIKit/UIKit.h>

extern const CGFloat KtagCellHeight;

@interface TagCell : UITableViewCell

@property(nonatomic,strong) UILabel *detailLabel;

-(void)setData:(NSMutableArray *) array;

@end
