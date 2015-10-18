
#import "BaseNetworkService.h"

typedef void(^LoginResultBlock) ();
@interface LoginServiceWithVerifyCode : BaseNetworkService


@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *code;

-(void)startLoginWithParams:(SetParamsBlock) params
                             withResult:(LoginResultBlock) results
                            withFailed:(FailureBlock) failed;
@end
