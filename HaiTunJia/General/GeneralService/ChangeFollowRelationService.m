
#import "ChangeFollowRelationService.h"

@implementation ChangeFollowRelationService
-(void)startRequestChangeFollow:(SetParamsBlock) params
                        respons:(ChangeFollowBlock) info
                         failed:(FailureBlock) failed
{
    ChangeFollowRelationService *service  = [self initWithApiUrl:kApi_ChangeFollow];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic  = result[@"state"];
        info(dic);
        [self showResponsMessage:dic[@"message"]];
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
