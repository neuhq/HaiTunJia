
#import "SearchWithKeywordService.h"
#import "WaterFallFlowListDataModel.h"

@interface SearchWithKeywordService  ()

@property(nonatomic,strong) WaterFallFlowListDataModel *list;

@end
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
        self.list = [WaterFallFlowListDataModel objectWithKeyValues:result];
//        NSArray *array = [ListModel objectArrayWithKeyValuesArray:result[@"data"]];
        finishBlock( self.list);
    } failureBlock:^(NSError *error) {
        
    }];

}


@end

