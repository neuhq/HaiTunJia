
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

@end
/*
@class ListModel;

@class StateModel,ListModel;
@interface WaterFallFlowListDataModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) NSArray *data;

@end



@interface ListModel : NSObject

@property (nonatomic, assign) NSInteger collectNum;

@property (nonatomic, copy) NSString *location;

//商品状态
@property (nonatomic, assign) NSInteger status;

//当前用户是否对该商品点赞：0：未点赞；1：已点赞
@property (nonatomic, assign) NSInteger isPraised;

//商品图
@property (nonatomic, copy) NSString *picture;

//发布时间
@property (nonatomic, assign) long long gmtCreate;

//点赞数
@property (nonatomic, assign) NSInteger likeNum;

//发布人头像
@property (nonatomic, copy) NSString *userPic;

//商品名
@property (nonatomic, copy) NSString *name;

//商品ID
@property (nonatomic, assign) NSInteger iD;

//评论数
@property (nonatomic, assign) NSInteger commentNum;

//货币类型
@property (nonatomic, copy) NSString *moneyType;

//当前用户是否对该商品点赞：0：未点赞；1：已点赞
@property (nonatomic, assign) NSInteger isCollected;

//发布人姓名
@property (nonatomic, copy) NSString *userName;

//商品价格
@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger userId;

 
@end
*/


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

@end

