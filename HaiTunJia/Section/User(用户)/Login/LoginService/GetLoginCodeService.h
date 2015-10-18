
#import "BaseNetworkService.h"

typedef void(^LoginCodeInfoBlock)(id object);
@interface GetLoginCodeService : BaseNetworkService

@property(nonatomic,strong) NSString *name;

-(void)startRequestLoginCode:(SetParamsBlock) params
                     respons:(LoginCodeInfoBlock) info
                      failed:(FailureBlock) failed;
@end
