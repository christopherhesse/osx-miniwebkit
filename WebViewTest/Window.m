#import "Window.h"

@import WebKit;

@implementation Window

//[Log] mousemove:
//MouseEvent
//altKey: false
//bubbles: true
//button: 0
//cancelBubble: false
//cancelable: false
//charCode: 0
//clientX: 62
//clientY: 380
//clipboardData: undefined
//constructor: MouseEventConstructor
//ctrlKey: false
//currentTarget: null
//dataTransfer: null
//defaultPrevented: false
//detail: 0
//eventPhase: 0
//fromElement: null
//keyCode: 0
//layerX: 270
//layerY: 320
//metaKey: false
//offsetX: 270
//offsetY: 320
//pageX: 62
//pageY: 380
//relatedTarget: null
//returnValue: true
//screenX: 562
//screenY: 423
//shiftKey: false
//srcElement: a.full
//target: a.full
//timeStamp: 1398379105695
//toElement: a.full
//type: "mousemove"
//view: Window
//which: 0
//x: 62
//y: 380
//__proto__: MouseEventPrototype


#define MULTI_LINE_STRING(a) @#a

NSString *code = MULTI_LINE_STRING(
    var evt = document.createEvent("MouseEvents");
    evt.initMouseEvent(
                       "mousemove",
                       true, // canBubble
                       false, // cancelable
                       window, // window
                       0, // detail
                       %f, // screenX
                       %f, // screenY
                       %f, // clientX
                       %f, // clientY
                       false, // ctrlKey
                       false, // altKey
                       false, // shiftKey
                       false, // metaKey
                       0, // button
                       null, // relatedTarget
    );
    document.body.dispatchEvent(evt);
);

// document.onmousemove = function(e) {console.log('mousemove:', e);}

//- (void)mouseMoved:(NSEvent *)event {
//    NSLog(@"mouseMovedWindow");
//
////    NSPoint where;
////    where.x = 10;
////    where.y = 10;
////    //    NSView* resp = [someView hitTest:where];
////    NSEventType evtType = NSLeftMouseDown;
////    NSEvent *mouseEvent = [NSEvent mouseEventWithType:evtType
////                                             location:where
////                                        modifierFlags:0
////                                            timestamp:GetCurrentEventTime()
////                                         windowNumber:0
////                                              context:nil
////                                          eventNumber:nil
////                                           clickCount:1
////                                             pressure:nil];
//
////    NSSize size = self.frame.size;
//
//    WebView *webView = ((NSView *)self.contentView).subviews[0];
////    [webView setFrame:NSMakeRect(0, 0, size.width, size.height)];
////    [webView mouseMoved:theEvent];
//    NSPoint point = [event locationInWindow];
//    NSString *code2 = [NSString stringWithFormat:code, point.x, point.y];
//    [webView stringByEvaluatingJavaScriptFromString:code2];
//}

- (BOOL)canBecomeKeyWindow {
    return YES;
}

- (instancetype)initWithContentRect:(NSRect)contentRect styleMask:(NSUInteger)windowStyle backing:(NSBackingStoreType)bufferingType defer:(BOOL)deferCreation {
    self = [super initWithContentRect:contentRect styleMask:windowStyle backing:bufferingType defer:deferCreation];
    NSLog(@"init");
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(windowResized:)
                                                 name:NSWindowDidResizeNotification
                                               object:self];
    return self;
}

- (void)windowResized:(NSNotification*)notification {
    NSLog(@"windowResized");
    NSSize size = self.frame.size;

    //    DebugNSLog(@"window width = %f, window height = %f", size.width, size.height);

    //    bool isFullScreen = (window.styleMask & NSFullScreenWindowMask) == NSFullScreenWindowMask;
    //    bool isBorderless = window.styleMask == NSBorderlessWindowMask;
    //    int titleBarHeight;
    //    if(isFullScreen || isBorderless){
    //        titleBarHeight = 0;
    //    } else {
    //        titleBarHeight = [[Utils sharedInstance] titleBarHeight:window];
    //    }
    WebView *webView = ((NSView *)self.contentView).subviews[0];
    [webView setFrame:NSMakeRect(0, 0, size.width, size.height)];
    [webView stringByEvaluatingJavaScriptFromString:@"console.log('windowResized')"];


    //    [JSEventHelper triggerEvent:@"orientationchange" forWebView:self.webView];
}

@end
