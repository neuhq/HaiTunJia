#import "BannerListModel.h"

@implementation BannerListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [BannerData class]};
}
@end



@implementation BannerData
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}

@end


