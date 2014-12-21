//
//  RESTRequest.h
//  iHotelApp
//

#import <Foundation/Foundation.h>

@interface RESTRequest : NSObject {
    
}

@property (nonatomic, strong) NSString *error;
//@property (nonatomic, strong) NSString *responseString;
@property (nonatomic, strong) id responseDict;
@property NSInteger errorCode;

@end
