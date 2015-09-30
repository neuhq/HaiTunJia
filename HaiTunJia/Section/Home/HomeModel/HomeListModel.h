
#import <Foundation/Foundation.h>

@class StateModel,DataModel;
@interface HomeListModel : NSObject

@property (nonatomic, strong) StateModel *state;

@property (nonatomic, strong) NSArray<DataModel *> *data;

-(void)getHeightWithHomeListModel:(HomeListModel *) listModel;

@end
@interface StateModel : NSObject

@property (nonatomic, copy) NSString *message;

@property (nonatomic, copy) NSString *code;

@end

@interface DataModel : NSObject

@property (nonatomic, assign) NSInteger iD;

@property (nonatomic, assign) NSInteger likeNum;

@property (nonatomic, assign) NSInteger isPraised;

@property (nonatomic, assign) NSInteger commentNum;

@property (nonatomic, assign) long long gmtCreate;

@property (nonatomic, copy) NSString *moneyType;

@property (nonatomic, copy) NSString *picture;

@property (nonatomic, assign) NSInteger price;

@property (nonatomic, copy) NSString *userName;

@property (nonatomic, copy) NSString *userPic;

@property (nonatomic, copy) NSString *publishTime;

@property (nonatomic, assign) NSInteger isCollected;

@property (nonatomic, assign) NSInteger status;

@property (nonatomic, copy) NSString *name;

@property(nonatomic, assign) CGFloat imageWidth;

@property(nonatomic, assign) CGFloat imageHeight;

@property(nonatomic,assign) CGFloat cellHeight;


@end

