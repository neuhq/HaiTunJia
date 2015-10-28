

#import "BaseNetworkService.h"

@interface WebViewController : BaseViewController
<UIWebViewDelegate>
{
    UIWebView *_webView;
}
@property (nonatomic, strong) NSString *hotelUrlString;

@end
