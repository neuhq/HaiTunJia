
#import <UIKit/UIKit.h>


@protocol CustomeSearchBarDelegate <NSObject>

/**
 *  搜索关键字
 *
 *  @param keyword 关键字
 */
-(void)getSearchKeyword:(NSString *) keyword;

@end

@interface CustomSearchBar : UIView


@property(nonatomic,weak) id<CustomeSearchBarDelegate> delegate;

@end
