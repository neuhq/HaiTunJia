#import "DetailController.h"
#import "NoteDetailInfoCell.h"
#import "DetailBottomView.h"
#import "DetailService.h"
#import "DetailModel.h"
#import "CollectCommdityService.h"

@interface DetailController ()
<DetailBottomViewDelegate>

@property(nonatomic,assign) BOOL isScrollDown;

@property(nonatomic,assign) CGFloat lastOffset_y;

@property(nonatomic,strong) DetailModel *detailModel;

@end

@implementation DetailController

-(id)initWithId:(NSString *) noteId
{
    self = [super init];
    if (self)
    {
        self.noteId = noteId;
    }
    return self;
}
#pragma mark -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self getNoteDetailInfo];
    [self.view addSubview:self.detailTableView];
    [self.view addSubview:self.bottomView];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

#pragma mark -- UI
-(UITableView *)detailTableView
{
    if (!_detailTableView)
    {
        _detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStyleGrouped];
        _detailTableView.delegate = self;
        _detailTableView.dataSource = self;
        _detailTableView.backgroundColor = [UIColor clearColor];
        _detailTableView.bounces = YES;
        _detailTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _detailTableView;
}
-(DetailBottomView *) bottomView
{
    if (!_bottomView)
    {
        _bottomView = [[DetailBottomView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 44.0f, kScreenWidth, 44.0f)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.delegate = self;
    }
    return _bottomView;
}
#pragma mark -- helper
-(void)viewConfig
{
    [self setTitle:@"笔记详情"];
}
#pragma mark -- HTTP
//详情请求
-(void)getNoteDetailInfo
{
    DetailService *service =[[DetailService alloc]init];
    [service startRequestDetailInfoWithParams:^{
        service.commodityId = self.noteId;
    } withDetailInfo:^(id object) {
        self.detailModel = object;
        [self.detailTableView reloadData];
    } withFailed:^(NSError *error) {
        
    }];
}
//收藏商品
-(void)collectCommodity
{
    CollectCommdityService *service = [[CollectCommdityService alloc]init];
    [service startRequestUserCollectWithParams:^{
        service.commodityId = self.noteId;
    } withResponsDataWithUserColletInfo:^(id object) {
        
    } withFailed:^(NSError *error) {
        
    }];
}
#pragma mark -- Delegate
-(void)selectBottomButtonAnIndx:(DetailBottomViewButtonType)type
{
    switch (type)
    {
        case DetailBottomViewButtonType_Pengyou:
        {
            
        }
            break;
        case DetailBottomViewButtonType_weixin:
        {
            
        }
            break;
        case DetailBottomViewButtonType_like:
        {
            
        }
            break;
        case DetailBottomViewButtonType_collect:
        {
            [self collectCommodity];
        }
            break;
        default:
            break;
    }
}
#pragma mark -- TableViewDelegate/TableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == DetailCellType_NoteInfo)
    {
        static NSString *noteInfoIndentifer = @"noteInfoIndentifer";
        NoteDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:noteInfoIndentifer];
        if (!cell)
        {
            cell = [[NoteDetailInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:noteInfoIndentifer withCellType:DetailCellType_NoteInfo];
        }
        if(self.detailModel)
           [cell setDataWithModel:self.detailModel.data];
        return cell;
    }
    else if (indexPath.section == DetailCellType_CommentAndLike)
    {
        static NSString *likeIndentifer = @"likeIndentifer";
        NoteDetailInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:likeIndentifer];
        if (!cell)
        {
            cell = [[NoteDetailInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:likeIndentifer withCellType:DetailCellType_CommentAndLike];
        }
//        [cell setCommentAndLikeData];
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.01f;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
        CGFloat newOffset_y = scrollView.contentOffset.y;
        if (_lastOffset_y == 0) {
            _lastOffset_y = newOffset_y;
        }
        if (newOffset_y <= _lastOffset_y) {
            _isScrollDown = YES;
        } else {
            _isScrollDown = NO;
        }
        _lastOffset_y = newOffset_y;
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [UIView animateWithDuration:.22 animations:^{
        if (_isScrollDown == YES) {
            _bottomView.bottom = _detailTableView.bottom;
        } else {
            _bottomView.top = _detailTableView.bottom;
        }
    }];
}
@end
