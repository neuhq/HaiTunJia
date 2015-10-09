

#import "DetailService.h"
#import "DetailModel.h"
@implementation DetailService

-(void)startRequestDetailInfoWithParams:(SetParamsBlock) params
                         withDetailInfo:(DetailInfoBlock) infoBlock
                             withFailed:(FailureBlock) failed
{
    DetailService *service = [self initWithApiUrl:kApi_GetCommodityDetail];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result;
        DetailModel *model = [DetailModel objectWithKeyValues:dic];
        if ([model.state.code integerValue] == 30001)
        {
            infoBlock(model);
        }
        else
        {
            [iToast makeText:model.state.message];
        }
    } failureBlock:^(NSError *error) {
        
    }];
}
@end
