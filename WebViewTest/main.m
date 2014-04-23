#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

//https://stackoverflow.com/questions/15694510/programatically-create-initial-window-of-cocoa-app-os-x

int main(int argc, const char * argv[])
{
    NSArray *tl;
    NSApplication * application = [NSApplication sharedApplication];
    [[NSBundle mainBundle] loadNibNamed:@"MainMenu" owner:application topLevelObjects:&tl];

    AppDelegate * applicationDelegate = [[AppDelegate alloc] init];     // Instantiate App  delegate
    [application setDelegate:applicationDelegate];                      // Assign delegate to the NSApplication
    [application run];                                                  // Call the Apps Run method

    return 0;       // App Never gets here.
}

//int main(int argc, const char * argv[])
//{
//    return NSApplicationMain(argc, argv);
//}
