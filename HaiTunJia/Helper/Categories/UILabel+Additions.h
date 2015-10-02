
#import <UIKit/UIKit.h>

@interface UILabel (Additions)

- (CGSize)boundingRectWithSize:(CGSize)size;


-(CGSize)getStringRect:(NSString*)aString withSize:(CGSize) size;
@end
