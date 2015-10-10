/*********************************
 功能：首页列表模型数据
 备注：MJExtention实现
 *********************************/
#import <Foundation/Foundation.h>
#import "StateModel.h"


@class DataModel;
@interface HomeListModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) NSArray*data;

-(void)getHeightWithHomeListModel:(HomeListModel *) listModel;

@end

@interface DataModel : NSObject

//笔记id
@property (nonatomic, assign) NSInteger iD;

//赞数量
@property (nonatomic, assign) NSInteger likeNum;

//当前用户是否对该商品点赞：0：未点赞；1：已点赞
@property (nonatomic, assign) NSInteger isPraised;

//评论数
@property (nonatomic, assign) NSInteger commentNum;

//发布时间
@property (nonatomic, assign) long long gmtCreate;

//货币类型
@property (nonatomic, copy) NSString *moneyType;

//大图
@property (nonatomic, copy) NSString *picture;

//价格
@property (nonatomic, assign) NSInteger price;

//发布人姓名
@property (nonatomic, copy) NSString *userName;

//用户小图
@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, copy) NSString *publishTime;

//当前用户是否对该商品点赞：0：未点赞；1：已点赞
@property (nonatomic, assign) NSInteger isCollected;

//商品状态：0：正常；1：假删除
@property (nonatomic, assign) NSInteger status;

//商品名
@property (nonatomic, copy) NSString *name;

@property(nonatomic, assign) CGFloat imageWidth;

@property(nonatomic, assign) CGFloat imageHeight;

@property(nonatomic,assign) CGFloat cellHeight;

@property(nonatomic,assign) CGSize cellSize;

@end

