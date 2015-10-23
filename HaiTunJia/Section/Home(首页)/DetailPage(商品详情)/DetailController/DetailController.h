/**********************************
 功能：商品详情页
 说明：
 ********************************/

#import "BaseViewController.h"


typedef enum DetailCellType{
    DetailCellType_NoteInfo,
    DetailCellType_CommentAndLike,
    DetailCellType_CommentList
}DetailCellType;

@class DetailBottomView;

//用于详情页点赞的同时刷新首页
typedef void(^PraiseSuccessBlock)(void);

@interface DetailController : BaseViewController
<UITableViewDataSource,
UITableViewDelegate>
@property(nonatomic,strong) UITableView *detailTableView;

//用户id
@property(nonatomic,strong) NSString *userId;

//笔记id
@property(nonatomic,strong) NSString *noteId;

@property(nonatomic,copy) PraiseSuccessBlock praiseSuccessBlock;

@property(nonatomic,strong) DetailBottomView *bottomView;

-(id)initWithId:(NSString *) noteId;

@end
