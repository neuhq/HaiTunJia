
#import "BaseNetworkService.h"

typedef void(^LoginResultBlock) ();
@interface LoginServiceWithVerifyCode : BaseNetworkService


@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *password;

-(void)startLoginWithParams:(SetParamsBlock) params
                             withResult:(LoginResultBlock) result
                            withFailed:(FailureBlock) failed;
@end
