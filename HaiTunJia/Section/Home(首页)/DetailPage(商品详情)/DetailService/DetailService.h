

#import "BaseNetworkService.h"

typedef void(^DetailInfoBlock) (id object);
@interface DetailService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *commodityId;

-(void)startRequestDetailInfoWithParams:(SetParamsBlock) params
                         withDetailInfo:(DetailInfoBlock) infoBlock
                             withFailed:(FailureBlock) failed;
@end
