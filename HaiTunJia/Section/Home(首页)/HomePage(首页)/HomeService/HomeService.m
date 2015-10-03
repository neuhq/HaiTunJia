
#import "HomeService.h"
#import "HomeListModel.h"

@interface HomeService ()

@property(nonatomic,strong) HomeListModel *listModel;

@end

@implementation HomeService

-(void)startRequestHomeListDataWithLastCommodityId:(NSString *) lastCommodityId
                                                                          withBlock:(HomeListDataInfoBlock) listInfoBlock
                                                               withFailureBlock:(FailureBlock) failureBlock
{
    HomeService *homeService = [self initWithApiUrl:kApi_GetCommodityList];
    [homeService requestDataWithParamsBlcok:^{
        self.userId = kUSERID;
        self.lastCommodityId = lastCommodityId;
    } FinishBlock:^(id result) {
        self.listModel = [HomeListModel objectWithKeyValues:result];
        [self.listModel getHeightWithHomeListModel:self.listModel];
        NSLog(@"result:%@",result);
        listInfoBlock(self.listModel);
    } failureBlock:^(NSError *error) {
        failureBlock(error);
        NSLog(@"错误");
    }];

}
@end
