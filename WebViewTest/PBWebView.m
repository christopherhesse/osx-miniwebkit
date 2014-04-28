#import "PBWebView.h"

@implementation PBWebView

- (void)mouseMoved:(NSEvent *)event {
    NSLog(@"mouseMovedWebView");
    [super mouseMoved:event];
}

//- (NSView*)hitTest:(NSPoint)aPoint {
////    if (NSPointInRect([self convertPoint:aPoint fromView:nil], activeRect)) {
//        //if the mouse is in an active area then just perform the default operation
//    NSView *view = [super hitTest:aPoint];
//    NSLog(@"hitTest: %@", view);
//    return view;
////    return self;
////    }
//    //otherwise return the next responder
////    return (NSView*)[self nextResponder];
//}


@end
