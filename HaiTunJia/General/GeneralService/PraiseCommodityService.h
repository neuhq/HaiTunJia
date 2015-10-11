
#import "BaseNetworkService.h"

typedef void(^PraiseBlock)(id obj);
@interface PraiseCommodityService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *commodityId;


-(void)startRquestPraiseCommodity:(SetParamsBlock) params
                    praiseRespons:(PraiseBlock) praise
                           failed:(FailureBlock) failed;

@end
