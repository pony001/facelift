//
//  XQRootViewController.h
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQRootTabBar.h"
#import "MainViewController.h"
#import "PlasticViewController.h"
#import "StoryViewController.h"
#import "CircleViewController.h"
#import "LoginInfoViewController.h"

@interface XQRootViewController : UIViewController<XQRootTabBarDelegate>
{
    XQRootTabBar                     *_rootTabBar;
    
    MainViewController               *_mainViewController;
    PlasticViewController            *_plasticViewController;
    StoryViewController              *_storyViewController;
    CircleViewController             *_circleViewController;
    LoginInfoViewController          *_loginInfoViewController;
    
   // BOOL                              _isShowMenuViewFinished;
    
    int                               _nSelectTabBarIndex;
   
}

@end
