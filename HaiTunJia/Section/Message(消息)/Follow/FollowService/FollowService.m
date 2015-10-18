
#import "FollowService.h"
#import "FollowInfoModel.h"
@implementation FollowService

-(void)startRequestFollowWithParams:(SetParamsBlock)params respons:(FollowInfoBlock)followInfo failed:(FailureBlock)failed
{
    FollowService *service = [self initWithApiUrl:kApi_GetFollowList];
    [service requestDataWithParamsBlcok:^{
        self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        FollowInfoModel *model = [FollowInfoModel objectWithKeyValues:result];
        if ([model.state.code integerValue] == 0)
        {
            if(model.data.count != 0)
                followInfo(model.data);
        }
        else
        {
            [self showResponsMessage:model.state.message];
        }
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
