

#import "BaseNetworkService.h"

typedef void(^PraiseInfoBlock)(id object);
@interface PraiseService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

-(void)startRequestPraiseWithParams:(SetParamsBlock) params
                            respons:(PraiseInfoBlock) praiseInfo
                             failed:(FailureBlock) failed;
@end
