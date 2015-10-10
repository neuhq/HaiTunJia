

#import <Foundation/Foundation.h>
#import "StateModel.h"
@class DataArray,CommentsListModel;

@interface CommentModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) DataArray *data;

@end

@interface DataArray : NSObject

@property (nonatomic, strong) NSArray *comments;

@end

@interface CommentsListModel : NSObject

@property (nonatomic, assign) NSInteger downs;

@property (nonatomic, assign) NSInteger commodityId;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, assign) NSInteger parentId;

@property (nonatomic, copy) NSString *commodityPic;

@property (nonatomic, assign) NSInteger ups;

@property (nonatomic, copy) NSString *content;

@property (nonatomic, assign) long long gmtModified;

@property (nonatomic, assign) NSInteger isBan;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, copy) NSString *isVoteDesc;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, assign) NSInteger userId;

@property (nonatomic, assign) NSInteger depth;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, copy) NSString *isBanDesc;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *name;

@end

