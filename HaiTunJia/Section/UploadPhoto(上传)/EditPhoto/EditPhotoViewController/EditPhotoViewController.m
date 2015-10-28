

#import "EditPhotoViewController.h"
#import "PublishViewController.h"
#import "CommodityTagViewController.h"
#import "TagView.h"
#import "PublishModel.h"

@interface EditPhotoViewController ()
<UIGestureRecognizerDelegate>

@property(nonatomic,strong) UIView *bottomView;

@property(nonatomic,strong) UIButton *sureButton;

@property(nonatomic,strong) UIButton *backButton;

@property(nonatomic,strong) UIImageView *photo;

@property(nonatomic,assign)CGPoint point;

@property(nonatomic,strong) TagView *tagView;

@property(nonatomic,strong) NSMutableArray *tagViewArray;

@property(nonatomic,assign) NSInteger tagIndex;

@property(nonatomic,assign) NSInteger tapCount;


@property(nonatomic,assign) NSInteger selectedTag;

@property(nonatomic,strong) UIView *tagBgView;

@property(nonatomic,strong) PublishModel *publishModel;

@property(nonatomic,strong) UILabel *discription;

@property(nonatomic,strong) UILabel *titleLabel;

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
    self.tagViewArray = [[NSMutableArray alloc]init];
    self.tagIndex = 0;
    self.tapCount = 0;
    self.isNavigationBar = YES;
    self.view.backgroundColor = [UIColor colorWithHexString:@"f2f2f2"];
    [self.view addSubview:self.photo];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.titleLabel];
    [self.bottomView addSubview:self.sureButton];
    [self.bottomView addSubview:self.backButton];
    [self.view addSubview:self.discription];
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
        _photo.tag = 100000;
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
-(UILabel *) discription
{
    if (!_discription)
    {
        NSString *string = @"点击图片添加标签";
        UIFont *font = [UIFont systemFontOfSize:14.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _discription = [[UILabel alloc]initWithFrame:CGRectMake(0, kScreenHeight - self.bottomView.height - 50.0f, kScreenWidth, size.height)];
        _discription.text = string;
        _discription.textColor = [UIColor blackColor];
        _discription.textAlignment = NSTextAlignmentCenter;
        _discription.font = font;
        _discription.backgroundColor = [UIColor clearColor];
    }
    return _discription;
}
-(UILabel *) titleLabel
{
    if (!_titleLabel)
    {
        NSString *string = @"标签";
        UIFont *font = [UIFont systemFontOfSize:14.0f];
        CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:font}];
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake((kScreenWidth - size.width)/2, 0, size.width,self.bottomView.height)];
        _titleLabel.text = string;
        _titleLabel.textColor = [UIColor colorWithHex:@"#03a9f6"];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = font;
        _titleLabel.backgroundColor = [UIColor clearColor];
    }
    return _titleLabel;
}

//-(TagView *)tagView
//{
//    if (!_tagView)
//    {
//        
//    }
//    return _tagView;
//}
#pragma mark -- Action
-(void)sureAction:(UIButton *) sender
{
    if ([HTJCommon sharedManager].isAddImage == YES)
    {
//        PublishViewController *publish =[PublishViewController sharedManager];
        if(self.publishModel == nil)
        {
            self.publishModel = [[PublishModel alloc]init];
        }
        self.publishModel.publishImage = self.photoImage;
        NSArray *array = self.navigationController.viewControllers;
        PublishViewController *publish = array[2];
        publish.publishModel = self.publishModel;
        [publish setModel:self.publishModel];
//        publish.addImage = self.photoImage;
        [publish addNewImage:self.photoImage];
        [HTJCommon sharedManager].isAddImage = NO;

        [self.navigationController popToViewController:array[2] animated:YES];
//        [self.navigationController popToRootViewControllerAnimated:YES];
//        [self presentViewController:publish animated:YES completion:nil];

    }
    else
    {
        PublishViewController *publish = [[PublishViewController alloc]init];
        publish.publishModel = self.publishModel;
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
    _tapCount++;
    if (_tapCount == 1 || self.publishModel == nil)
    {
        UIImage *image = [UIImage imageNamed:@"label_leftbg_small"];
        __weak EditPhotoViewController *this = self;
        CommodityTagViewController *vc = [[CommodityTagViewController alloc]init];
        vc.publishModel = self.publishModel;
        vc.endBlock = ^(id object,BOOL isEdit,BOOL isDelete){
            PublishModel *model = object;
            self.publishModel = model;
            if (model)
            {
                self.publishModel.tagLocation = [NSString stringWithFormat:@"%.f,%.f",self.point.x,self.point.y];
                this.tagView = [[TagView alloc]initWithFrame:CGRectZero];
                //            this.tagView.tag = self.tagIndex ++;
                this.tagView.backgroundColor = [UIColor clearColor];
                this.tagView.userInteractionEnabled = YES;
                UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:this action:@selector(tapTagMethord)];
                tap.delegate = this;
                [this.tagView addGestureRecognizer:tap];
                if (this.point.x <= this.photo.size.width/2)
                {
                    [this.tagView reloadViewWithString:model withXPosition:this.point.x withSuperViewWidth:this.photo.size.width withDirection:DotDirection_Left];
                    CGFloat width =  [_tagView reloadTagViewWidth];
                    this.tagView.frame = CGRectMake(this.point.x, this.point.y, width, image.size.height);
                }
                else
                {
                    [this.tagView reloadViewWithString:model withXPosition:this.point.x withSuperViewWidth:this.photo.size.width withDirection:DotDirection_Right];
                    CGFloat width =  [this.tagView reloadTagViewWidth];
                    this.tagView.frame = CGRectMake(this.point.x - width, this.point.y, width, image.size.height);
                    
                }
                [this.photo addSubview:this.tagView];
                //            [this.tagViewArray addObject:this.tagView];
                
            }
            else
            {
                [this.tagBgView removeFromSuperview];
                this.tapCount = 0;
            }
            
        };
        [self presentViewController:vc animated:YES completion:nil];
    }
    else
    {
        iToast *toast = [[iToast alloc]initWithText:@"标签暂时只允许添加一个,您可以点击标签来更改标签内容或删除标签"];
        [toast show];
    }
   
}
-(void)tapTagMethord
{
    __weak EditPhotoViewController *this = self;
    UIImage *image = [UIImage imageNamed:@"label_leftbg_small"];
    CommodityTagViewController *tag = [[CommodityTagViewController alloc]init];
    tag.publishModel = self.publishModel;
    tag.isEdit = YES;
    tag.endBlock = ^(id object,BOOL isEdit,BOOL isDelete){
        PublishModel *model = object;
        this.publishModel = model;
        if (model)
        {
            if (isEdit == YES)
            {
                if (this.point.x <= this.photo.size.width/2)
                {
                    [this.tagView reloadViewWithString:model withXPosition:this.point.x withSuperViewWidth:this.photo.size.width withDirection:DotDirection_Left];
                    CGFloat width =  [_tagView reloadTagViewWidth];
                    this.tagView.frame = CGRectMake(this.point.x, this.point.y, width, image.size.height);
                }
                else
                {
                    [this.tagView reloadViewWithString:model withXPosition:this.point.x withSuperViewWidth:this.photo.size.width withDirection:DotDirection_Right];
                    CGFloat width =  [this.tagView reloadTagViewWidth];
                    this.tagView.frame = CGRectMake(this.point.x - width, this.point.y, width, image.size.height);
                    
                }
                
            }

        }
        else
        {
            [this.tagBgView removeFromSuperview];
            this.tapCount = 0;
        }
        
    };
    [self presentViewController:tag animated:YES completion:nil];
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    UIView *view = gestureRecognizer.view;
    if(view.tag == 100000)
    {
        UIImage *image = [UIImage imageNamed:@"label_leftbg_small"];
        self.point = [touch locationInView:self.photo];
        if (self.photo.size.height - self.point.y < image.size.height)
        {
            CGPoint point = self.point;
            point.y = self.photo.size.height - image.size.height;
            self.point = point;
        }

    }
    else
    {
        self.selectedTag = view.tag;
        self.tagBgView = view;
    }
    return YES;
}

@end
