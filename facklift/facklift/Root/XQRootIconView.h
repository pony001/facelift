//
//  XQRootIconView.h
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol XQRootIconViewDelegate;

@interface XQRootIconView : UIView {
    
    UIButton        *button;
    UILabel *title;
    
    __unsafe_unretained id<XQRootIconViewDelegate> _delegate;
}

@property (nonatomic,assign) id<XQRootIconViewDelegate> delegate;

- (void)createUI;
- (void)setImageIcon:(UIImage *)strImage;
- (void)selectImageIcon:(UIImage *)image;
- (void)buttonClear;
- (void)setButtonbackImage:(NSString *)strImage;
- (void)setTitle:(NSString *)strTitle;
- (void)setTitleColor:(UIColor *) color;

@end

@protocol XQRootIconViewDelegate <NSObject>

- (void)clickRootIconView:(XQRootIconView*)rootIconView;

@end
