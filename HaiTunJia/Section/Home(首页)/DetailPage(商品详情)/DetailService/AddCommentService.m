
#import "AddCommentService.h"

@implementation AddCommentService
-(void)startRequestComment:(SetParamsBlock) params
                   respons:(AddCommentInfoBlock) info
                    failed:(FailureBlock) faild
{
    AddCommentService *service = [self initWithApiUrl:kApi_AddComment];
    [service requestDataWithParamsBlcok:^{
        self.userId =  [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];;
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        if ([dic[@"code"] integerValue] == 0)
        {
            info(dic);
        }
        [self showResponsMessage:dic[@"message"]];

    } failureBlock:^(NSError *error) {
        faild(error);
    }];
}
@end
