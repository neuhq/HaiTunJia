
#import "PraiseService.h"
#import "PraiseModel.h"

@implementation PraiseService
-(void)startRequestPraiseWithParams:(SetParamsBlock) params
                            respons:(PraiseInfoBlock) praiseInfo
                             failed:(FailureBlock) failed
{
    PraiseService *service = [self initWithApiUrl:kApi_GetLikeList];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        PraiseModel *praiseModel = [PraiseModel objectWithKeyValues:result];
        if ([praiseModel.state.code integerValue] == 0)
        {
            if(praiseModel.data.praises.count != 0)
                praiseInfo(praiseModel.data.praises);
        }
        else
        {
            [self showResponsMessage:praiseModel.state.message];
        }
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
