
#import "BaseNetworkService.h"

typedef void(^FollowInfoBlock)(id object);
@interface FollowService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

-(void)startRequestFollowWithParams:(SetParamsBlock) params
                            respons:(FollowInfoBlock) followInfo
                             failed:(FailureBlock) failed;

@end
