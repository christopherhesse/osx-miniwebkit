#import "WebViewDelegate.h"

@import WebKit;

@implementation WebViewDelegate

- (void)webView:(WebView *)sender mouseDidMoveOverElement:(NSDictionary *)elementInformation modifierFlags:(NSUInteger)modifierFlags {
    NSLog(@"webView mouseDidMoveOverElement");
}

- (BOOL)webView:(WebView *)sender shouldPerformAction:(SEL)action fromSender:(id)fromObject {
    NSLog(@"shouldPerformAction");
    return YES;
}

@end
