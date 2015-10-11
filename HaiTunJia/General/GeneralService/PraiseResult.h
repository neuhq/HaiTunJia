
#import <Foundation/Foundation.h>

@interface PraiseResult : NSObject


+(void)praiseRequestWithId:(NSInteger) iD
                 withIndex:(NSInteger) index
        withCollectionView:(UICollectionView *) collectionView
              withListArra:(NSMutableArray *) listArray;
@end
