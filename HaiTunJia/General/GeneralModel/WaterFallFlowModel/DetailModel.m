

#import "DetailModel.h"

@implementation DetailModel

@end
@implementation DetailDataModel

+ (NSDictionary *)objectClassInArray{
    return @{@"praises" : [PraisesModel class], @"comments" : [CommentsModel class]};
}

@end


@implementation CommodityModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end


@implementation FollowModel

@end


@implementation PraisesModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end


@implementation CommentsModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end


