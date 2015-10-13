#import "PublishViewController.h"
#import "PublishCell.h"
#import "TagCell.h"
#import "PhotoAlbumViewController.h"

@interface PublishViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic,strong) UITableView *publishTable;

@property(nonatomic,strong) UIImage *addImage;

@end

@implementation PublishViewController

-(id)initWithPublishImge:(UIImage *) image
{
    self = [super init];
    if (self)
    {
        self.publishImage = [UIImage scaleToSize:image size:CGSizeMake(60, 60)];
        self.addImage = [UIImage imageNamed:@"add"];
    }
    return self;
}
+ (PublishViewController *)sharedManager
{
    static PublishViewController *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}
#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.publishTable];
    
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark -- UI
-(UITableView *) publishTable
{
    if (!_publishTable)
    {
        _publishTable = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight - CONTENT_TABBAR_HEIGHT) style:UITableViewStyleGrouped];
        _publishTable.delegate = self;
        _publishTable.dataSource = self;
        _publishTable.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        _publishTable.bounces = YES;
        _publishTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _publishTable;
}
#pragma mark  -- Delegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    PublishCell *cell = (PublishCell *)[self.publishTable cellForRowAtIndexPath:indexPath];
    [cell.contentTV resignFirstResponder];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 1 || section == 2)
        return 1;
    else
        return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 3.5f;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 0)
        return 0.1f;
    return 3.5f;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if(indexPath.row == 0)
            return kPublishCellHeight;
        else
            return KtagCellHeight;
    }
    else if (indexPath.section == 1)
    {
        UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
        return cell.frame.size.height;
    }
    return 0.0f;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        if (indexPath.row == 0)
        {
            static NSString *indentifer = @"indentifer";
            PublishCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
            if (cell == nil)
            {
                cell = [[PublishCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer withSection:indexPath.section];
            }
            [cell setFirstCellData:self.publishImage];
            return cell;
        }
        else
        {
            static NSString *defaultIndentifer = @"defaultIndentifer";
            TagCell *cell = [tableView dequeueReusableCellWithIdentifier:defaultIndentifer];
            if (cell == nil)
            {
                cell = [[TagCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:defaultIndentifer];
            }
            [cell setData];
            return cell;
        }
    }
    else if (indexPath.section == 1)
    {
        static NSString *indentifer1 = @"indentifer1";
        PublishCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer1];
        if (cell == nil)
        {
            cell = [[PublishCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer1 withSection:indexPath.section];
        }
        [cell.addImageButton addTarget:self action:@selector(addImage:) forControlEvents:UIControlEventTouchUpInside];
        [cell setSecendCellData:self.addImage];
        return cell;

    }
    else
    {
        
    }
    return nil;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)addImage:(UIButton *) sender
{
    [HTJCommon sharedManager].isAddImage = YES;
    PhotoAlbumViewController *album = [[PhotoAlbumViewController alloc]init];
    [self.navigationController pushViewController:album animated:YES];
}






@end
