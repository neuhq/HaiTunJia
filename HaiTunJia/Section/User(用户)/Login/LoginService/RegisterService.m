
#import "RegisterService.h"

@implementation RegisterService
-(void)startRequestRegister:(SetParamsBlock) params
                     repons:(RegisterResult) resultInfo
                     failed:(FailureBlock) failed
{
    RegisterService *service = [self initWithApiUrl:kApi_UserRegist];
    [service requestDataWithParamsBlcok:^{
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        NSDictionary *data = result[@"data"];
        if (dic[@"code"] == 0)
        {
            [[NSUserDefaults standardUserDefaults] setObject:data[@"id"] forKey:kUserIdIndntifer];
            [[NSUserDefaults standardUserDefaults] synchronize];
            resultInfo(dic);
        }
        else
        {
            [self showResponsMessage:dic[@"message"]];
        }
    } failureBlock:^(NSError *error) {
        
    }];
}
@end
