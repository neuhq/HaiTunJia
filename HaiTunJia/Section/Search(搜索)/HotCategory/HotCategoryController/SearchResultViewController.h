/**********************************
功能：搜索结果页
备注：
 *********************************/

#import "BaseViewController.h"

@interface SearchResultViewController : BaseViewController

//是否是关键字搜索
@property(nonatomic,assign) BOOL isKeywordSearch;

/**
 *
 *
 *  @param isKeywordSearch 关键字搜索还是tag搜索
 *
 *  @return return value description
 */
-(id)initWithIsKeywordSearch:(BOOL) isKeywordSearch withTag:(NSString *) tag withKeyword:(NSString *) keyword;

@end
