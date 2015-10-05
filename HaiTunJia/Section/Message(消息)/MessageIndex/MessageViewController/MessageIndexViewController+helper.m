
#import "MessageIndexViewController+helper.h"

@implementation MessageIndexViewController (helper)


-(void)getLocalData
{
    NSArray *titleArray = [NSArray arrayWithObjects:@"新的粉丝",@"新的评论",@"新的赞",@"通知", nil];
    NSArray *imageArray = [NSArray arrayWithObjects:[UIImage imageNamed:@"list_man"],[UIImage imageNamed:@"list_message"],[UIImage imageNamed:@"list_love"],[UIImage imageNamed:@"list_gonggao"], nil];
    for (NSInteger i = 0; i < 4; i++)
    {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc]init];
        [dic setObject:titleArray[i] forKey:@"title"];
        [dic setObject:imageArray[i] forKey:@"image"];
        [self.listLocalDataArray addObject:dic];
    }
}
@end
