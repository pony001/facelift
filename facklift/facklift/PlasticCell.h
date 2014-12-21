//
//  PlasticCell.h
//  facklift
//
//  Created by 马明晗 on 14/12/21.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RatingView.h"

@class PlasticInfo;

@interface PlasticCell : UITableViewCell<RatingViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *domain;
@property (weak, nonatomic) IBOutlet UIImageView *certifiedImage;
@property (weak, nonatomic) IBOutlet RatingView *ratingView;

- (void)updateCell;
- (void)initWithPlasticInfo:(PlasticInfo*)plasticInfo;

@end
