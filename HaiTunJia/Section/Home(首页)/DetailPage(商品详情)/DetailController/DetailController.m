#import "DetailController.h"

@interface DetailController ()
@end

@implementation DetailController


#pragma mark -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"笔记详情";
    [self.view addSubview:self.detailTableView];
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
        _detailTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        _detailTableView.delegate = self;
        _detailTableView.dataSource = self;
    }
    return _detailTableView;
}


@end
