//
//  XQReachabilityManager.m
//  Xiaoqin
//
//  Created by 马明晗 on 14-5-23.
//  Copyright (c) 2014年 Fenzi. All rights reserved.
//

#import "XQReachabilityManager.h"
#import "AFNetworking.h"

@implementation XQReachabilityManager

CWL_SYNTHESIZE_SINGLETON_FOR_CLASS(XQReachabilityManager);

- (void)observeReachabilityChanged
{
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        DDLogInfo(@"Reachability: %@", AFStringFromNetworkReachabilityStatus(status));
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWWAN:
                
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
                
                break;
            case AFNetworkReachabilityStatusNotReachable:
            default:
                break;
        }
        
    }];
    [manager startMonitoring];
}

@end
