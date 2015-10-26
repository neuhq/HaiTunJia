
#import "GetBannerListService.h"

@implementation GetBannerListService
-(void)startRequestBannerList:(SetParamsBlock) params
                      respons:(GetBannerListBlock) listBlock
                       failed:(FailureBlock) faild
{
    GetBannerListService *service = [self initWithApiUrl:kApi_GetBannerList];
    [service requestDataWithParamsBlcok:^{
        params();
    } FinishBlock:^(id result) {
        BannerListModel *listModel = [BannerListModel objectWithKeyValues:result];
        if ([listModel.state.code integerValue] == 0)
        {
            listBlock(listModel.data);
        }
        else
        {
            [self showResponsMessage:listModel.state.message];
        }
    } failureBlock:^(NSError *error) {
        faild(error);
    }];
}

@end
