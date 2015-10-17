
#import <UIKit/UIKit.h>
#import "DetailController.h"
#import "DetailModel.h"

@protocol NoteDetailInfoCellDelegate <NSObject>

-(void)seeUser:(NSInteger) index;

@end

@interface NoteDetailInfoCell : UITableViewCell

//关注
@property(nonatomic,strong) UIButton *concern;

@property(nonatomic,weak) id<NoteDetailInfoCellDelegate> delegate;

-(id)initWithStyle:(UITableViewCellStyle)style
   reuseIdentifier:(NSString *)reuseIdentifier
      withCellType:(DetailCellType) cellType;


-(void)setDataWithModel:(DetailDataModel*) detailModel;

-(void)setCommentAndLikeData:(DetailDataModel *) detailModel;

@end
