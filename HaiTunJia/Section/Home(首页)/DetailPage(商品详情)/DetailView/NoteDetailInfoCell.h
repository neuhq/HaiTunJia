
#import <UIKit/UIKit.h>
#import "DetailController.h"
@class DetailController;

@interface NoteDetailInfoCell : UITableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style
   reuseIdentifier:(NSString *)reuseIdentifier
      withCellType:(DetailCellType) cellType;


-(void)setData;

-(void)setCommentAndLikeData;
@end
