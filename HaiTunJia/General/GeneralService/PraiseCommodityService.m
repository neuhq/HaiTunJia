
#import "PraiseCommodityService.h"

@implementation PraiseCommodityService
-(void)startRquestPraiseCommodity:(SetParamsBlock) params
                    praiseRespons:(PraiseBlock) praise
                           failed:(FailureBlock) failed
{
    PraiseCommodityService *service = [self initWithApiUrl:kApi_TapLike];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        [self showResponsMessage:dic[@"message"]];
        praise(dic);
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}

@end
