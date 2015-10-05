#import <UIKit/UIKit.h>

//cell类型
typedef enum TableViewCellType
{
    TableViewCellType_List,
    TableViewCellType_ImageView
}TableViewCellType;

//列表高度
extern const CGFloat kMessageViewCellForListTypeHeight;

extern const CGFloat kMessageViewCellForImageTypeHeight;

extern const CGFloat kMessageViewCellOffset;
@interface MessageViewCell : UITableViewCell

//头图
@property (nonatomic,strong) UIImageView *leftImageView;

//文字
@property (nonatomic,strong) UILabel *text;

//消息数
@property (nonatomic,strong) UIButton *messageNumButton;

@property (nonatomic,strong) NSString *messageNum;

//箭头
@property (nonatomic,strong) UIImageView *rightImgeView;

//第一部分本地数据
@property (nonatomic,strong) NSDictionary *dataDic;

//活动图
@property (nonatomic,strong) UIImageView * activityImageView;

/**
 *  <#Description#>
 *
 *  @param style           <#style description#>
 *  @param reuseIdentifier <#reuseIdentifier description#>
 *  @param cellType        <#cellType description#>
 *
 *  @return <#return value description#>
 */
-(id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
            cellType:(TableViewCellType) cellType;

@end
