

#import "BaseNetworkService.h"

typedef void(^ChangeFollowBlock)(id object);
@interface ChangeFollowRelationService : BaseNetworkService


@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *followId;

-(void)startRequestChangeFollow:(SetParamsBlock) params
                        respons:(ChangeFollowBlock) info
                         failed:(FailureBlock) failed;
@end
