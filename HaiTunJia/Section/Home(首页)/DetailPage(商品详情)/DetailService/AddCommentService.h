#import "BaseNetworkService.h"

typedef void(^AddCommentInfoBlock)(id object);
@interface AddCommentService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *commodityId;

@property(nonatomic,strong) NSString *content;

@property(nonatomic,strong) NSString *parentId;

-(void)startRequestComment:(SetParamsBlock) params
                   respons:(AddCommentInfoBlock) info
                    failed:(FailureBlock) faild;

@end
