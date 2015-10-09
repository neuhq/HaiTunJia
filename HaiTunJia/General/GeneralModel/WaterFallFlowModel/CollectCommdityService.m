
#import "CollectCommdityService.h"

@implementation CollectCommdityService

-(void)startRequestUserCollectWithParams:(SetParamsBlock) params
       withResponsDataWithUserColletInfo:(UserCollectInfoBlock) info
                              withFailed:(FailureBlock) fail;
{
    CollectCommdityService *service = [self initWithApiUrl:kApi_CollectGoods];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        iToast *toast = [[iToast alloc]initWithText:dic[@"message"]];
        [toast show];
        info(dic);

    } failureBlock:^(NSError *error) {
        
    }];
}
@end
