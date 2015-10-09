
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
        NSDictionary *dic = result[@"state"];
        if ([dic[@"code"]integerValue] == 30000)
        {
            self.listModel = [HomeListModel objectWithKeyValues:result];
            [self.listModel getHeightWithHomeListModel:self.listModel];
            NSLog(@"result:%@",result);
        }
        else
        {
            [iToast makeText:dic[@"message"]];
        }
        listInfoBlock(self.listModel);
    } failureBlock:^(NSError *error) {
        failureBlock(error);
        NSLog(@"错误");
    }];

}
@end
