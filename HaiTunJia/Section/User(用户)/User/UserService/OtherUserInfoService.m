
#import "OtherUserInfoService.h"
#import "UserModel.h"
@implementation OtherUserInfoService

-(void)starRequestUserInfo:(SetParamsBlock) params
                   respons:(OtherUserInfoBlock) info
                    failed:(FailureBlock) failed
{
    OtherUserInfoService *infoService = [self initWithApiUrl:kApi_CheckUserInfo];
    [infoService requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        UserModel *userModel = [UserModel objectWithKeyValues:result];
        if ([userModel.state.code integerValue] == 0)
        {
            info(userModel);
        }
        else
        {
            [self showResponsMessage:userModel.state.message];
        }
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
