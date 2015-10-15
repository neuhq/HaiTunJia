#import "PublishService.h"

@implementation PublishService
-(void)startRequestPublish:(SetParamsBlock) params
                   respons:(PublishBlock) pulishInfo
                    failed:(FailureBlock) failed
{
    PublishService *service = [self initWithApiUrl:kApi_ReleaseGoods];
   
}

//-(void)startRequest
//{
//    
//}
-(void)startRequestWithImage:(UIImage *) image Publish:(SetParamsBlock) params
                     respons:(PublishBlock) pulishInfo
                      failed:(FailureBlock) failed;
{
    PublishService *service = [self initWithApiUrl:kApi_ReleaseGoods];
    [service upLoadImage:image WithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        NSDictionary *dic = result[@"state"];
        if ([dic[@"code"]integerValue] == 0)
        {
            pulishInfo(result);
        }
        else
        {
            [self showResponsMessage:dic[@"state"]];
        }
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
