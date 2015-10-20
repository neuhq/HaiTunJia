

#import <Foundation/Foundation.h>

@interface PublishModel : NSObject

@property(nonatomic,strong) NSString *tag1;

@property(nonatomic,strong) NSString *tag2;

@property(nonatomic,strong) NSString *tag3;

@property(nonatomic,strong) NSString *moneyType;

@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *price;

@property(nonatomic,strong) NSString *source;

@property(nonatomic,strong) NSString *content;

+ (PublishModel *)sharedManager;

@end
