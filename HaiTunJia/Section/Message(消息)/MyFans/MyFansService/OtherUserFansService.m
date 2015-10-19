
#import "OtherUserFansService.h"
#import "MyFansListModel.h"

@implementation OtherUserFansService
-(void)startRequestOtherUserFans:(SetParamsBlock) params
                         respons:(OtherUserFansInfo) info
                          failed:(FailureBlock) failed
{
    OtherUserFansService *service = [self initWithApiUrl:kApi_GetOtherUserFansList];
    [service requestDataWithParamsBlcok:^{
        self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        if ([result[@"code"] integerValue] == 0)
        {
            MyFansListModel *listModel = [MyFansListModel objectWithKeyValues:result];
            info(listModel.data);
        }
        else
        {
            iToast *toast = [[iToast alloc]initWithText:result[@"message"]];
            [toast show];
        }

    } failureBlock:^(NSError *error) {
        
    }];
}
@end
