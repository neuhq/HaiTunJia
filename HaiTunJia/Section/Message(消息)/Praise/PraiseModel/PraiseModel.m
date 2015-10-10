
#import "PraiseModel.h"

@implementation PraiseModel


@end

@implementation PraiseData

+ (NSDictionary *)objectClassInArray{
    return @{@"praises" : [PraiseListModel class]};
}

@end


@implementation PraiseListModel
+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end


