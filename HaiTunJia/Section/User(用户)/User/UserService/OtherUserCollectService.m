

#import "OtherUserCollectService.h"
#import "WaterFallFlowListDataModel.h"
@implementation OtherUserCollectService
-(void)startRequestOtherUserCollect:(SetParamsBlock) params
                            respons:(OtherUserCollectInfoBlock) info
                             failed:(FailureBlock) failed
{
    OtherUserCollectService *service = [self initWithApiUrl:kApi_GetOtherUserRlist];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
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
        failed(error);
    }];
}
@end
