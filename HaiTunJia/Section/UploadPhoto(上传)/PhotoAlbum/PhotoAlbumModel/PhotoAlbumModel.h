#import <Foundation/Foundation.h>

@interface PhotoAlbumModel : NSObject

//组内的相册图片
@property (nonatomic,strong) UIImage *photo;

//封面图片
@property (nonatomic,strong) UIImage *posterImage;

//组名
@property (nonatomic,strong) NSString *groupName;

//组内图片数量
@property (nonatomic,assign) NSInteger imageTotleCount;

@end
