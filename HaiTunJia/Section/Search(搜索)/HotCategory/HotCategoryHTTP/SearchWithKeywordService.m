
#import "SearchWithKeywordService.h"

@implementation SearchWithKeywordService

-(void)startRequestDataWithParamsDic:(SetParamsBlock)paramsBlock
                         FinishBlock:(SearchResultInfoBlock)finishBlock
                        failureBlock:(FailureBlock)failureBlock
{
    //TODO:根据关键字搜索
    SearchWithKeywordService *search = [self initWithApiUrl:kApi_Search];
    [search requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        paramsBlock();
    } FinishBlock:^(id result) {
        
    } failureBlock:^(NSError *error) {
        
    }];

}
@end
