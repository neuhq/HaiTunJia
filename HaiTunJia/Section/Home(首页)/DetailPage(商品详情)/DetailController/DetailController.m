#import "DetailController.h"
#import "NoteDetailInfoCell.h"
#import "DetailBottomView.h"
#import "DetailService.h"
#import "DetailModel.h"
#import "CollectCommdityService.h"
#import "CommentListCell.h"
#import "PraiseCommodityService.h"
#import "DetailTableViewFooterView.h"
#import "YcKeyBoardView.h"
#import "AddCommentService.h"
#import "ChangeFollowRelationService.h"

@interface DetailController ()
<DetailBottomViewDelegate,
NoteDetailInfoCellDelegate,
YcKeyBoardViewDelegate>

@property(nonatomic,assign) BOOL isScrollDown;

@property(nonatomic,assign) CGFloat lastOffset_y;

@property(nonatomic,strong) DetailModel *detailModel;

@property(nonatomic,strong) DetailTableViewFooterView *footerView;

@property(nonatomic,strong) YcKeyBoardView *keyBoradView;

@property (nonatomic,assign) CGFloat keyBoardHeight;

@property (nonatomic,strong) NSString *commentContent;

@end

@implementation DetailController

-(id)initWithId:(NSString *) noteId
{
    self = [super init];
    if (self)
    {
        self.noteId = noteId;
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardShow:) name:UIKeyboardWillShowNotification object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    }
    return self;
}
#pragma mark -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self viewConfig];
    [self.view addSubview:self.detailTableView];
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer])
    {
        [self getNoteDetailInfo];

    }
    else
    {
        __weak DetailController *this = self;
        LoginViewController *login = [[LoginViewController alloc]init];
        login.endBlock = ^(){
            [this getNoteDetailInfo];
        };
        [self.navigationController pushViewController:login animated:YES];
    }

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
        _detailTableView.hidden = YES;
        _detailTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _detailTableView.tableFooterView = self.footerView;
    }
    return _detailTableView;
}
-(DetailBottomView *) bottomView
{
    if (!_bottomView)
    {
        _bottomView = [[DetailBottomView alloc]initWithFrame:CGRectMake(0, kScreenHeight - kDetailBottomViewHeight, kScreenWidth, kDetailBottomViewHeight)];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.delegate = self;
        _bottomView.hidden = YES;
    }
    return _bottomView;
}
-(DetailTableViewFooterView *) footerView
{
    if (!_footerView)
    {
        _footerView = [[DetailTableViewFooterView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kDetailTableViewFooterViewHeight)];
        _footerView.backgroundColor = [UIColor whiteColor];
        [_footerView.addCommentTF addTarget:self action:@selector(addComment) forControlEvents:UIControlEventTouchDown];
    }
    return _footerView;
}
//-(YcKeyBoardView *) keyBoradView
//{
//    if (!_keyBoradView)
//    {
//        _keyBoradView=[[YcKeyBoardView alloc]initWithFrame:CGRectMake(0, kScreenHeight-44, kScreenWidth, 44)];
//        _keyBoradView.delegate=self;
//        [_keyBoradView.textView becomeFirstResponder];
//        _keyBoradView.textView.returnKeyType=UIReturnKeySend;
//    }
//    return _keyBoradView;
//}
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
        self.detailTableView.hidden = NO;
        self.bottomView.hidden = NO;
        [self.bottomView reloadState:self.detailModel];
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
        if ([object integerValue] == 0)
        {
            [self.bottomView reloadCollectState:YES];
        }
        else
        {
            [self.bottomView reloadCollectState:NO];
        }
    } withFailed:^(NSError *error) {
        
    }];
}
-(void)praiseCommodidy
{
    PraiseCommodityService *service = [[PraiseCommodityService alloc]init];
    [service startRquestPraiseCommodity:^{
        service.commodityId = [NSString stringWithFormat:@"%ld",self.detailModel.data.commodity.iD];
    } praiseRespons:^(id obj) {
        if ([obj[@"code"] integerValue] == 0 )
        {
            [self.bottomView reloadPraiseState:YES];
        }
        else
        {
            [self.bottomView reloadPraiseState:NO];
        }
        
    } failed:^(NSError *error) {
        
    }];
}
-(void)addCommentRequest
{
    AddCommentService *service = [[AddCommentService alloc]init];
    [service startRequestComment:^{
        service.commodityId = self.noteId;
        service.content = self.commentContent;
        service.parentId = @"0";
    } respons:^(id object) {
        [self getNoteDetailInfo];
    } failed:^(NSError *error) {
        
    }];
}
-(void)followRequest
{
    ChangeFollowRelationService *service = [[ChangeFollowRelationService alloc]init];
    [service startRequestChangeFollow:^{
        service.followId = [NSString stringWithFormat:@"%ld",self.detailModel.data.follow.userId];
    } respons:^(id object) {
        [self getNoteDetailInfo];
    } failed:^(NSError *error) {
        
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
            [self praiseCommodidy];
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
-(void)seeUser:(NSInteger)index
{
    
}
#pragma mark -- TableViewDelegate/TableViewDataSource
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == DetailCellType_NoteInfo)
         return 1;
    else if (section == DetailCellType_CommentAndLike)
        return 1;
    else if (section == DetailCellType_CommentList)
    {
        if(self.detailModel.data.comments.count != 0)
           return self.detailModel.data.comments.count + 1;
        else
            return 0;
    }
    
    return 0;
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
        [cell.concern addTarget:self action:@selector(concernMethord) forControlEvents:UIControlEventTouchUpInside];
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
        cell.delegate = self;
        if (self.detailModel)
             [cell setCommentAndLikeData:self.detailModel.data];
        return cell;
    }
    else if (indexPath.section == DetailCellType_CommentList)
    {
        static NSString *commentIndentifer = @"commentIndentifer";
        CommentListCell *cell = [tableView dequeueReusableCellWithIdentifier:commentIndentifer];
        if (cell == nil)
        {
            cell = [[CommentListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:commentIndentifer];
        }
        if (self.detailModel.data.comments.count != 0)
        {
            if(indexPath.row == 0)
            {
                CommentsModel *model = [self.detailModel.data.comments objectAtIndex:indexPath.row];
                [cell setCellDataWithCommentModel:model row:indexPath.row];
            }
            else
            {
                CommentsModel *model = [self.detailModel.data.comments objectAtIndex:indexPath.row - 1];
                [cell setCellDataWithCommentModel:model row:indexPath.row];
            }
        }
        return cell;
    }
    return nil;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.footerView.addCommentTF resignFirstResponder];
    [self.keyBoradView.textView resignFirstResponder];
    
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
-(void)touchesBegan:(UITouch *)touches withEvent:(UIEvent *)event
{
    [self.footerView.addCommentTF resignFirstResponder];
}
#pragma mark -- Methord
-(void)addComment
{
    if(self.keyBoradView==nil){
        self.keyBoradView=[[YcKeyBoardView alloc]initWithFrame:CGRectMake(0, kScreenHeight-44, kScreenWidth, 44)];
    }
    self.keyBoradView.delegate=self;
    [self.keyBoradView.textView becomeFirstResponder];
    self.keyBoradView.textView.returnKeyType=UIReturnKeySend;
    [self.view addSubview:self.keyBoradView];

    [self.view addSubview:self.keyBoradView];
}
-(void)keyboardShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat deltaY=keyBoardRect.size.height;
    self.keyBoardHeight=deltaY;
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        self.keyBoradView.transform=CGAffineTransformMakeTranslation(0, -deltaY);
    }];
}
-(void)keyboardHide:(NSNotification *)note
{
    [UIView animateWithDuration:[note.userInfo[UIKeyboardAnimationDurationUserInfoKey] floatValue] animations:^{
        
        self.keyBoradView.transform=CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        
        self.keyBoradView.textView.text=@"";
        [self.keyBoradView removeFromSuperview];
    }];
    
}
-(void)keyBoardViewHide:(YcKeyBoardView *)keyBoardView textView:(UITextView *)contentView
{
    [contentView resignFirstResponder];
    if (![contentView.text isEqualToString:@""] && contentView.text != nil)
    {
        self.commentContent = contentView.text;
        [self addCommentRequest];
    }//接口请求
    
}
-(void)concernMethord
{
    [self followRequest];
}
@end
