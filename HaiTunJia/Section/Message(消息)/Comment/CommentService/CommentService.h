
#import "BaseNetworkService.h"

typedef void(^CommentInfoBlock)(id object);
@interface CommentService : BaseNetworkService

@property (nonatomic,strong) NSString *userId;

-(void)startRequestCommentWithParams:(SetParamsBlock) params
                       responsResult:(CommentInfoBlock) commentInfo
                              failed:(FailureBlock) failed;

@end
