
#import <UIKit/UIKit.h>
#import "DetailController.h"
#import "DetailModel.h"
@class DetailController;


@interface NoteDetailInfoCell : UITableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style
   reuseIdentifier:(NSString *)reuseIdentifier
      withCellType:(DetailCellType) cellType;


-(void)setDataWithModel:(DetailDataModel*) detailModel;

-(void)setCommentAndLikeData:(DetailDataModel *) detailModel;

@end
