
#import "HomeCollectionHeaderView.h"
#import "UIButton+WebCache.h"
@interface HomeCollectionHeaderView ()
<UIScrollViewDelegate>
@property(nonatomic,strong) UIScrollView *scrollView;

@end

@implementation HomeCollectionHeaderView

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self addSubview:self.scrollView];
        [self initArray];
    }
    return self;
}
//http://p3.so.qhimg.com/t01164281f4865ad883.jpg
//http://p3.so.qhimg.com/t0137923e3d0de1a5e8.jpg
//http://p3.so.qhimg.com/t016271ab93ceaf7838.jpg
//http://p1.so.qhimg.com/t01a430ba22a2f43b0b.jpg

-(void)initArray
{
    self.picArr = [[NSMutableArray alloc]init];
    [self.picArr addObject:@"http://p3.so.qhimg.com/t01164281f4865ad883.jpg"];
    [self.picArr addObject:@"http://p3.so.qhimg.com/t0137923e3d0de1a5e8.jpg"];
    [self.picArr addObject:@"http://p1.so.qhimg.com/t01a430ba22a2f43b0b.jpg"];

}
-(UIScrollView *) scrollView
{
    if(!_scrollView)
    {
        _scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(self.bounds.origin.x, self.bounds.origin.y, self.bounds.size.width, self.bounds.size.height)];
        _scrollView.showsHorizontalScrollIndicator=NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.backgroundColor=[UIColor whiteColor];
        _scrollView.bounces = NO;
        _scrollView.delegate=self;
        _scrollView.pagingEnabled = YES;
        _scrollView.scrollEnabled = YES;
    }
    return _scrollView;
}
-(void)setImage
{
//    [super layoutSubviews];
    for (int i=0; i<self.picArr.count; i++)
    {
        UIButton *hotelImage=[[UIButton alloc]initWithFrame:CGRectMake(self.bounds.size.width*i, 0,self.scrollView.size.width, self.scrollView.frame.size.height - 10)];
        [hotelImage sd_setBackgroundImageWithURL:[NSURL URLWithString:self.picArr[i]] forState: UIControlStateNormal placeholderImage:nil];
        hotelImage.backgroundColor=[UIColor yellowColor];
        hotelImage.userInteractionEnabled=YES;
        [self.scrollView addSubview:hotelImage];
        self.scrollView.contentSize=CGSizeMake(self.bounds.size.width*(i+1), 0);
        
    }

}
@end
