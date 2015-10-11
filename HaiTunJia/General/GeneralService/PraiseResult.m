#import "PraiseResult.h"
#import "PraiseCommodityService.h"
#import "WaterFallListCell.h"
#import "WaterFallFlowListDataModel.h"

@implementation PraiseResult
+(void)praiseRequestWithId:(NSInteger) iD
                 withIndex:(NSInteger) index
        withCollectionView:(UICollectionView *) collectionView
              withListArra:(NSMutableArray *) listArray
{
    PraiseCommodityService *service = [[PraiseCommodityService alloc]init];
    [service startRquestPraiseCommodity:^{
        service.commodityId = [NSString stringWithFormat:@"%ld",iD];
    } praiseRespons:^(id obj) {
        NSDictionary *dic = obj;
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:index inSection:0];
        WaterFallListCell *cell = (WaterFallListCell *)[collectionView cellForItemAtIndexPath:indexPath];
        ListModel *dataModel = listArray[index];
        if([dic[@"code"] integerValue] == 0)
        {
            [cell.zanImageButton setBackgroundImage:[UIImage imageNamed:@"icon_love_active"] forState:UIControlStateNormal];
            cell.zanNum.text = [NSString stringWithFormat:@"%ld",dataModel.likeNum +1];
            dataModel.likeNum++;
            dataModel.isPraised = 1;
        }
        else
        {
            [cell.zanImageButton setBackgroundImage:[UIImage imageNamed:@"icon_love_normal"] forState:UIControlStateNormal];
            cell.zanNum.text = [NSString stringWithFormat:@"%ld",dataModel.likeNum - 1];
            dataModel.likeNum--;
            dataModel.isPraised = 0;
        }
        [cell upDateLayout:cell];
        
    } failed:^(NSError *error) {
        
    }];

}
@end
