//
//  XQBadgeItem.m
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import "XQBadgeItem.h"


@implementation XQBadgeItem

#pragma mark -
#pragma mark -- Life Cycle
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:CGRectMake(frame.origin.x, frame.origin.y, 5, 5)];
    if (self) {
    }
    return self;
}

#pragma mark -
#pragma mark -- Custom
- (void)setBadgeAlert:(int)number
{
    _redNum = number;
    self.image = [UIImage imageNamed:@"messageTip.png"];
    if (number == 0) {
        self.hidden = YES;
    } else {
        self.hidden = NO;
    }
}

- (NSInteger)getBageNumber;
{
    return _redNum;
}

@end

