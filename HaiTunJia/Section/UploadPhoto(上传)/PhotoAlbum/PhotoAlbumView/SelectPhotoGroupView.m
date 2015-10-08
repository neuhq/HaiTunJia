
#import "SelectPhotoGroupView.h"
#import "PhotoGroupViewCell.h"
#define tableCellH 70
@interface SelectPhotoGroupView ()

@property(nonatomic,strong) NSArray *groupArray;

@property(nonatomic,strong) UIView *bgView;

@end

@implementation SelectPhotoGroupView


-(id)initWithFrame:(CGRect)frame withPhotoGroupData:(NSArray *) groupArray
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.groupArray = groupArray;
        
        [self addSubview:self.bgView];
        [self.bgView addSubview:self.photoGroupTable];
    }
    return self;
}
-(UIView *) bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]initWithFrame:self.bounds];
        _bgView.backgroundColor = [UIColor clearColor];
    }
    return _bgView;
}
-(UITableView *) photoGroupTable
{
    if (!_photoGroupTable)
    {
        _photoGroupTable =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth,self.height/2)];
        _photoGroupTable.rowHeight = tableCellH;
        _photoGroupTable.separatorStyle = UITableViewCellSeparatorStyleNone;
        _photoGroupTable.delegate = self;
        _photoGroupTable.dataSource = self;
        _photoGroupTable.separatorStyle=UITableViewCellSeparatorStyleNone;
    }
    return _photoGroupTable;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.groupArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *indentifer = @"indentifer";
    PhotoGroupViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer];
    if (cell == nil)
    {
        cell = [[PhotoGroupViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer];
    }
    if(self.groupArray)
       cell.assetsGroup = self.groupArray[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

    if(self.delegate && [self.delegate respondsToSelector:@selector(selectAtIndex:)])
        [self.delegate selectAtIndex:indexPath.row];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0f;
}
@end
