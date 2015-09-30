
#import "HomeService.h"
#import "HomeListModel.h"

@interface HomeService ()

@property(nonatomic,strong) HomeListModel *listModel;

@end

@implementation HomeService

-(void)startRequestHomeListDataWithBlock:(HomeListDataInfoBlock) listInfoBlock
{
    HomeService *homeService = [self initWithApiUrl:kApi_GetCommodityList];
    [homeService requestDataWithParamsBlcok:^{
        self.userId = @"90";
        self.lastCommodityId = @"277";
    } FinishBlock:^(id result) {
       self.listModel = [HomeListModel objectWithKeyValues:result];
        [self.listModel getHeightWithHomeListModel:self.listModel];
        NSLog(@"result:%@",result);
        listInfoBlock(self.listModel);
    } failureBlock:^(NSError *error) {
        NSLog(@"错误");
    }];
}
@end
