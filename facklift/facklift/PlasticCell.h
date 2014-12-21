//
//  PlasticCell.h
//  facklift
//
//  Created by 马明晗 on 14/12/21.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PlasticInfo;

@interface PlasticCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *domain;
@property (weak, nonatomic) IBOutlet UIImageView *certifiedImage;

- (void)initWithPlasticInfo:(PlasticInfo*)plasticInfo;

@end
