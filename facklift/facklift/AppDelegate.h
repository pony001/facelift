//
//  AppDelegate.h
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQRootViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) XQRootViewController *rootViewController;
@property (strong, nonatomic) UINavigationController *baseNavigationController;

@end

