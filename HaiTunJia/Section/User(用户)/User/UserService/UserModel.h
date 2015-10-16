

#import <Foundation/Foundation.h>
#import "StateModel.h"
@class UserData;
@interface UserModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) UserData *data;

-(void)getAvatarImageHeight:(UserModel *) userModel;

@end


@interface UserData : NSObject

@property (nonatomic, copy) NSString *userStateDesc;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) long long gmtModified;

@property (nonatomic, assign) NSInteger userState;

@property (nonatomic, assign) NSInteger sex;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, assign) NSInteger userType;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, assign) NSInteger trunComment;

@property (nonatomic, assign) NSInteger trunReply;

@property (nonatomic, assign) NSInteger followerNum;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, assign) NSInteger letterBan;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, assign) NSInteger trunNews;

@property (nonatomic, copy) NSString *nick;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *sexDesc;

@property (nonatomic, copy) NSString *isBanDesc;

@property (nonatomic, copy) NSString *password;

@property (nonatomic, assign) NSInteger followNum;

@property (nonatomic, assign) NSInteger isBan;

@property (nonatomic, assign) NSInteger integral;

@property (nonatomic,assign) CGFloat bigAvtarHeight;

@end

