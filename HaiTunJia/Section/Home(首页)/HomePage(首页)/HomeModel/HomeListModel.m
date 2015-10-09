//
//  HomeListModel.m
//  HaiTunJia
//
//  Created by 李哲 on 15/9/30.
//  Copyright © 2015年 李哲. All rights reserved.
//

#import "HomeListModel.h"

@implementation HomeListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [DataModel class]};
}
-(void)getHeightWithHomeListModel:(HomeListModel *) listModel
{
    UIImage *messageImage = [UIImage imageNamed:@"icon_message"];
    CGFloat width = kScreenWidth/2 - 15;
    for(DataModel *model in listModel.data)
    {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.picture]];
        UIImage *image = [UIImage imageWithData:imageData];
        model.imageHeight = (image.size.height/image.size.width * width);
        CGSize size = [model.name getStringRect:model.name withSize:CGSizeMake(width - 20.0f, 0)];
        model.cellHeight =  50 +  model.imageHeight + size.height + messageImage.size.height + 10.0f + 20.0f;
    }
    
}

@end


@implementation DataModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end
