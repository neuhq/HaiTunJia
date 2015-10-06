
#import "LoginServiceWithVerifyCode.h"

@implementation LoginServiceWithVerifyCode

-(void)startLoginWithParams:(SetParamsBlock) params
                 withResult:(LoginResultBlock) result
                 withFailed:(FailureBlock) failed
{
    LoginServiceWithVerifyCode *login = [self initWithApiUrl:kApi_UserLogin];
    [login requestDataWithParamsBlcok:^{
        params();
    } FinishBlock:^(id result) {
        
    } failureBlock:^(NSError *error) {
        
    }];
}
@end
