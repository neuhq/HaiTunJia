

#import "UILabel+Additions.h"

@implementation UILabel (Additions)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName: self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                             options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                          attributes:attribute
                                             context:nil].size;
    
    return retSize;
}

-(CGSize)getStringRect:(NSString*)aString withSize:(CGSize) size
{
    NSAttributedString* atrString = [[NSAttributedString alloc] initWithString:aString];
    NSRange range = NSMakeRange(0, atrString.length);
    NSDictionary* dic = [atrString attributesAtIndex:0 effectiveRange:&range];
    size = [aString boundingRectWithSize:size  options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return  size;
}
@end
