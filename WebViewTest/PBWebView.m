#import "PBWebView.h"

@implementation PBWebView

- (NSString *)encodeJSONString:(id)object {
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:object options:kNilOptions error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

- (void)dispatchFunction:(NSString *)function withData:(NSDictionary *)data {
    NSString *javascript = [NSString stringWithFormat:@"dispatch(\"%@\", %@);", function, [self encodeJSONString:data]];
    [self stringByEvaluatingJavaScriptFromString:javascript];
}

@end
