

#import "BaseNetworkService.h"

@class MyFansDataModel;
typedef void(^FansInfoResult) (id obj);
@interface FansListService : BaseNetworkService


@property(nonatomic,strong) NSString *userId;

-(void)startRequestWithResultBlock:(FansInfoResult) fansInfoBlock
                                         withFailed:(FailureBlock) failed;
@end
