#import <UIKit/UIKit.h>

@protocol EditNoteViewDelegate <NSObject>

-(void)selectedButtonIndex:(NSInteger) index;

@end

typedef NS_ENUM(NSInteger,EditNoteView_ButtonType) {
    EditNoteView_Fix,
    EditNoteView_Delete
};
@interface EditNoteView : UIView

@property(nonatomic,assign) id<EditNoteViewDelegate> delegate;

@end
