#import "PublishViewController.h"
#import "PublishCell.h"

@interface PublishViewController ()
<UITableViewDelegate,
UITableViewDataSource>

@property(nonatomic,strong) UITableView *publishTable;

@end

@implementation PublishViewController

-(id)initWithPublishImge:(UIImage *) image
{
    self = [super init];
    if (self)
    {
        self.publishImage = [UIImage scaleToSize:image size:CGSizeMake(60, 60)];
    }
    return self;
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
        _publishTable.backgroundColor = [UIColor clearColor];
        _publishTable.bounces = YES;
        _publishTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _publishTable;
}
#pragma mark  -- Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section == 1 || section == 2)
        return 1;
    else
        return 2;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
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
            cell.publishImageView.image = self.publishImage;
            return cell;
        }
        else
        {
            static NSString *defaultIndentifer = @"defaultIndentifer";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:defaultIndentifer];
            if (cell == nil)
            {
                cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:defaultIndentifer];
            }
            cell.imageView.image = [UIImage imageNamed:@"icon_smalllabel"];
            cell.textLabel.text = @"标签";
            cell.textLabel.font = [UIFont systemFontOfSize:14.0f];
            cell.textLabel.textColor = [UIColor colorWithHexString:@"626a73"];
            return cell;
        }
    }
    else if (indexPath.section == 1)
    {
        
    }
    else
    {
        
    }
    return nil;
}









@end
