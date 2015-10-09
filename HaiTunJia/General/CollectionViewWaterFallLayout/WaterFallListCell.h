
/****************************************
 功能：公用的瀑布流列表
 备注：
 ****************************************/
#import <UIKit/UIKit.h>
#import "WaterFallFlowListDataModel.h"

@interface WaterFallListCell : UICollectionViewCell

/**头像*/
@property(nonatomic,strong) UIImageView *avatarImageView;

/**姓名*/
@property(nonatomic,strong) UILabel *name;

/**地址*/
@property(nonatomic,strong) UILabel *address;

/**大图*/
@property(nonatomic,strong) UIImageView *goodsImageView;

/**文本*/
@property(nonatomic,strong) UILabel *content;

/**评论图片*/
@property(nonatomic,strong) UIButton *commentImageButton;

/**评论数*/
@property(nonatomic,strong) UILabel *commentNum;

/**贊图片*/
@property(nonatomic,strong) UIButton *zanImageButton;

/**贊数量*/
@property(nonatomic,strong) UILabel *zanNum;

/**大背景view*/
@property(nonatomic,strong) UIView *bigBgView;

/**上部背景*/
@property(nonatomic,strong) UIView *topBgView;

/**中间背景*/
@property(nonatomic,strong) UIView *middleBgView;

/**下部背景*/
@property(nonatomic,strong) UIView *bottomBgView;

/**横线*/
@property(nonatomic,strong) UIView *lineView;

//**下部背景的左背景*/
@property(nonatomic,strong) UIButton *bottomLeftView;

//**下部背景的右背景*/
@property(nonatomic,strong) UIButton *bottomRightView;

/**列表数据*/
@property(nonatomic,strong) ListModel *listModel;

@property(nonatomic,assign) CGSize size;


@end
