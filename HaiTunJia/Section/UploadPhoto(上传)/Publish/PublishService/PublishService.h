#import "BaseNetworkService.h"

typedef void(^PublishBlock)(id object);
@interface PublishService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *tag1;

@property(nonatomic,strong) NSString *tag2;

@property(nonatomic,strong) NSString *tag3;

@property(nonatomic,strong) NSString *moneyType;

@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *price;

@property(nonatomic,strong) NSString *source;

@property(nonatomic,strong) NSString *content;

//@property(nonatomic,strong) NSString *portrait;

-(void)startRequestPublish:(SetParamsBlock) params
                   respons:(PublishBlock) pulishInfo
                    failed:(FailureBlock) failed;

@end
