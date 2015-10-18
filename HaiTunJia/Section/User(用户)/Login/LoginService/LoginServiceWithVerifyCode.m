
#import "LoginServiceWithVerifyCode.h"

@implementation LoginServiceWithVerifyCode

-(void)startLoginWithParams:(SetParamsBlock) params
                 withResult:(LoginResultBlock) results
                 withFailed:(FailureBlock) failed
{
    LoginServiceWithVerifyCode *login = [self initWithApiUrl:kApi_CodeLogin];
    [login requestDataWithParamsBlcok:^{
        params();
    } FinishBlock:^(id result) {
        NSDictionary *data = result[@"data"];
        NSDictionary *state = result[@"state"];
        if ([state[@"code"] integerValue] == 0)
        {
            [[NSUserDefaults standardUserDefaults] setObject:data[@"id"] forKey:kUserIdIndntifer];
            [[NSUserDefaults standardUserDefaults] synchronize];
            results(data);
        }
        [self showResponsMessage:state[@"message"]];
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
