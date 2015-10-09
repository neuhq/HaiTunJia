
#import "WaterFallFlowListDataModel.h"

@implementation WaterFallFlowListDataModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [ListModel class]};
}


@end





@implementation ListModel

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}

@end




