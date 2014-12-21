//
//  RESTEngine.m
//  iHotelApp
//

#import "RESTEngine.h"
#import <sys/socket.h>
#import <netinet/in.h>
#import <arpa/inet.h>
#import <netdb.h>
#import <SystemConfiguration/SCNetworkReachability.h>
#import "JSON.h"
#import "SBJSON.h"
#import "AFNetworking.h"
#import "Util.h"

@implementation RESTEngine

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS(RESTEngine);

- (id) init
{
    self = [super init];
    
    manager_ = [AFHTTPRequestOperationManager manager];
    manager_.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager_.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json",@"text/plain", nil];
    //manager_.requestSerializer = [AFgzipRequestSerializer serializerWithSerializer:[AFJSONRequestSerializer serializer]];
    
    return self;  
}

#pragma mark -
#pragma mark 网络请求

- (void) sendRequest:(NSString*)url
             setBody:(NSMutableDictionary*)body
         finishBlock:(void (^)(RESTRequest* request))completionHandler
           failBlock:(void (^)(RESTRequest* request))faileHandler
            delegate:(id)delegate
              isPost:(Boolean)isPost
{
    static int count = 1;
    DDLogInfo(@"Request count:%d,isPost=%d,url=%@,body=%@",count++,isPost,url,body.description);
    if (isPost) {
        [self sendRequest:url
                 postBody:body
              finishBlock:completionHandler
                failBlock:faileHandler
                 delegate:delegate];
    } else {
        [self sendRequest:url
                  getBody:body
              finishBlock:completionHandler
                failBlock:faileHandler
                 delegate:delegate];
    }
}

//发送一个 get
- (void) sendRequest:(NSString*)url
            getBody:(NSMutableDictionary*)getBody
         finishBlock:(void (^)(RESTRequest* request))completionHandler
           failBlock:(void (^)(RESTRequest* request))failedHandler
            delegate:(id)delegate
{
    url = ( NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, ( CFStringRef)url, nil, CFSTR(""), kCFStringEncodingUTF8));
   
    [manager_ GET:url parameters:getBody success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseString = operation.responseString;
        RESTRequest * restRequest = [self getRESTRequestByString:responseString];
        completionHandler(restRequest);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSString *responseString = operation.responseString;
        RESTRequest * restRequest = [self getRESTRequestByString:responseString];
        
        failedHandler(restRequest);
    }];
}


//发送一个 post
- (void) sendRequest:(NSString*)url
            postBody:(NSMutableDictionary*)postBody
         finishBlock:(void (^)(RESTRequest* request))completionHandler
           failBlock:(void (^)(RESTRequest* request))failedHandler
            delegate:(id)delegate
{
    url = ( NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, ( CFStringRef)url, nil, CFSTR(""), kCFStringEncodingUTF8));
    manager_.requestSerializer = [AFHTTPRequestSerializer serializer];
    [manager_ POST:url parameters:postBody success:^(AFHTTPRequestOperation *operation, id responseObject) {
       // DLog(@"JSON: %@", responseObject);
        NSString *responseString = operation.responseString;
        RESTRequest * restRequest = [self getRESTRequestByString:responseString];
        completionHandler(restRequest);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       // DLog(@"Error: %@", error);
        NSString *responseString = operation.responseString;
        RESTRequest * restRequest = [self getRESTRequestByString:responseString];
        failedHandler(restRequest);
    }];
}

- (NSString *)stringForHeaders:(NSDictionary*)headers {
    NSMutableString *headerString = [NSMutableString string];
    for (NSString *field in [headers allKeys]) {
        [headerString appendString:[NSString stringWithFormat:@"%@: %@%@", field, [headers valueForKey:field], @"\r\n"]];
    }
    [headerString appendString:@"\r\n"];
    
    return [NSString stringWithString:headerString];
}

- (RESTRequest*)getRESTRequestByString:(NSString*)responseString
{
    //TODO (pony) 客户端先过滤
    const char * responseChar = [responseString UTF8String];
    int i = 0;
    for (i =0 ; i<[responseString length]; i++)
    {
        if (responseChar[i] == '{' || responseChar[i] == '['
            || responseChar[i] == -69 || responseChar[i] == -91)
        {
            break;
        }
    }
    id json = [[responseString substringFromIndex:i] JSONValue];
    
    //NSMutableDictionary *json = [responseString JSONValue];
    NSInteger errorCode = 0;
    if (![json isKindOfClass:[NSMutableDictionary class]] && ![json isKindOfClass:[NSArray class]]) {
        errorCode = INT32_MAX;
    } else {
        if ([json isKindOfClass:[NSMutableDictionary class]]) {
            errorCode = [[json objectForKey:@"errorCode"] integerValue];
            if (errorCode == 0) {
                errorCode = [[json objectForKey:@"code"] integerValue];
            }
        }
    }
    NSString *failReason = @"";
    
    RESTRequest * restRequest = [[RESTRequest alloc] init];
    //restRequest.responseString = operation.responseString;
    restRequest.responseDict = json;
    restRequest.error = failReason;
    restRequest.errorCode = errorCode;
    
    return restRequest;
}

//发送一个 post multipart/form-data
- (void) sendFormDataRequest:(NSString*)url
                    postBody:(NSMutableDictionary*)postBody
                  setPicData:(NSData*)weiboPic
                 finishBlock:(void (^)(RESTRequest* request))completionHandler
                   failBlock:(void (^)(RESTRequest* request))failedHandler
{
    url = ( NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, ( CFStringRef)url, nil, CFSTR(""), kCFStringEncodingUTF8));
    
//    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager_ POST:url parameters:postBody constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        //[formData appendPartWithFormData:weiboPic name:@"image"];
        [formData appendPartWithFileData:weiboPic name:@"imgFile" fileName:@"imgFile" mimeType:@"image/jpeg"];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseString = operation.responseString;
        RESTRequest * restRequest = [self getRESTRequestByString:responseString];
        completionHandler(restRequest);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        //DLog(@"Error: %@", error);
        NSString *responseString = operation.responseString;
        RESTRequest * restRequest = [self getRESTRequestByString:responseString];
        failedHandler(restRequest);

    }];

}

@end
