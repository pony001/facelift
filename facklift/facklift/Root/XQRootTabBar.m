//
//  XQRootTabBar.m
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import "XQRootTabBar.h"

@implementation XQRootTabBar

@synthesize delegate = _delegate;

#pragma mark -
#pragma mark -- Life Cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 320, 49+7)];
    if (self) {
        
        _badgeArray = [[NSMutableArray alloc] init];
        _buttonArray = [[NSMutableArray alloc] init];
        iconViewArray = [[NSMutableArray alloc] init];
        //_titleArray = [NSMutableArray arrayWithObjects:@"主页",@"医院",@"故事",@"圈子",@"登录/信息", nil];
        
        self.backgroundColor = [UIColor clearColor];
        
        _topCutLineImageView = [[UIImageView alloc] init];
        [_topCutLineImageView setFrame:CGRectMake(0, 0, 320, 7)];
        _topCutLineImageView.image = [UIImage imageNamed:@"tabbarTopCutLine.png"];
        [self addSubview:_topCutLineImageView];
        
        _bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 7,320, 49)];
        _bgView.backgroundColor = UIColorFromRGB(0xf1f1f1);
        [self addSubview:_bgView];

        _selectBgView = [[UIView alloc] initWithFrame:CGRectMake(18, 46,26, 3)];
        _selectBgView.backgroundColor = UIColorFromRGB(0xff7e00);
        [_bgView addSubview:_selectBgView];
        
        _nMoveStepLeft = 4;
        
        _nMoveStepRight = 7;
        
        _ntabbarOrginX1 = 17;
        
        _ntabbarOrginX2 = 17+64;
        
        _ntabbarOrginX3 = 17+64*2;
        
        _ntabbarOrginX4 = 17+64*3;
        
        _ntabbarOrginX5 = 17+64*4;
        
        
        NSArray *imageArray = [NSArray arrayWithObjects:
                               [UIImage imageNamed:@"tabbaritem1.png"],
                               [UIImage imageNamed:@"tabbaritem2.png"],
                               [UIImage imageNamed:@"tabbaritem2.png"],
                               [UIImage imageNamed:@"tabbaritem4.png"],
                               [UIImage imageNamed:@"tabbaritem5.png"],
                               nil];
        NSArray *titleArray = [NSArray arrayWithObjects:@"主页",@"医院",@"故事",@"圈子",@"登录/信息", nil];
        
        
        float buttonWidth = 320/5;
        
        int i = 1;
        for (UIImage *image in imageArray) {
            XQRootIconView *tempIconView = [[XQRootIconView alloc] init];
            tempIconView.delegate = self;
            tempIconView.tag = i;
            [tempIconView setImageIcon:[imageArray objectAtIndex:(i - 1)]];
            [tempIconView setTitle:[titleArray objectAtIndex:(i - 1)]];
            [iconViewArray addObject:tempIconView];
            
            tempIconView.frame = CGRectMake(buttonWidth * (i - 1), 1, buttonWidth, 46);
            
            [_bgView addSubview:tempIconView];
            
            XQBadgeItem *badgeItem = [[XQBadgeItem alloc] initWithFrame:CGRectMake(i*buttonWidth-15, 9, 5, 5)];
            badgeItem.tag = i;
            [badgeItem setBadgeAlert:0];
            [_bgView addSubview:badgeItem];
            [_badgeArray addObject:badgeItem];
            
            i ++;
        }
  
        if(iconViewArray && [iconViewArray count]>0) {
           [[iconViewArray objectAtIndex:0] setImageIcon:[UIImage imageNamed:@"tabbaritemselect1.png"]];
        }
        
    }
    
    return self;
}


#pragma mark -
#pragma mark -- Custom
//ntabIndex 索引个数
- (void)setBadgeForTabarItem:(int)ntabIndex badgeNum:(int)nCount
{
    if(_badgeArray && [_badgeArray count]>0) {
        XQBadgeItem *homeBadgeItem = [_badgeArray objectAtIndex:ntabIndex];
        [homeBadgeItem setBadgeAlert:nCount];
    }
}

#pragma mark -
#pragma mark -- Touche Mothed
- (IBAction)ToucheButton:(id)sender
{
}

- (void)updateRootView:(int)nIndex
{
    UIColor *grayColor = GREYColor;
    UIColor *blueColor = BLUEColor;
    for (int i = 0; i < 5; i++) {
        [[iconViewArray objectAtIndex:i] setTitleColor:grayColor];
    }
    [[iconViewArray objectAtIndex:(nIndex - 1)] setTitleColor:blueColor];
    
    
    [[iconViewArray objectAtIndex:0] selectImageIcon:[UIImage imageNamed:@"tabbaritem1.png"]];
    [[iconViewArray objectAtIndex:1] selectImageIcon:[UIImage imageNamed:@"tabbaritem2.png"]];
    [[iconViewArray objectAtIndex:2] selectImageIcon:[UIImage imageNamed:@"tabbaritem2.png"]];
    [[iconViewArray objectAtIndex:3] selectImageIcon:[UIImage imageNamed:@"tabbaritem4.png"]];
    [[iconViewArray objectAtIndex:4] selectImageIcon:[UIImage imageNamed:@"tabbaritem5.png"]];
    
    
    if (nIndex == 1) {
        [[iconViewArray objectAtIndex:0] selectImageIcon:[UIImage imageNamed:@"tabbaritemselect1.png"]];
    } else if (nIndex == 2) {
        [[iconViewArray objectAtIndex:1] selectImageIcon:[UIImage imageNamed:@"tabbaritemselect2.png"]];
    } else if (nIndex == 3) {
        [[iconViewArray objectAtIndex:2] selectImageIcon:[UIImage imageNamed:@"tabbaritemselect2.png"]];
    } else if (nIndex == 4) {
        [[iconViewArray objectAtIndex:3] selectImageIcon:[UIImage imageNamed:@"tabbaritemselect4.png"]];
    } else if (nIndex == 5) {
        [[iconViewArray objectAtIndex:4] selectImageIcon:[UIImage imageNamed:@"tabbaritemselect5.png"]];
    }

}

//手动设置选中的tabbar nIndex从1，2，3开始
- (void)setSelectTabBarItemByIndex:(int)nIndex
{
    [self updateRootView:nIndex];
    
    _nselectTagIndex = nIndex-1;
    
    [_selectBgView setFrame:CGRectMake(64*_nselectTagIndex+17, 46,30, 3)];
    
}

- (void)clickRootIconView:(XQRootIconView*)rootIconView
{
    [self updateRootView:rootIconView.tag];
    
    _nselectTagIndex = rootIconView.tag;
    
    
    if (rootIconView.tag == 1) {

        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                              [_selectBgView setFrame:CGRectMake(_ntabbarOrginX1, 46,30, 3)];
                         } completion:^(BOOL finished) {
                             [self moveAnimationDidEnded];
                         }];
        
    } else if (rootIconView.tag == 2) {
        
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             [_selectBgView setFrame:CGRectMake(_ntabbarOrginX2, 46,30, 3)];
                         } completion:^(BOOL finished) {
                             [self moveAnimationDidEnded];
                         }];
        
    } else if (rootIconView.tag == 3) {
        
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             [_selectBgView setFrame:CGRectMake(_ntabbarOrginX3, 46,30, 3)];
                         } completion:^(BOOL finished) {
                             [self moveAnimationDidEnded];
                         }];
    }
    else if (rootIconView.tag == 4) {
        
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             [_selectBgView setFrame:CGRectMake(_ntabbarOrginX4, 46,30, 3)];
                         } completion:^(BOOL finished) {
                             [self moveAnimationDidEnded];
                         }];
    }
    else if (rootIconView.tag == 5) {
        
        [UIView animateWithDuration:0.2
                              delay:0
                            options:UIViewAnimationCurveEaseInOut
                         animations:^{
                             [_selectBgView setFrame:CGRectMake(_ntabbarOrginX5, 46,30, 3)];
                         } completion:^(BOOL finished) {
                             [self moveAnimationDidEnded];
                         }];
    }
}

- (void)moveAnimationDidEnded
{
    if (_delegate && [_delegate respondsToSelector:@selector(touchRootTabBarItem:)]) {
        [_delegate touchRootTabBarItem:_nselectTagIndex];
    }
}


@end

