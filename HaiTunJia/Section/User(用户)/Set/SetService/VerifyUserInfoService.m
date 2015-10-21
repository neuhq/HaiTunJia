#import "VerifyUserInfoService.h"

@implementation VerifyUserInfoService
-(void)startRequestVerifyUserInfoWithParams:(SetParamsBlock) params
                                    respons:(VerifuUserInfoBlock) info
                                     failed:(FailureBlock) failed
{
    VerifyUserInfoService *service = [self initWithApiUrl:kApi_ChangeUserInfo_NotContainAvatar];
    [service requestDataWithParamsBlcok:^{
        self.useId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        if ([dic[@"code"] integerValue] == 0)
        {
            info(dic);
        }
        [self showResponsMessage:dic[@"message"]];
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
