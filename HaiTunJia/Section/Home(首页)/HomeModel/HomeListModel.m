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
    CGFloat width = kScreenHeight/2 - 15;
    for(DataModel *model in listModel.data)
    {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:model.picture]];
        UIImage *image = [UIImage imageWithData:imageData];
        model.imageHeight = image.size.height;
        model.imageWidth = image.size.width;
        model.cellHeight = 250 + 100 + (model.imageHeight/model.imageWidth * width);
    }
    
}

@end
@implementation StateModel

@end


@implementation DataModel
+ (NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}
@end
