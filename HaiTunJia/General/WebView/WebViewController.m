

#import "WebViewController.h"

@implementation WebViewController

-(void)viewDidLoad
{
    [self setTitle:self.title];
    
    self.view.backgroundColor = [UIColor whiteColor];
    // 4.创建web视图
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, kNavigationBarHeight, kScreenWidth, kScreenHeight - kNavigationBarHeight)];
     NSURLRequest *urlRequest = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:self.hotelUrlString] cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    [_webView loadRequest:urlRequest];
    [self.view addSubview:_webView];
    [super viewDidLoad];
}
@end
