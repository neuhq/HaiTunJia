

#import "OtherUserNoteListService.h"
#import "WaterFallFlowListDataModel.h"

@implementation OtherUserNoteListService
-(void)startRequestUserNoteListWithParams:(SetParamsBlock) params
                    responsDataWithResult:(OtherUserNoteListBlock) notelList
                         failedWithResult:(FailureBlock) failed;
{
    OtherUserNoteListService *service = [self initWithApiUrl:kApi_GetOtherUserRlist];
    [service requestDataWithParamsBlcok:^{
        params();
    } FinishBlock:^(id result) {
        WaterFallFlowListDataModel *list = [WaterFallFlowListDataModel objectWithKeyValues:result];
        if ([list.state.code integerValue] == 0)
        {
            if(list.data.count != 0 && list.data != nil)
            {
                [list computeCellHeight:list.data];
            }
            notelList(list.data);
        }
        else
        {
            [self showResponsMessage:list.state.message];
        }
        
    } failureBlock:^(NSError *error) {
        failed(error);
    }];

}
@end
