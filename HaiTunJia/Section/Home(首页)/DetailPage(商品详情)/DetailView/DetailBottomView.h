

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, DetailBottomViewButtonType) {
    DetailBottomViewButtonType_Pengyou,
    DetailBottomViewButtonType_weixin,
    DetailBottomViewButtonType_like,
    DetailBottomViewButtonType_collect
};


@protocol DetailBottomViewDelegate <NSObject>

/**
 *  @brief  <#Description#>
 *
 *  @param type <#type description#>
 */
-(void)selectBottomButtonAnIndx:(DetailBottomViewButtonType) type;

@end

@class  DetailModel;
@interface DetailBottomView : UIView

@property(nonatomic,strong) UIButton *buyButton;

@property(nonatomic,weak) id<DetailBottomViewDelegate> delegate;

@property(nonatomic,strong) NSMutableArray *buttonArray;

-(void)reloadState:(DetailModel *) detailModel;

-(void)reloadCollectState:(BOOL) isSeleted;

-(void)reloadPraiseState:(BOOL) isSeleted;

@end
