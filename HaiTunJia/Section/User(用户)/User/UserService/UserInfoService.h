

#import "BaseNetworkService.h"


typedef void(^UserInfoBlock)(id object);
@interface UserInfoService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

-(void)startRefrashUserInfo:(SetParamsBlock) params
                    respons:(UserInfoBlock) info
                     failed:(FailureBlock) failed;

@end
