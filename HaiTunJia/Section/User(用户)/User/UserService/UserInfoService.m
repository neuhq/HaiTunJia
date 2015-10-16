

#import "UserInfoService.h"
#import "UserModel.h"

@implementation UserInfoService
-(void)startRefrashUserInfo:(SetParamsBlock) params
                    respons:(UserInfoBlock) info
                     failed:(FailureBlock) failed
{
    UserInfoService *service = [self initWithApiUrl:kApi_RefreshUserInfo];
    [service requestDataWithParamsBlcok:^{
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
