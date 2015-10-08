
#import "MyFansListModel.h"

@implementation MyFansListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [MyFansDataModel class]};
}
@end
@implementation MyFansDataModel

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end


