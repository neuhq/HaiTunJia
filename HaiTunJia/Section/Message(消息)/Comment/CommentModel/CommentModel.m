
#import "CommentModel.h"

@implementation CommentModel


@end


@implementation DataArray

+ (NSDictionary *)objectClassInArray{
    return @{@"comments" : [CommentsListModel class]};
}

@end


@implementation CommentsListModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end


