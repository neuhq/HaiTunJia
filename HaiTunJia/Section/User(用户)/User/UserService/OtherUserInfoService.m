
#import "OtherUserInfoService.h"
#import "UserModel.h"
@implementation OtherUserInfoService

-(void)starRequestUserInfo:(SetParamsBlock) params
                   respons:(OtherUserInfoBlock) info
                    failed:(FailureBlock) failed
{
    OtherUserInfoService *infoService = [self initWithApiUrl:kApi_CheckUserInfo];
    [infoService requestDataWithParamsBlcok:^{
        self.userId =  [[NSUserDefaults standardUserDefaults] objectForKey:kUserIdIndntifer];
        params();
    } FinishBlock:^(id result) {
        UserModel *userModel = [UserModel objectWithKeyValues:result];
//        [userModel getAvatarImageHeight:userModel];
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
