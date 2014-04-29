@import WebKit;

@interface PBWebView : WebView

- (void)dispatchFunction:(NSString *)function withData:(NSDictionary *)data;

@end
