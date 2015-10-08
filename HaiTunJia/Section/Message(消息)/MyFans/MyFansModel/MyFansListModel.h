
#import <Foundation/Foundation.h>

@class MyFansDataModel;

@interface MyFansListModel : NSObject

@property (nonatomic, strong) NSArray *data;

@end


@interface MyFansDataModel : NSObject

//关注关系的数据库ID
@property (nonatomic, assign) NSInteger iD;

//粉丝发布商品数
@property (nonatomic, assign) NSInteger commodityCount;

//创建时
@property (nonatomic, assign) long long gmtCreate;

//最后修改时间
@property (nonatomic, assign) long long gmtModified;

//用户id
@property (nonatomic, assign) NSInteger userId;

//粉丝昵称
@property (nonatomic, copy) NSString *userName;

//粉丝ID
@property (nonatomic, assign) NSInteger followerId;

//是否是新粉丝：0：是新粉丝，1：不是
@property (nonatomic, assign) NSInteger isRead;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, assign) NSInteger collectCount;

@property (nonatomic, copy) NSString *publishTime;

//用户状态
@property (nonatomic, assign) NSInteger status;

@end

