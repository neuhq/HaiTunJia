
#import "OtherUserFollowService.h"
#import "FollowInfoModel.h"

@implementation OtherUserFollowService

-(void)startRequestOtherUserFollow:(SetParamsBlock) params
                            repons:(OtherUserFollowInfoBlock) info
                            failed:(FailureBlock) failed
{
    OtherUserFollowService *service = [self initWithApiUrl:kApi_GetOtherUserFollowList];
    [service requestDataWithParamsBlcok:^{
        self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        FollowInfoModel *model = [FollowInfoModel objectWithKeyValues:result];
        if ([model.state.code integerValue] == 0)
        {
            if(model.data.count != 0)
                info(model.data);
        }
        else
        {
            [self showResponsMessage:model.state.message];
        }

    } failureBlock:^(NSError *error) {
        
    }];
}
@end
