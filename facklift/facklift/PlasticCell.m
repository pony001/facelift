//
//  PlasticCell.m
//  facklift
//
//  Created by 马明晗 on 14/12/21.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import "PlasticCell.h"
#import "PlasticInfo.h"

@implementation PlasticCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)initWithPlasticInfo:(PlasticInfo*)plasticInfo
{
    [_icon setImage:[UIImage imageNamed:@""]];
    [_name setText:plasticInfo.name];
    [_domain setText:plasticInfo.domain];
    [_certifiedImage setImage:[UIImage imageNamed:plasticInfo.isCertified?@"":@""]];
}

@end
