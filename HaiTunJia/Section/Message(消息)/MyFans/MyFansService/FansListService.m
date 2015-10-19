#import "FansListService.h"
#import "MyFansListModel.h"
@implementation FansListService
-(void)startRequestWithResultBlock:(FansInfoResult) fansInfoBlock
                        withFailed:(FailureBlock) failed
{
    FansListService *service = [self initWithApiUrl:kApi_GetFansList];
    [service requestDataWithParamsBlcok:^{
        self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
//        self.userId = kUSERID;
    } FinishBlock:^(id result) {
        if ([result[@"code"] integerValue] == 0)
        {
            MyFansListModel *listModel = [MyFansListModel objectWithKeyValues:result];
            fansInfoBlock(listModel.data);
        }
        else
        {
            iToast *toast = [[iToast alloc]initWithText:result[@"message"]];
            [toast show];
        }
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
