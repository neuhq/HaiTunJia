

#import "BaseNetworkService.h"

typedef void (^UserCollectInfoBlock) (id object);
@interface CollectCommdityService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *commodityId;


-(void)startRequestUserCollectWithParams:(SetParamsBlock) params
       withResponsDataWithUserColletInfo:(UserCollectInfoBlock) info
                              withFailed:(FailureBlock) fail;

@end
