

#import "AddTagViewController.h"
#import "TagListCell.h"
#import "CustomSearchBar.h"

@interface AddTagViewController ()
<UITableViewDelegate,
UITableViewDataSource,
CustomeSearchBarDelegate>


@property(nonatomic,strong) UITableView *addTagTableView;

@property(nonatomic,strong) NSMutableArray *tagList;

@property(nonatomic,strong) CustomSearchBar *searchBar;

@end

@implementation AddTagViewController
-(id)initWithTagArray:(NSMutableArray *) tagArray
{
    self = [super init];
    if (self)
    {
        self.tagList = tagArray;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    if (!_tagList)
    {
        self.tagList = [[NSMutableArray alloc]init];
    }
    self.leftBarButton.hidden = YES;
    self.rightBarButton.hidden = NO;
    self.rightView = @"完成";
    [self.rightBarButton setTitleColor:[UIColor colorWithHexString:@"03a9f6"] forState:UIControlStateNormal];
    [self.view addSubview:self.searchBar];
    [self.view addSubview:self.addTagTableView];
    // Do any additional setup after loading the view.
}
-(UITableView *) addTagTableView
{
    if (!_addTagTableView)
    {
        _addTagTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight ) style:UITableViewStyleGrouped];
        _addTagTableView.delegate = self;
        _addTagTableView.dataSource = self;
        _addTagTableView.backgroundColor = [UIColor colorWithHexString:@"f4f4f4"];
        _addTagTableView.bounces = YES;
        _addTagTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _addTagTableView;
}
#pragma mark  -- UI
-(CustomSearchBar *) searchBar
{
    if (!_searchBar)
    {
        _searchBar = [[CustomSearchBar alloc]initWithFrame:CGRectMake(25.0f, kNavigationBarHeight - 10 - 30, kScreenWidth - 2*25.0f, 30.0f)];
        _searchBar.delegate = self;
        _searchBar.backgroundColor = [UIColor clearColor];
    }
    return _searchBar;
}
-(void)getSearchKeyword:(NSString *)keyword
{
    if(self.tagList.count == 3)
    {
        
    }
    else
    {
        [self.tagList addObject:keyword];
    }
    [self.addTagTableView reloadData];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifer = @"indentifer";
    TagListCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
    if (cell == nil)
    {
        cell = [[TagListCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer];
    }
    [cell setData:self.tagList];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)rightButtonAction
{
    PassTagValueBlock block = self.passTagValueBlock;
    if (block)
    {
        block(self.tagList);
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
