#import "PBHTTPConnection.h"
#import <CocoaHTTPServer/HTTPMessage.h>
#import <CocoaHTTPServer/HTTPDataResponse.h>

// curl -i http://localhost:12345  -X POST --header "Content-Type: application/json" --data-binary '{"config": {"device_iden": "udm0TddAfL", "api_key": "4f426eb91f786bd10b1d19f900881d5e"}, "payload": {}, "event": "push"}'

@implementation PBHTTPConnection

- (BOOL)supportsMethod:(NSString *)method atPath:(NSString *)path {
	return YES;
}

- (void)processBodyData:(NSData *)postDataChunk {
	[request appendData:postDataChunk];
}

- (NSObject<HTTPResponse> *)httpResponseForMethod:(NSString *)method URI:(NSString *)path {
    NSDictionary *data;
    if ([method isEqual:@"POST"]) {
        NSData *postData = [request body];
        data = [NSJSONSerialization JSONObjectWithData:postData options:kNilOptions error:nil];
    } else if ([method isEqual:@"GET"]) {
        data = [self parseGetParams];
    }

    NSLog(@"method: %@ path: %@ data: %@", method, path, data);
    
    NSData *response = [NSJSONSerialization dataWithJSONObject:data options:kNilOptions error:nil];
    return [[HTTPDataResponse alloc] initWithData:response];
}

@end
