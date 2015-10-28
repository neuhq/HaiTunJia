
/***********************************
 功能：首页滚动图
 说明：//TODO:无数据，暂时是假数据
 **********************************/
#import <UIKit/UIKit.h>
#import "BannerListModel.h"


@protocol HomeCollectionHeaderViewDelegate <NSObject>

-(void)selectedBannerAtIndexWithObject:(BannerData *) bannerModel;

@end
@interface HomeCollectionHeaderView : UICollectionReusableView

@property(nonatomic,strong) NSMutableArray *picArr;

@property(nonatomic,weak) id <HomeCollectionHeaderViewDelegate> delegate;

-(void)setImage:(NSArray *) array;
-(void)setImage;
@end
