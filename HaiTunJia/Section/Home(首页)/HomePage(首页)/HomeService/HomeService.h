#import "BaseNetworkService.h"

/**用于接收返回的商品数据*/
typedef void(^HomeListDataInfoBlock) (id result);

typedef void (^FailureBlock) (NSError * error);
@interface HomeService : BaseNetworkService

/**用户id*/
@property(nonatomic,strong) NSString *userId;

/**最后一条商品id,用于分页*/
@property(nonatomic,strong) NSString *lastCommodityId;

/**
 *  开始请求首页商品列表数据
 *
 *  @param listInfoBlock 返回的商品数据存block,传回controller做逻辑层
 */
-(void)startRequestHomeListDataWithLastCommodityId:(NSString *) lastCommodityId
                                         withBlock:(HomeListDataInfoBlock) listInfoBlock
                                  withFailureBlock:(FailureBlock) failureBlock;

@end
