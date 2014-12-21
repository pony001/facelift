//
//  XQBadgeItem.h
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface XQBadgeItem: UIImageView
{
    UILabel *_badgeLabel;
    int _redNum;
    int _whiteNum;
}

- (void)setBadgeAlert:(int)number;

- (NSInteger)getBageNumber;

@end