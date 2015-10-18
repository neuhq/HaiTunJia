#import "PersonalDataViewController.h"
#import "PersonViewCell.h"
#import "UserInfoService.h"
#import "UserModel.h"
#import "PersonalDataViewController+helper.h"

@interface PersonalDataViewController ()
<UITableViewDelegate,
UITableViewDataSource,
UIAlertViewDelegate,
UIPickerViewDataSource,
UIPickerViewDelegate>


@property(nonatomic,strong) NSString *nickName;

@property(nonatomic,strong) NSString *address;

@property(nonatomic,strong) NSString *signature;

@property(nonatomic,strong) UIButton *sureButton;

@property(nonatomic,strong) NSArray *sexArray;

@property(nonatomic,strong) UIView *sureView;
@end

@implementation PersonalDataViewController
#pragma mark -- life cycle
-(void)viewDidLoad
{
    [super viewDidLoad];
    [self initArray];
    [self viewConfig];
    [self.view addSubview:self.personTableView];
    [self getUserInfo];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}
-(void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
#pragma mark -- UI
-(UITableView *) personTableView
{
    if (!_personTableView)
    {
        _personTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight) style:UITableViewStyleGrouped];
        _personTableView.delegate = self;
        _personTableView.dataSource = self;
        _personTableView.bounces = YES;
    }
    return _personTableView;
}
-(UIPickerView *) pickerView
{
    if (!_pickerView)
    {
        _pickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, kScreenHeight - 216, kScreenWidth, 216)];
        //    指定Delegate
        _pickerView.delegate=self;
        //    显示选中框
        _pickerView.showsSelectionIndicator=YES;
        _pickerView.backgroundColor = [UIColor whiteColor];
    }
    return _pickerView;
}
-(UIView *) sureView
{
    if (!_sureView)
    {
        _sureView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - self.pickerView.height, kScreenWidth, 30)];
        _sureView.backgroundColor = [UIColor whiteColor];
    }
    return _sureView;
}
-(UIButton *) sureButton
{
    if (!_sureButton)
    {
        CGRect frame = CGRectMake(kScreenWidth - 80, 0, 80, self.sureView.height);
        _sureButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _sureButton.frame=frame;
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitle:@"确定" forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor colorWithHexString:@"13aef6"] forState:UIControlStateNormal];
        [_sureButton setTitleColor:[UIColor colorWithHexString:@"13aef6"] forState:UIControlStateHighlighted];
        [_sureButton addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}
#pragma mark -- helper
-(void)initArray
{
    self.titleArray = [NSArray arrayWithObjects:@"昵称",@"性别",@"常住地",@"个性签名", nil];
    self.sexArray = [NSArray arrayWithObjects:@"男",@"女",@"神秘", nil];
}
-(void)viewConfig
{
    [self setTitle:@"个人资料"];
}
#pragma mark -- HTTP
-(void)getUserInfo
{
    UserInfoService *service = [[UserInfoService alloc]init];
    [service startRefrashUserInfo:^{
        
    } respons:^(id object) {
        self.userModel = object;
        [self.personTableView reloadData];
    } failed:^(NSError *error) {
        
    }];

}

#pragma mark -- UITableViewDelegate/UITableVIewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 5;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        static NSString *indentifer1 = @"indentifer1";
        PersonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer1];
        if (cell == nil)
        {
            cell = [[PersonViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer1 row:indexPath.row];
        }
        [cell reloadAvatar:self.userModel];
        return cell;
    }
    else
    {
        static NSString *indentifer2 = @"indentifer2";
        PersonViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentifer2];
        if (cell == nil)
        {
            cell = [[PersonViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indentifer2 row:indexPath.row];
        }
        [cell reloadTitle:self.titleArray[indexPath.row - 1]];
        [cell reloadSecondCellData:self.userModel row:indexPath.row];
        return cell;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.row == 0)
        return kPersonViewFirstCell;
    else
        return kPersonViewSecondCell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 1)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请输入新的名字" message:@"使用中英文，数字和下划线，昵称一个月内只能允许修改一次" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag = 1;
        [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
        [alertView show];
    }
    else if (indexPath.row == 2)
    {
        [self.view addSubview:self.pickerView];
        [self.view addSubview:self.sureView];
        [self.sureView addSubview:self.sureButton];
    }
    else if (indexPath.row == 3)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"请输入您的常住地" message:@"\n" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag = 3;
        [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
        [alertView show];
    }
    else if (indexPath.row == 4)
    {
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"输入您的新个人介绍" message:@"详细的个人介绍会吸引更多粉丝哦" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        alertView.tag = 4;
        [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
        [alertView show];

    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.0f;
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 1)
    {
        if (buttonIndex == 0)
        {
            
        }
        else
        {
            UITextField *textField = [alertView textFieldAtIndex:0];
            self.nickName = textField.text;
        }
    }
    if (alertView.tag == 3)
    {
        if (buttonIndex == 0)
        {
            
        }
        else
        {
            UITextField *textField = [alertView textFieldAtIndex:0];
            self.address = textField.text;
        }
    }
    if (alertView.tag == 4)
    {
        if (buttonIndex == 0)
        {
            
        }
        else
        {
            UITextField *textField = [alertView textFieldAtIndex:0];
            self.signature = textField.text;
        }
    }

}
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
//返回当前列显示的行数
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.sexArray count];
}

#pragma mark Picker Delegate Methods

//返回当前行的内容,此处是将数组中数值添加到滚动的那个显示栏上
-(NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [self.sexArray objectAtIndex:row];
}
-(void)buttonPressed
{
    [self.pickerView removeFromSuperview];
    [self.sureView removeFromSuperview];
}
@end
