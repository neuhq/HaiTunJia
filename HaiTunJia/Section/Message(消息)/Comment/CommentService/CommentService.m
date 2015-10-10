
#import "CommentService.h"
#import "CommentModel.h"

@implementation CommentService

-(void)startRequestCommentWithParams:(SetParamsBlock) params
                       responsResult:(CommentInfoBlock) commentInfo
                              failed:(FailureBlock) failed
{
    CommentService *service = [self initWithApiUrl:kApi_GetCommentList];
    [service requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        params();
    } FinishBlock:^(id result) {
        CommentModel *comment = [CommentModel objectWithKeyValues:result];
        if ([comment.state.code integerValue] == 20101)
        {
            if(comment.data.comments != 0)
                  commentInfo(comment.data.comments);
        }
        else
        {
            [self showResponsMessage:comment.state.message];
        }
    } failureBlock:^(NSError *error) {
        failed(error);
    }];
}
@end
