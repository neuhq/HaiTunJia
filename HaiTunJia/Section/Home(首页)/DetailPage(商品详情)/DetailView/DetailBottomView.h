

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

@interface DetailBottomView : UIView

@property(nonatomic,strong) UIButton *buyButton;

@property(nonatomic,weak) id<DetailBottomViewDelegate> delegate;

@end
