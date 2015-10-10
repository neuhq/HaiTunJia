

#import "BaseNetworkService.h"

typedef void (^UserNoteListBlock) (id object);
@interface UserNoteListService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *lastCommodityId;

-(void)startRequestUserNoteListWithParams:(SetParamsBlock) params
                    responsDataWithResult:(UserNoteListBlock) notelList
                         failedWithResult:(FailureBlock) failed;

@end
