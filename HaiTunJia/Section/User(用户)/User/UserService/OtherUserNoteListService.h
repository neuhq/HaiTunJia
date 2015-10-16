
#import "BaseNetworkService.h"

typedef void (^OtherUserNoteListBlock) (id object);
@interface OtherUserNoteListService : BaseNetworkService

@property(nonatomic,strong) NSString *userId;

@property(nonatomic,strong) NSString *lastCommodityId;

@property(nonatomic,strong) NSString *commodityId;

-(void)startRequestUserNoteListWithParams:(SetParamsBlock) params
                    responsDataWithResult:(OtherUserNoteListBlock) notelList
                         failedWithResult:(FailureBlock) failed;
@end
