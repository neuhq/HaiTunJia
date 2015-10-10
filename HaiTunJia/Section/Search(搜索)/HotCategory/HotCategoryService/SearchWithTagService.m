
#import "SearchWithTagService.h"
#import "WaterFallFlowListDataModel.h"

@implementation SearchWithTagService

-(void)startRequestDataWithParamsBlcok:(SetParamsBlock)paramsBlock
                           FinishBlock:(WaterFallFowListInfoBlock)finishBlock
                          failureBlock:(FailureBlock)failureBlock
{
    //TODO:根据标签tag搜索
    SearchWithTagService *search = [self initWithApiUrl:kApi_GetHotTagSeachList];
    [search requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        paramsBlock();
    } FinishBlock:^(id result) {
        WaterFallFlowListDataModel *list = [WaterFallFlowListDataModel objectWithKeyValues:result];
        if ([list.state.code integerValue] == 30000)
        {
            if(list.data.count != 0 && list.data != nil)
            {
                [list computeCellHeight:list.data];
            }
            finishBlock(list.data);
        }
        else
        {
            iToast *toast = [[iToast alloc]initWithText:list.state.message];
            [toast show];
        }

    } failureBlock:^(NSError *error) {
        failureBlock(error);
    }];
}
@end
