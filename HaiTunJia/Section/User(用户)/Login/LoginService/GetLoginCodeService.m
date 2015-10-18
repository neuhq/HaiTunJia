#import "GetLoginCodeService.h"

@implementation GetLoginCodeService
-(void)startRequestLoginCode:(SetParamsBlock) params
                     respons:(LoginCodeInfoBlock) info
                      failed:(FailureBlock) failed
{
    GetLoginCodeService *service = [self initWithApiUrl:kApi_GetLoginCode];
    [service requestDataWithParamsBlcok:^{
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        if ([dic[@"code"] integerValue] == 0)
        {
            
        }
        else if([dic[@"code"] integerValue] != 30011)
        {
            [self showResponsMessage:dic[@"message"]];
        }
        info(dic);
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}

@end
