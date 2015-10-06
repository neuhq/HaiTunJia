
#import "BaseNetworkService.h"

typedef void(^GetVerifyCodeResult) (NSDictionary *result);
@interface GetVerifyCodeService : BaseNetworkService


//手机号
@property(nonatomic,strong) NSString *name;

-(void)startGetVerifyCodeWithparams:(SetParamsBlock) params
                         withResult:(GetVerifyCodeResult) resultBlock
                         withFailed:(FailureBlock) failed;
@end
