#import "BaseNetworkService.h"
#import "BannerListModel.h"
typedef void(^GetBannerListBlock)(id object);
@interface GetBannerListService : BaseNetworkService



-(void)startRequestBannerList:(SetParamsBlock) params
                      respons:(GetBannerListBlock) listBlock
                       failed:(FailureBlock) faild;

@end
