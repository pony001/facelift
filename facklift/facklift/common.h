//
//  common.h
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#ifndef facklift_common_h
#define facklift_common_h

#import "DDLog.h"
#import <Foundation/Foundation.h>
extern int ddLogLevel;

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
#define BGColor UIColorFromRGB(0xd7d7d7)
#define GREYColor UIColorFromRGB(0x676767)
#define BLUEColor UIColorFromRGB(0x3cbec0)
#endif
