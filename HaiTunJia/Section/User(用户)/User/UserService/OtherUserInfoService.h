
#import "BaseNetworkService.h"

typedef void(^OtherUserInfoBlock)(id object);
@interface OtherUserInfoService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *commodityId;

-(void)starRequestUserInfo:(SetParamsBlock) params
                   respons:(OtherUserInfoBlock) info
                    failed:(FailureBlock) failed;

@end
