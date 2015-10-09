
/********************************************
 功能：瀑布流公用模型
 备注 ：
 ******************************************/
#import <Foundation/Foundation.h>
#import "StateModel.h"

@class ListModel;

@interface WaterFallFlowListDataModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) NSArray *data;

//计算cell高
-(void)computeCellHeight:(NSArray *) array;

@end

@interface ListModel : NSObject

@property (nonatomic, assign) NSInteger collectNum;

@property (nonatomic, copy) NSString *location;

@property (nonatomic, copy) NSString *tag2Location;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *source;

@property (nonatomic, copy) NSString *tag1Location;

@property (nonatomic, assign) NSInteger isPraised;

@property (nonatomic, assign) long long gmtModified;

@property (nonatomic, copy) NSString *tag2;

@property (nonatomic, copy) NSString *picture;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, assign) NSInteger likeNum;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, copy) NSString *tag3Location;

@property (nonatomic, copy) NSString *tag3;

@property (nonatomic, assign) NSInteger commentNum;

@property (nonatomic, copy) NSString *moneyType;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *tag1;

@property (nonatomic, assign) NSInteger isCollected;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic,assign) CGFloat cellHeight;

@property (nonatomic,assign) CGFloat bigImageHeight;

@property (nonatomic,assign) CGSize cellSize;


@end

