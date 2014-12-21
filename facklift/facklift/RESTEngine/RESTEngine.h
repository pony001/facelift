//
//  RESTEngine.h
//  iHotelApp
//

#import <Foundation/Foundation.h>
#import "RESTRequest.h"
#import "CWLSynthesizeSingleton.h"
#import "AFNetworking.h"

#define kAccessTokenDefaultsKey @"ACCESS_TOKEN"

@interface RESTEngine : NSObject {
    AFHTTPRequestOperationManager *manager_;
}

CWL_DECLARE_SINGLETON_FOR_CLASS(RESTEngine);

- (id) init;
- (void) sendRequest:(NSString*)url
            postBody:(NSMutableDictionary*)postBody
         finishBlock:(void (^)(RESTRequest* request))completionHandler
           failBlock:(void (^)(RESTRequest* request))faileHandler
            delegate:(id)delegate;

- (void) sendRequestWithGzip:(NSString*)url
                    postBody:(NSMutableDictionary*)postBody
                 finishBlock:(void (^)(RESTRequest* request))completionHandler
                   failBlock:(void (^)(RESTRequest* request))failedHandler
                    delegate:(id)delegate;

- (void) sendRequest:(NSString*)url
             setBody:(NSMutableDictionary*)body
         finishBlock:(void (^)(RESTRequest* request))completionHandler
           failBlock:(void (^)(RESTRequest* request))faileHandler
            delegate:(id)delegate
              isPost:(Boolean)isPost;

- (void) sendFormDataRequest:(NSString*)url
                    postBody:(NSMutableDictionary*)postBody
                  setPicData:(NSData*)weiboPic
                 finishBlock:(void (^)(RESTRequest* request))completionHandler
                   failBlock:(void (^)(RESTRequest* request))faileHandler;

@end
