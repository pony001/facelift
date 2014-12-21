//
//  XQRootTabBar.h
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XQRootIconView.h"
#import "XQBadgeItem.h"

typedef enum{
	RTB_SelectHomeItem = 1,
	RTB_SelectPlasticItem,
    RTB_SelectStoryItem,
    RTB_SelectCircleItem,
    RTB_SelectLoginInfoItem,
}RootTabBar_SelectSomeone;

@protocol XQRootTabBarDelegate;


@interface XQRootTabBar : UIView<XQRootIconViewDelegate> {
    NSMutableArray  *iconViewArray;
    BOOL            isCarte;
    NSInteger       nLeft;
    NSInteger       nRight;
    BOOL            isAnimation;
    
    UIView           *_bgView;
    
    UIImageView      *_topCutLineImageView;
    UIImageView      *_selectImageView;
    
    UIView           *_selectBgView;
    
    int               _nselectTagIndex;
    
    int               _nMoveStepLeft;
    
    int               _nMoveStepRight;
    
    int               _ntabbarOrginX1;
    
    int               _ntabbarOrginX2;
    
    int               _ntabbarOrginX3;
    
    int               _ntabbarOrginX4;
    
    int               _ntabbarOrginX5;
    
    BOOL              _isMoveLeft;
    
    int               _nOffset;
    
    NSMutableArray *_badgeArray;
    NSMutableArray *_buttonArray;
    NSMutableArray *_titleArray;
    
    __unsafe_unretained id<XQRootTabBarDelegate> _delegate;
}

@property (nonatomic,assign) id<XQRootTabBarDelegate> delegate;


- (void)setBadgeForTabarItem:(int)ntabIndex badgeNum:(int)nCount;

//手动设置选中的tabbar nIndex从1，2，3开始
- (void)setSelectTabBarItemByIndex:(int)nIndex;
- (void)setOrangedTabBarItem:(int)nIndex;

@end

@protocol XQRootTabBarDelegate <NSObject>

- (void)touchRootTabBarItem:(NSInteger)index;

@end

