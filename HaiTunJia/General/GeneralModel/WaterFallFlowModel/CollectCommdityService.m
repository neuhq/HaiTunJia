
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
        if ([dic[@"code"] integerValue] == 0)
        {
            info(dic);
        }
        else
        {
            [iToast makeText:dic[@"message"]];
        }
        
    } failureBlock:^(NSError *error) {
        
    }];
}
@end
