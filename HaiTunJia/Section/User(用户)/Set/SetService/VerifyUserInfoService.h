#import "BaseNetworkService.h"

typedef void(^VerifuUserInfoBlock)(id object);
@interface VerifyUserInfoService : BaseNetworkService

@property(nonatomic,strong) NSString *useId;

@property(nonatomic,strong) NSString *gender;

@property(nonatomic,strong) NSString *nick;

-(void)startRequestVerifyUserInfoWithParams:(SetParamsBlock) params
                                    respons:(VerifuUserInfoBlock) info
                                     failed:(FailureBlock) failed;

@end
