#import "PBHTTPConnection.h"
#import <CocoaHTTPServer/HTTPMessage.h>
#import <CocoaHTTPServer/HTTPDataResponse.h>

@implementation PBHTTPConnection

- (BOOL)supportsMethod:(NSString *)method atPath:(NSString *)path {
	return YES;
}

- (void)processBodyData:(NSData *)postDataChunk {
	[request appendData:postDataChunk];
}

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
    NSData *postData = [request body];
    NSDictionary *data = [NSJSONSerialization JSONObjectWithData:postData options:kNilOptions error:nil];
    NSLog(@"method: %@ path: %@ data: %@", method, path, data);
    NSData *response = [NSJSONSerialization dataWithJSONObject:data options:kNilOptions error:nil];
    return [[HTTPDataResponse alloc] initWithData:response];
}

@end
