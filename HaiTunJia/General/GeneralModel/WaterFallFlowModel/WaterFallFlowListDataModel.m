
#import "WaterFallFlowListDataModel.h"

@implementation WaterFallFlowListDataModel

-(void)computeCellHeight:(NSArray *) array
{
    UIImage *messageImage = [UIImage imageNamed:@"icon_message"];
    CGFloat width =(kScreenWidth - 30)/2;
    for(ListModel *listModel in array)
    {
        NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:listModel.picture]];
        UIImage *image = [UIImage imageWithData:imageData];
        listModel.bigImageHeight = image.size.height/image.size.width * width;
        CGSize size = [listModel.content sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12.0f]}];
        listModel.cellHeight = listModel.bigImageHeight + (size.height * 2+ 20) + (5+ 5 + messageImage.size.height);
        listModel.cellSize = CGSizeMake(width, listModel.cellHeight);
    }
}

+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [ListModel class]};
}


@end





@implementation ListModel

+(NSDictionary *)replacedKeyFromPropertyName
{
    return @{@"iD":@"id"
             
             };
}

@end




