
#import "UserNoteListService.h"
#import "WaterFallFlowListDataModel.h"

@implementation UserNoteListService

-(void)startRequestUserNoteListWithParams:(SetParamsBlock) params
                    responsDataWithResult:(UserNoteListBlock) notelList
                         failedWithResult:(FailureBlock) failed
{
    UserNoteListService *service = [self initWithApiUrl:kApi_GetUserReleaseList];
    [service requestDataWithParamsBlcok:^{
        self.userId =  [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
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
