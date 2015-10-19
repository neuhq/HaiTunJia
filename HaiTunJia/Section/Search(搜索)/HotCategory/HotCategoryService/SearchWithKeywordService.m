
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
        if([[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer])
        {
            self.userId = [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        }
        else
        {
            self.userId = @"0";
        }
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

