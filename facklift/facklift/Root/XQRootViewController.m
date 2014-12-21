//
//  XQRootViewController.m
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import "XQRootViewController.h"

@interface XQRootViewController()
{
    BOOL needToShowQQNewFriends;
}
@end
@implementation XQRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _nSelectTabBarIndex = 2;
    
    [self showRootBar];
    
    //[self showMianViewController];
    [self touchRootTabBarItem:_nSelectTabBarIndex];
    [_rootTabBar setSelectTabBarItemByIndex:_nSelectTabBarIndex];
    
    __block XQRootViewController *blockSelf = self;
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchRootTabBarItem:(int)index
{
    //删除以前存在的view
        NSArray *views = [self.view subviews];
        for (UIView *view in views) {
            if (view.tag != 10) {
                [view removeFromSuperview];
            }
        }
    
    _nSelectTabBarIndex = index;
    
    //进入tababr页面的统计
    if (index == RTB_SelectHomeItem) {
        [self showMianViewController];
    } else if (index == RTB_SelectPlasticItem) {
        [self showPlasticViewController];
    } else if (index == RTB_SelectStoryItem) {
        [self showStoryViewController];
    } else if (index == RTB_SelectCircleItem) {
        [self showCircleViewController];
    }else if(index == RTB_SelectLoginInfoItem) {
        [self showLoginInfoViewController];
    }
   
}

- (void)showRootBar
{
    if (_rootTabBar == nil) {
        _rootTabBar = [[XQRootTabBar alloc] init];
        _rootTabBar.delegate = self;
        _rootTabBar.tag = 10;
        [self.view insertSubview:_rootTabBar atIndex:0];
    }
    
    CGRect rect = _rootTabBar.frame;
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)  {
        rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height;
    }else {
        rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height- 20;
    }

    [_rootTabBar setFrame:rect];
}

//登录 信息
- (void)showLoginInfoViewController
{
    if (_loginInfoViewController == nil) {
        _loginInfoViewController = [[LoginInfoViewController alloc] initWithNibName:@"LoginInfoViewController" bundle:nil];
        CGRect rect = self.view.frame;
        rect.origin.y = 0;
        rect.size.height = rect.size.height - 49;
        [_loginInfoViewController.view setFrame:rect];
        
        [self.view insertSubview:_loginInfoViewController.view atIndex:0];
    } else {
        [self.view insertSubview:_loginInfoViewController.view atIndex:0];
    }
}

//圈子
- (void)showCircleViewController
{
    if (_circleViewController == nil) {
        _circleViewController = [[CircleViewController alloc] initWithNibName:@"CircleViewController" bundle:nil];
        CGRect rect = self.view.frame;
        rect.origin.y = 0;
        rect.size.height = rect.size.height - 49;
        [_circleViewController.view setFrame:rect];
        
        [self.view insertSubview:_circleViewController.view atIndex:0];
    } else {
        [self.view insertSubview:_circleViewController.view atIndex:0];
    }
}

//主页面
- (void)showMianViewController
{
    if (_mainViewController == nil) {
        _mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
        CGRect rect = self.view.frame;
        rect.origin.y = 0;
        rect.size.height = rect.size.height - 49;
        [_mainViewController.view setFrame:rect];
        
        [self.view insertSubview:_mainViewController.view atIndex:0];
    } else {
        [self.view insertSubview:_mainViewController.view atIndex:0];
    }
}

//故事
- (void)showStoryViewController
{
    if (_storyViewController == nil) {
        _storyViewController = [[StoryViewController alloc] initWithNibName:@"StoryViewController" bundle:nil];
        CGRect rect = self.view.frame;
        rect.origin.y = 0;
        rect.size.height = rect.size.height - 49;
        [_storyViewController.view setFrame:rect];
        
        [self.view insertSubview:_storyViewController.view atIndex:0];
    } else {
        [self.view insertSubview:_storyViewController.view atIndex:0];
    }
}

//医院
- (void)showPlasticViewController
{
    if (_plasticViewController == nil) {
        _plasticViewController = [[PlasticViewController alloc] initWithNibName:@"PlasticViewController" bundle:nil];
        CGRect rect = self.view.frame;
        rect.origin.y = 0;
        rect.size.height = rect.size.height - 49;
        [_plasticViewController.view setFrame:rect];
        
        [self.view insertSubview:_plasticViewController.view atIndex:0];
    } else {
        [self.view insertSubview:_plasticViewController.view atIndex:0];
    }
}

//打开工作主页面
- (void)openMainListControllerByTime:(double)time
{
    [self touchRootTabBarItem:1];
    //手动设置tabbar选中状态
    if(_rootTabBar) {
        [_rootTabBar setSelectTabBarItemByIndex:1];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
