
#import "BaseNetworkService.h"

typedef void(^DeleteNoteSuccessBlock)(id object);
@interface DeleteNoteService : BaseNetworkService


@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *commodityId;

-(void)startRequestDeleteNoteWithParams:(SetParamsBlock) params
                                respons:(DeleteNoteSuccessBlock) successInfo
                                 failed:(FailureBlock) failed;

@end
