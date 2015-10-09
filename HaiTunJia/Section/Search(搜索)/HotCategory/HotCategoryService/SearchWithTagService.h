#import "BaseNetworkService.h"

typedef void (^WaterFallFowListInfoBlock) (id result);

@interface SearchWithTagService : BaseNetworkService

//用户id
@property(nonatomic,strong) NSString *userId;

//分类标签
@property(nonatomic,strong) NSString *tag;

//上次查询出的最后一条商品ID，用于分页
@property(nonatomic,strong) NSString *lastCommodityId;


/**
 *  根据标签搜索
 *
 *  @param paramsBlock  参数
 *  @param finishBlock  finishBlock description
 *  @param failureBlock failureBlock description
 */
-(void)startRequestDataWithParamsBlcok:(SetParamsBlock)paramsBlock
                                                FinishBlock:(WaterFallFowListInfoBlock)finishBlock
                                                failureBlock:(FailureBlock)failureBlock;

@end
