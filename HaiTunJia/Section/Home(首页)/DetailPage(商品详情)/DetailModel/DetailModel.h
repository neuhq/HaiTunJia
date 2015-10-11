

#import <Foundation/Foundation.h>
#import "StateModel.h"

@class DetailDataModel,CommodityModel,FollowModel,PraisesModel,CommentsModel;

@interface DetailModel : NSObject

@property (nonatomic,strong) StateModel *state;

@property (nonatomic, strong) DetailDataModel *data;

@end
@interface DetailDataModel : NSObject

@property (nonatomic, strong) CommodityModel *commodity;

@property (nonatomic, strong) FollowModel *follow;

@property (nonatomic, strong) NSArray *praises;

@property (nonatomic, strong) NSArray *comments;

@end

@interface CommodityModel : NSObject

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

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, copy) NSString *tag3Location;

@property (nonatomic, copy) NSString *tag3;

@property (nonatomic, assign) NSInteger commentNum;

@property (nonatomic, copy) NSString *moneyType;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *tag1;

@property (nonatomic, assign) NSInteger isCollected;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger userId;

@end

@interface FollowModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, assign) NSInteger followerId;

@end

@interface PraisesModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, assign) NSInteger commodityId;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, assign) long long gmtModified;

@end

@interface CommentsModel : NSObject

@property (nonatomic, assign) NSInteger isBan;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger commodityId;

@property (nonatomic, assign) NSInteger depth;

@property (nonatomic, assign) long long gmtModified;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, copy) NSString *toName;

@property (nonatomic, copy) NSString *isVoteDesc;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger downs;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, assign) NSInteger parentId;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *isBanDesc;

@property (nonatomic, assign) NSInteger ups;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) NSInteger userId;

@end

