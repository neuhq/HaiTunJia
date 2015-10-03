
#import "SearchWithTagService.h"

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
        
    } failureBlock:^(NSError *error) {
        
    }];
}
@end
