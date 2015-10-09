
#import "BaseNetworkService.h"

typedef void (^UserCollectInfoBlock) (id object);
@interface UserCollectService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *lastCommodityId;


-(void)startRequestUserCollectWithParams:(SetParamsBlock) params
       withResponsDataWithUserColletInfo:(UserCollectInfoBlock) info
                              withFailed:(FailureBlock) fail;

@end
