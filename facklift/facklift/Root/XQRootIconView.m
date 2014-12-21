//
//  XQRootIconView.m
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import "XQRootIconView.h"

@implementation XQRootIconView

@synthesize delegate =_delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = BGColor;
        
        button = [UIButton buttonWithType:UIButtonTypeCustom];
        float buttonWidth = 320/5;
        
        [button setFrame:CGRectMake(0, 0, buttonWidth, 35)];
        [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        title = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, buttonWidth, 20)];
        title.font = [UIFont systemFontOfSize:10];
        title.textColor = GREYColor;
        title.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:title];

    }
    
    return self;
}

- (void)setImageIcon:(UIImage *)strImage
{
    [button setImage:strImage forState:UIControlStateNormal];
}

- (void)selectImageIcon:(UIImage *)image
{
    [button setImage:image forState:UIControlStateNormal];
}

- (void)buttonClear
{
    button.backgroundColor = [UIColor clearColor];
}

- (void)setButtonbackImage:(NSString *)strImage
{
    button.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:strImage]];
}

- (void)clickButton:(id)sender
{
    if (_delegate && [_delegate respondsToSelector:@selector(clickRootIconView:)]) {
        [_delegate clickRootIconView:self];
    }
}

- (void)setTitle:(NSString *)strTitle
{
    [title setText:strTitle];
}

- (void)setTitleColor:(UIColor *) color
{
    [title setTextColor:color];
}

- (NSString *)getButtonTitle
{
    return button.titleLabel.text;
}

@end

