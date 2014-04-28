#import "AppDelegate.h"
#import "Window.h"
#import "PBWebView.h"
#import "WebViewDelegate.h"

@import WebKit;

// NSWindowDelegate
// NSWindow Subclass
// How do events and NSResponder actually work
// WebUIDelegate
// WebScriptObject
// Multiple windows
// acceptsMouseMovedEvents

// hidden webpreferences methods, used to enable special magic options on the webview
@interface WebPreferences (WebPreferencesPrivate)
- (void)_setLocalStorageDatabasePath:(NSString *)path;
- (void) setLocalStorageEnabled: (BOOL) localStorageEnabled;
- (void) setDatabasesEnabled:(BOOL)databasesEnabled;
- (void) setDeveloperExtrasEnabled:(BOOL)developerExtrasEnabled;
- (void) setWebGLEnabled:(BOOL)webGLEnabled;
- (void) setOfflineWebApplicationCacheEnabled:(BOOL)offlineWebApplicationCacheEnabled;
@end

@implementation AppDelegate {
    WebViewDelegate *_webViewDelegate;
}

- (id)init {
    if(self = [super init]) {
        NSRect contentSize = NSMakeRect(500.0, 500.0, 1000.0, 1000.0);
        NSUInteger windowStyleMask = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask;
        self.window = [[Window alloc] initWithContentRect:contentSize styleMask:windowStyleMask backing:NSBackingStoreBuffered defer:YES];
//        [self.window setStyleMask:NSBorderlessWindowMask];
//        [self.window setHasShadow:NO];
//        [self.window setLevel: NSStatusWindowLevel];
        self.window.backgroundColor = [NSColor whiteColor];
        self.window.title = @"MyBareMetalApp";
    }
    return self;
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    NSView *view = self.window.contentView;
    // https://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/DisplayWebContent/DisplayWebContent.html#//apple_ref/doc/uid/10000164-SW1
    WebView *webView = [[PBWebView alloc] initWithFrame:view.bounds];
    self.window.contentView = webView;
//    [self.window.contentView addSubview:webView];

    WebPreferences *webPrefs = [WebPreferences standardPreferences];
    [webPrefs setDeveloperExtrasEnabled:YES];
    [webView setPreferences:webPrefs];
    WebViewDelegate *delegate = [WebViewDelegate new];
    _webViewDelegate = delegate;
    webView.UIDelegate = delegate;
    self.webView = webView;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.window makeKeyAndOrderFront:self];

    [[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://jsfiddle.net/W6J6J/"]]];
//    [[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.wired.com"]]];
}

@end
