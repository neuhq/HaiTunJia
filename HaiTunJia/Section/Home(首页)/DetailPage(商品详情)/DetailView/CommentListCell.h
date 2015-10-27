
#import <UIKit/UIKit.h>
#import "DetailModel.h"
@interface CommentListCell : UITableViewCell

@property(nonatomic,strong) UIButton *avatarButton;


-(void)setCellDataWithCommentModel:(CommentsModel *) commentsModel row:(NSInteger) row;

@end
