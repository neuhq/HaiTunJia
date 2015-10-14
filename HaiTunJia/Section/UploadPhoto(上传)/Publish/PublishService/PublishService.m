#import "PublishService.h"

@implementation PublishService
-(void)startRequestPublish:(SetParamsBlock) params
                   respons:(PublishBlock) pulishInfo
                    failed:(FailureBlock) failed
{
    PublishService *service = [self initWithApiUrl:kApi_ReleaseGoods];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
