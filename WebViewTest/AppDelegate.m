#import "AppDelegate.h"

@import WebKit;

// hidden webpreferences methods
@interface WebPreferences (WebPreferencesPrivate)
- (void)_setLocalStorageDatabasePath:(NSString *)path;
- (void) setLocalStorageEnabled: (BOOL) localStorageEnabled;
- (void) setDatabasesEnabled:(BOOL)databasesEnabled;
- (void) setDeveloperExtrasEnabled:(BOOL)developerExtrasEnabled;
- (void) setWebGLEnabled:(BOOL)webGLEnabled;
- (void) setOfflineWebApplicationCacheEnabled:(BOOL)offlineWebApplicationCacheEnabled;
@end

@implementation AppDelegate

- (id)init {
    if(self = [super init]) {
        NSRect contentSize = NSMakeRect(500.0, 500.0, 1000.0, 1000.0);
        NSUInteger windowStyleMask = NSTitledWindowMask | NSResizableWindowMask | NSClosableWindowMask | NSMiniaturizableWindowMask;
        self.window = [[NSWindow alloc] initWithContentRect:contentSize styleMask:windowStyleMask backing:NSBackingStoreBuffered defer:YES];
        self.window.backgroundColor = [NSColor whiteColor];
        self.window.title = @"MyBareMetalApp";
    }
    return self;
}

- (void)applicationWillFinishLaunching:(NSNotification *)notification {
    NSView *view = self.window.contentView;
    WebView *webView = [[WebView alloc] initWithFrame:view.bounds];
    [self.window.contentView addSubview:webView];

    WebPreferences *webPrefs = [WebPreferences standardPreferences];
    [webPrefs setDeveloperExtrasEnabled:YES];
    [webView setPreferences:webPrefs];
    self.webView = webView;
}


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [self.window makeKeyAndOrderFront:self];

    [[self.webView mainFrame] loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com"]]];
}

@end
