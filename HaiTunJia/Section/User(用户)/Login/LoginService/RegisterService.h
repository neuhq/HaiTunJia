
#import "BaseNetworkService.h"

typedef void(^RegisterResult)(id object);
@interface RegisterService : BaseNetworkService

@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *code;

@property(nonatomic,strong) NSString *password;

@property(nonatomic,strong) NSString *nickName;

-(void)startRequestRegister:(SetParamsBlock) params
                     repons:(RegisterResult) resultInfo
                     failed:(FailureBlock) failed;

@end
