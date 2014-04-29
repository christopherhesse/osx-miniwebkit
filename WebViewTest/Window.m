#import "Window.h"
#import "PBWebView.h"

@import WebKit;

@implementation Window

- (void)mouseMoved:(NSEvent *)event {
    NSLog(@"mouseMovedWindow");
    PBWebView *webView = self.contentView;
    NSPoint location = [event locationInWindow];
    [webView dispatchFunction:@"mouseMoved" withData:@{@"x": @(location.x), @"y": @(location.y)}];
}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

@end
