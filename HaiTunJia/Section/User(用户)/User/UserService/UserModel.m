
#import "UserModel.h"

@implementation UserModel

-(void)getAvatarImageHeight:(UserModel *) userModel
{
    NSData *data = [[NSData alloc]initWithContentsOfURL:[NSURL URLWithString:userModel.data.pic]];
    UIImage *image = [[UIImage alloc]initWithData:data];
    CGFloat imageHeight = image.size.height/image.size.width*kScreenWidth;
    userModel.data.bigAvtarHeight = imageHeight;
}
@end



@implementation UserData
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}

@end


