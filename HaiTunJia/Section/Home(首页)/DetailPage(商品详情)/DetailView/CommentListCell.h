
#import <UIKit/UIKit.h>
#import "DetailModel.h"
@interface CommentListCell : UITableViewCell
-(void)setCellDataWithCommentModel:(CommentsModel *) commentsModel row:(NSInteger) row;

@end
