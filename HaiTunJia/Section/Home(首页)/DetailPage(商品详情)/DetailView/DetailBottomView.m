

#import "DetailBottomView.h"
#import "DetailModel.h"

const CGFloat  kDetailBottomViewHeight = 44.0f;

@interface DetailBottomView ()

@property(nonatomic,strong) NSArray *normalImageArray;

@property(nonatomic,strong) NSArray *selectImageArray;


@end

@implementation DetailBottomView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self initArray];
        [self initViews];
    }
    return self;
}

-(void)initArray
{
    self.normalImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"icon_pengyouquan"],[UIImage imageNamed:@"icon_weixin"],[UIImage imageNamed:@"icon_love_normal1"],[UIImage imageNamed:@"icon_focus_normal"], nil];
    self.selectImageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"icon_pengyouquan"],[UIImage imageNamed:@"regiter_weixin"],[UIImage imageNamed:@"icon_love_normal2"],[UIImage imageNamed:@"icon_focus_sel"],nil ];
    self.buttonArray = [[NSMutableArray alloc]init];
}
-(void)initViews
{
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, 0.5f)];
    line.backgroundColor = [UIColor colorWithHexString:@"cccccf"];
    [self addSubview:line];
    
    for (NSInteger i = 0; i < 4; i++)
    {
        UIImage *image = [UIImage imageNamed:@"icon_focus_sel"];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(47*i+23.0f, (self.height - image.size.height)/2, image.size.width, image.size.height);
        button.tag = i;
        [button setBackgroundImage:self.normalImageArray[i] forState:UIControlStateNormal];
        [button setBackgroundImage:self.selectImageArray[i] forState:UIControlStateHighlighted];
        [button setBackgroundImage:self.selectImageArray[i] forState:UIControlStateSelected];
        button.backgroundColor = [UIColor whiteColor];
        [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        [self.buttonArray addObject:button];
    }
    [self addSubview:self.buyButton];
}

-(UIButton *) buyButton
{
    if (!_buyButton)
    {
        UIImage *image = [UIImage imageNamed:@"icon_buy"];
        _buyButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _buyButton.frame = CGRectMake(self.width - 15.0f - 102.0f, (self.height - 32.0f)/2, 102, 32.0f);
        [_buyButton setImageEdgeInsets:UIEdgeInsetsMake(8, -(102/2) + 30.0f,8, 0)];
        [_buyButton setImage:image forState:UIControlStateNormal];
        [_buyButton setImage:image forState:UIControlStateHighlighted];
        _buyButton.titleEdgeInsets = UIEdgeInsetsMake(8, 0, 8, 0);
        [_buyButton setTitle:@"我也要" forState:UIControlStateNormal];
        [_buyButton setTitle:@"我也要" forState:UIControlStateHighlighted];
        _buyButton.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_buyButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"f8568c"] rect:_buyButton.bounds] forState:UIControlStateNormal];
        [_buyButton setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHex:@"#f8568c" withAlpha:0.7f] rect:_buyButton.bounds] forState:UIControlStateHighlighted];
        _buyButton.layer.masksToBounds = YES;
        _buyButton.layer.cornerRadius = 4.0f;
    }
    return _buyButton;
}
-(void)buttonAction:(UIButton *) sender
{
    if(self.delegate && [self.delegate respondsToSelector:@selector(selectBottomButtonAnIndx:)])
        [self.delegate selectBottomButtonAnIndx:sender.tag];
}
-(void)reloadState:(DetailModel *) detailModel
{
    if (detailModel.data.commodity.isPraised == 0)
    {
        UIButton *button = self.buttonArray[2];
        button.selected = NO;
    }
    else
    {
        UIButton *button = self.buttonArray[2];
        button.selected = YES;
    }
    
    if (detailModel.data.commodity.isCollected == 0)
    {
        UIButton *button = self.buttonArray[3];
        button.selected = NO;
    }
    else
    {
        UIButton *button = self.buttonArray[3];
        button.selected = YES;
    }
}
-(void)reloadCollectState:(BOOL) isSeleted
{
    UIButton *button = self.buttonArray[3];
    button.selected = isSeleted;
}

-(void)reloadPraiseState:(BOOL) isSeleted
{
    UIButton *button = self.buttonArray[2];
    button.selected = isSeleted;
}
@end
