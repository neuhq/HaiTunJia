

#import "PublishModel.h"

@implementation PublishModel
+ (PublishModel *)sharedManager
{
    static PublishModel *sharedAccountManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedAccountManagerInstance = [[self alloc] init];
    });
    return sharedAccountManagerInstance;
}
@end
