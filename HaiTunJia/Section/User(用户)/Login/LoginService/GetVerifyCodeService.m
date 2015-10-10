#import "GetVerifyCodeService.h"
@implementation GetVerifyCodeService
-(void)startGetVerifyCodeWithparams:(SetParamsBlock) params
                         withResult:(GetVerifyCodeResult) resultBlock
                         withFailed:(FailureBlock) failed
{
    GetVerifyCodeService *service = [self initWithApiUrl:kApi_GetVerifyCode];
    [service requestDataWithParamsBlcok:^{
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = (NSDictionary *) result;
        resultBlock(dic);
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
