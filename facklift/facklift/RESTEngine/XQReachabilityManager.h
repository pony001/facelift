//
//  XQReachabilityManager.h
//  Xiaoqin
//
//  Created by 马明晗 on 14-5-23.
//  Copyright (c) 2014年 Fenzi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CWLSynthesizeSingleton.h"

@interface XQReachabilityManager : NSObject

CWL_DECLARE_SINGLETON_FOR_CLASS(XQReachabilityManager);

- (void)observeReachabilityChanged;

@end
