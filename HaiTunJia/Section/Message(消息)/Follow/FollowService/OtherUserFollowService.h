

#import "BaseNetworkService.h"

typedef void(^OtherUserFollowInfoBlock)(id object);
@interface OtherUserFollowService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *selectId;

-(void)startRequestOtherUserFollow:(SetParamsBlock) params
                            repons:(OtherUserFollowInfoBlock) info
                            failed:(FailureBlock) failed;

@end
