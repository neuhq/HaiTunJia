
#import <Foundation/Foundation.h>
#import "StateModel.h"

@class FollowData;
@interface FollowInfoModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) NSArray *data;

@end


@interface FollowData : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, assign) NSInteger commodityCount;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, assign) long long gmtModified;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, assign) NSInteger followerId;

@property (nonatomic, assign) NSInteger isRead;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, assign) NSInteger collectCount;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, assign) NSInteger status;

@end

