
#import "DeleteNoteService.h"

@implementation DeleteNoteService
-(void)startRequestDeleteNoteWithParams:(SetParamsBlock) params
                                respons:(DeleteNoteSuccessBlock) successInfo
                                 failed:(FailureBlock) failed
{
    DeleteNoteService *service = [self initWithApiUrl:kApi_DeleteGoods];
    [service requestDataWithParamsBlcok:^{
        service.userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        [self showResponsMessage:dic[@"message"]];
        if ([dic[@"code"] integerValue] == 0)
        {
            successInfo(dic);
        }
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
