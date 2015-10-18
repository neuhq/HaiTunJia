
#import "CollectCommdityService.h"

@implementation CollectCommdityService

-(void)startRequestUserCollectWithParams:(SetParamsBlock) params
       withResponsDataWithUserColletInfo:(UserCollectInfoBlock) info
                              withFailed:(FailureBlock) fail;
{
    CollectCommdityService *service = [self initWithApiUrl:kApi_CollectGoods];
    [service requestDataWithParamsBlcok:^{
        self.userId =  [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        iToast *toast = [[iToast alloc]initWithText:dic[@"message"]];
        [toast show];
        info(dic[@"code"]);

    } failureBlock:^(NSError *error) {
        fail(error);
    }];
}
@end
