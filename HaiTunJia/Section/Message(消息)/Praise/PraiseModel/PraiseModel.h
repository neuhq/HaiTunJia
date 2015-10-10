
#import <Foundation/Foundation.h>
#import "StateModel.h"

@class PraiseData,PraiseListModel;
@interface PraiseModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) PraiseData *data;

@end


@interface PraiseData : NSObject

@property (nonatomic, strong) NSArray *praises;

@end

@interface PraiseListModel : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, assign) NSInteger commodityId;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, assign) long long gmtModified;

@property (nonatomic, copy) NSString *commodityPic;

@end

