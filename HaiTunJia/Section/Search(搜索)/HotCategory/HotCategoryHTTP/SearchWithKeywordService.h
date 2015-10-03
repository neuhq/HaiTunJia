
#import "BaseNetworkService.h"

typedef void (^SearchResultInfoBlock) (id result);

@interface SearchWithKeywordService : BaseNetworkService

//用户id
@property(nonatomic,strong) NSString *userId;

//搜索词
@property(nonatomic,strong) NSString *search;

//上次查询出的最后一条商品ID，用于分页
@property(nonatomic,strong) NSString *lastCommodityId;


/**
 *  根据标签搜索
 *
 *  @param paramsBlock  参数
 *  @param finishBlock  finishBlock description
 *  @param failureBlock failureBlock description
 */
-(void)startRequestDataWithParamsDic:(SetParamsBlock)paramsBlock
                           FinishBlock:(SearchResultInfoBlock)finishBlock
                          failureBlock:(FailureBlock)failureBlock;
@end
