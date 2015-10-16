

#import "BaseNetworkService.h"

typedef void(^OtherUserCollectInfoBlock)(id object);
@interface OtherUserCollectService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *lastCommodityId;

@property(nonatomic,strong) NSString *commodityId;

-(void)startRequestOtherUserCollect:(SetParamsBlock) params
                            respons:(OtherUserCollectInfoBlock) info
                             failed:(FailureBlock) failed;

@end
