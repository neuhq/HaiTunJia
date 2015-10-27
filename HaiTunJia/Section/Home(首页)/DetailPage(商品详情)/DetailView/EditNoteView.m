
#import "EditNoteView.h"


@interface EditNoteView ()

@property(nonatomic,strong) UIView *editBgView;

@property(nonatomic,strong) UIButton *editButton;

@property(nonatomic,strong) NSArray *titleArray;

@property(nonatomic,strong) UIView *bgView;

@end
@implementation EditNoteView
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.bgView];
        [self addSubview:self.editBgView];
        [self initViews];
    }
    return self;
}
-(NSArray *) titleArray
{
    if (!_titleArray)
    {
        _titleArray = [NSArray arrayWithObjects:@"修改",@"删除", nil];
    }
    return _titleArray;
}
-(UIView *) bgView
{
    if (!_bgView)
    {
        _bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, self.height)];
        _bgView.backgroundColor = [UIColor colorWithHex:@"000000" withAlpha:0.6f];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [_bgView addGestureRecognizer:tap];
    }
    return _bgView;
}
-(UIView *) editBgView
{
    if (!_editBgView)
    {
        _editBgView = [[UIView alloc]initWithFrame:CGRectMake(self.width - 10.0f - 123.0f, 0, 123.0f, 40.0f * 2.0f)];
        _editBgView.backgroundColor = [UIColor whiteColor];
        _editBgView.layer.masksToBounds = YES;
        _editBgView.layer.cornerRadius = 4.0f;
    }
    return _editBgView;
}
-(void)initViews
{
    for (NSInteger i = 0; i < 2; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, i*40.0f, self.editBgView.width, 40.0f);
        [button setTitle:self.titleArray[i] forState:UIControlStateNormal];
        [button setTitle:self.titleArray[i] forState:UIControlStateHighlighted];
        button.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [button setTitleColor:[UIColor colorWithHexString:@"626a73"] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor colorWithHexString:@"626a73"] forState:UIControlStateHighlighted];
        button.tag = i;
        [button addTarget:self action:@selector(buttonMethord:) forControlEvents:UIControlEventTouchUpInside];
        [self.editBgView addSubview:button];
    }
    
    UIView *line = [[UIView alloc]initWithFrame:CGRectMake(0, 40.0f - 0.5f, self.editBgView.width, 0.5f)];
    line.backgroundColor = [UIColor colorWithHexString:@"cacaca"];
    [self.editBgView addSubview:line];
}
-(void)buttonMethord:(UIButton *) sender
{
    if(self.delegate &&[self.delegate respondsToSelector:@selector(selectedButtonIndex:)])
        [self.delegate selectedButtonIndex:sender.tag];
}
-(void)tap
{
    self.hidden = YES;
}
@end
