
#import "UserCollectService.h"
#import "WaterFallFlowListDataModel.h"

@implementation UserCollectService
-(void)startRequestUserCollectWithParams:(SetParamsBlock) params
       withResponsDataWithUserColletInfo:(UserCollectInfoBlock) info
                              withFailed:(FailureBlock) fail
{
    UserCollectService *service = [self initWithApiUrl:kApi_GetUserCollectList];
    [service requestDataWithParamsBlcok:^{
        self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        WaterFallFlowListDataModel *list = [WaterFallFlowListDataModel objectWithKeyValues:result];
        if ([list.state.code integerValue] == 0)
        {
            if(list.data.count != 0 && list.data != nil)
            {
                [list computeCellHeight:list.data];
            }
            info(list.data);
        }
        else
        {
            iToast *toast = [[iToast alloc]initWithText:list.state.message];
            [toast show];
        }
        
    } failureBlock:^(NSError *error) {
        fail(error);
    }];

}
@end
