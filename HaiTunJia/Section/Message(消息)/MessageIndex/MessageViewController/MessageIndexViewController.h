/***********************************************
 功能：消息首页
 说明： // TODO:暂无网络请求数据
 **********************************************/
#import "BaseViewController.h"

@interface MessageIndexViewController : BaseViewController
<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic,strong) UITableView *messageTableView;

//头部本地数据
@property(nonatomic,strong) NSMutableArray *listLocalDataArray;

@end
