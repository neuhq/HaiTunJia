
#import <Foundation/Foundation.h>
#import "StateModel.h"

@class StateModel,BannerData;
@interface BannerListModel : NSObject


@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) NSArray *data;

@end

@interface BannerData : NSObject

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *imgurl;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, copy) NSString *linkurl;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, assign) long long gmtModified;

@end

