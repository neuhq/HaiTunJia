
#import "CustomTabView.h"
#import "UIColor+Expanded.h"
#define KViewHeight    55
@interface CustomTabView ()
{
    UIView * backView;
    
    NSMutableArray*labelArr;//title
    NSMutableArray * lineRectArr;//lineRect
    UIColor * selectColor;
    UIColor * noSelectColor;
    
    NSMutableArray * rectArr;//n个区域
    
    id<CustomTabViewDelegete>Delegate;
    
    CGFloat indexW;
    
    UILabel *line; //默认线
}

@end


@implementation CustomTabView
@synthesize index,bgView,lineLabel;
//-(id)initWithFrame:(CGRect)frame withDelegate:(id) delegate withArr:(NSArray *) arr
//{
//    if (<#condition#>) {
//        <#statements#>
//    }
//}
- (id)initWithDlegate:(id)delegate withArr:(NSArray*)arr
{
    CGRect rect = CGRectMake(0, 0, kScreenWidth, KViewHeight);
    self = [super initWithFrame:rect];
    if (self)
    {
        index = 0;
        Delegate = delegate;
        self.backgroundColor = [UIColor clearColor];
        
        backView = [[UIView alloc]init];
        self.bgView = backView;
        backView.backgroundColor = [UIColor whiteColor];
        backView.frame = CGRectMake(0, 0, kScreenWidth, KViewHeight - 10.0f);
        [self addSubview:backView];

        indexW = kScreenWidth/arr.count;
        selectColor = [UIColor colorWithHex:@"#359df5"];
        noSelectColor = [UIColor colorWithHex:@"#666666"];
        
        line = [[UILabel alloc]init];
        line.backgroundColor = [UIColor colorWithHex:@"#dddddd"];
        [backView addSubview:line];
        line.frame = CGRectMake(0, KViewHeight - 10.5f, kScreenWidth, 0.5f);
        
        lineLabel = [[UILabel alloc]init];
        lineLabel.backgroundColor = selectColor;
        [backView addSubview:lineLabel];
        
        lineRectArr = [[NSMutableArray alloc]init];
        for(NSInteger i = 0;i<arr.count;++i)
        {
           CGRect rect = CGRectMake(i*indexW, 43.0f, indexW, 2.0f);
            if (i == index)
                lineLabel.frame = rect;
           [lineRectArr addObject:[NSValue value:&rect withObjCType:@encode(struct CGRect)]];
        }
    
        UIFont* font = [UIFont systemFontOfSize:16.0f];

        labelArr = [[NSMutableArray alloc]init];
        self.labelArray = labelArr;
        for(NSInteger i = 0;i<arr.count;++i)
        {
            UILabel * label = [[UILabel alloc]init];
            label.backgroundColor = [UIColor clearColor];
            label.text = [arr objectAtIndex:i];
            label.font = font;
            label.textAlignment = NSTextAlignmentCenter;
            if (i == index)
                label.textColor = selectColor;
            else
                label.textColor = noSelectColor;
            [backView addSubview:label];
            CGSize size = [label.text sizeWithAttributes:@{NSFontAttributeName: label.font}];
            label.frame = CGRectMake(i*indexW, (KViewHeight - 10.0f- size.height)*0.5f, indexW, size.height);
            [labelArr addObject:label];
        }

        rectArr = [[NSMutableArray alloc]init];
        for(NSInteger i = 0;i<arr.count;++i)
        {
            CGRect rect = CGRectMake(i*indexW, 0, indexW, self.frame.size.height);
            [rectArr addObject:[NSValue value:&rect withObjCType:@encode(struct CGRect)]];
        }

    }
    return self;
}

- (void)reload:(NSArray*)arr
{
    for(int i = 0;i<arr.count;++i)
    {
        UILabel * label = [labelArr objectAtIndex:i];
        label.text = [arr objectAtIndex:i];
    }
}
- (void)reload:(NSString*)string withIndex:(NSInteger)StrIndex
{
    for(NSInteger i = 0;i<labelArr.count;++i)
    {
        UILabel * label = [labelArr objectAtIndex:i];
        if (i==StrIndex)
            label.text = string;
    }
}


-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    float time = 0.3f;
    CGPoint location = [[touches anyObject] locationInView:backView];
    for (int i = 0; i<rectArr.count; ++i)
    {
        CGRect rect;
        [[rectArr objectAtIndex:i]getValue:&rect];
         if(CGRectContainsPoint(rect, location))
         {
             if (i == index)
                 return;
             index = i;
             [UIView animateWithDuration:time animations:^{
                 CGRect lineRect;
                 [[lineRectArr objectAtIndex:i]getValue:&lineRect];
                 lineLabel.frame = lineRect;
                 
                 for (int j = 0; j<labelArr.count; ++j)
                 {
                     UILabel * label = [labelArr objectAtIndex:j];
                     if (j == i)
                         label.textColor = selectColor;
                     else
                         label.textColor = noSelectColor;
                         
                 }
             } completion:^(BOOL finished) {
                 if (Delegate && [Delegate respondsToSelector:@selector(tapIndex:)])
                     [Delegate tapIndex:index];
             }];

         }
    }
}
-(void)changeSelfBgViewColor:(UIColor *) color
                 isHidenLine:(BOOL) isHidenLine
                  labelCount:(NSInteger) labelCount
{
    if (labelCount == 1)
    {
        backView.backgroundColor = color;
        self.lineLabel.hidden = isHidenLine;
        line.hidden = YES;
        UILabel *label = [self.labelArray objectAtIndex:0];
        label.textAlignment = NSTextAlignmentLeft;
        self.backgroundColor = color;
        
        CGRect rect = self.frame;
        CGFloat height = 45.0f;
        rect.size.height = height;
        self.frame = rect;
    }
    
}

@end

