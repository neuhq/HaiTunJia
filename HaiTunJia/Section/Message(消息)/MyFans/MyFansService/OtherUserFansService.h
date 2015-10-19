

#import "BaseNetworkService.h"

typedef void(^OtherUserFansInfo)(id object);
@interface OtherUserFansService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *selectId;

-(void)startRequestOtherUserFans:(SetParamsBlock) params
                         respons:(OtherUserFansInfo) info
                          failed:(FailureBlock) failed;

@end
