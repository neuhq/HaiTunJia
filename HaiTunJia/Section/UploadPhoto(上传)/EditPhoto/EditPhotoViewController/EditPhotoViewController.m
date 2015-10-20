

#import "EditPhotoViewController.h"
#import "PublishViewController.h"
#import "CommodityTagViewController.h"
@interface EditPhotoViewController ()
<UIGestureRecognizerDelegate>

@property(nonatomic,strong) UIView *bottomView;

@property(nonatomic,strong) UIButton *sureButton;

@property(nonatomic,strong) UIButton *backButton;

@property(nonatomic,strong) UIImageView *photo;


@end

@implementation EditPhotoViewController
-(id)initWithImage:(UIImage *) image
{
    self = [super init];
    if (self)
    {
        self.photoImage = image;
    }
    return self;
}
#pragma mark -- life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.isNavigationBar = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    [self.view addSubview:self.photo];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.sureButton];
    [self.bottomView addSubview:self.backButton];
    // Do any additional setup after loading the view.
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
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UI
-(UIImageView *) photo
{
    if (!_photo)
    {
        
        CGFloat height = self.photoImage.size.height/self.photoImage.size.width;
        if (height>1)
        {
            height = self.photoImage.size.width/self.photoImage.size.height * (kScreenHeight/2);
            _photo = [[UIImageView alloc]initWithFrame:CGRectMake((kScreenWidth - height)/2, 0,height, kScreenHeight/2)];
        }
        else
        {
            height =  self.photoImage.size.height/self.photoImage.size.width*kScreenWidth;
            _photo = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth, height)];
        }
        _photo.image = self.photoImage;
        _photo.userInteractionEnabled = YES;
        _photo.backgroundColor = [UIColor clearColor];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        tap.delegate = self;
        [self.photo addGestureRecognizer:tap];
    }
    return _photo;
}
-(UIView *) bottomView
{
    if (!_bottomView)
    {
        _bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 64,kScreenWidth, 64)];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}
-(UIButton *) sureButton
{
    if (!_sureButton)
    {
        _sureButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureButton.frame = CGRectMake(kScreenWidth - 64, 0, 64, self.bottomView.height);
        _sureButton.backgroundColor = [UIColor colorWithHexString:@"03a9f6"];
        [_sureButton setImage:[UIImage imageNamed:@"icon_ok"] forState:UIControlStateNormal];
        [_sureButton setImage:[UIImage imageNamed:@"icon_ok"] forState:UIControlStateHighlighted];
        [_sureButton addTarget:self action:@selector(sureAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureButton;
}
-(UIButton *) backButton
{
    if (!_backButton)
    {
        _backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _backButton.backgroundColor = [UIColor clearColor];
        [_backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"icon_back"] forState:UIControlStateHighlighted];
        [_backButton sizeToFit];
        _backButton.frame= CGRectMake(10.0f, 20, _backButton.width, _backButton.height);
        [_backButton addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    }
    return _backButton;
}
#pragma mark -- Action
-(void)sureAction:(UIButton *) sender
{
    if ([HTJCommon sharedManager].isAddImage == YES)
    {
//        PublishViewController *publish =[PublishViewController sharedManager];
        NSArray *array = self.navigationController.viewControllers;
        PublishViewController *publish = array[2];
        publish.addImage = self.photoImage;
        [publish addNewImage:self.photoImage];
        [HTJCommon sharedManager].isAddImage = NO;

        [self.navigationController popToViewController:array[2] animated:YES];
//        [self.navigationController popToRootViewControllerAnimated:YES];
//        [self presentViewController:publish animated:YES completion:nil];

    }
    else
    {
        PublishViewController *publish = [[PublishViewController alloc]init];
        publish.publishImage = self.photoImage;
        [self.navigationController pushViewController:publish animated:YES];
//        [self presentViewController:publish animated:YES completion:nil];
    }
    
}
-(void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)tap
{
    CommodityTagViewController *vc = [[CommodityTagViewController alloc]init];
    vc.endBlock = ^(id object){
        
    };
    [self presentViewController:vc animated:YES completion:nil];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint point = [touch locationInView:self.photo];
    return YES;
}

@end
