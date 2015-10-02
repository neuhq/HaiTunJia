/**********************************
 功能：商品详情页
 说明：
 ********************************/

#import "BaseViewController.h"

@interface DetailController : BaseViewController
<UITableViewDataSource,
UITableViewDelegate>
@property(nonatomic,strong) UITableView *detailTableView;

//用户id
@property(nonatomic,strong) NSString *userId;

//笔记id
@property(nonatomic,strong) NSString *noteId;

@end
