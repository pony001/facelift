//
//  PlasticCell.m
//  facklift
//
//  Created by 马明晗 on 14/12/21.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import "PlasticCell.h"
#import "PlasticInfo.h"
#import "UIImageView+AFNetworking.h"
#import "RatingView.h"

@implementation PlasticCell

- (void)awakeFromNib {
    // Initialization code
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)updateCell
{
     [_ratingView setImagesDeselected:@"rating_deselected.png" partlySelected:@"rating_selected.png" fullSelected:@"rating_fullselected.png" andDelegate:self];
    return;
    [_name setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [_name setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    
    NSArray* brconstrs = [NSLayoutConstraint constraintsWithVisualFormat:@"[_name][_certifiedImage]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(_name ,_certifiedImage)];
    [self.contentView addConstraints:brconstrs];

    /*
    int valueTag = 999990;
    int unitTag = 999991;
    int unitDescTag = 999992;
    
    UILabel *value = (UILabel*)[view viewWithTag:valueTag];
    if (value == nil) {
        
        value = [[UILabel alloc] init];
        value.numberOfLines = 0;
        value.lineBreakMode = NSLineBreakByWordWrapping;
        value.preferredMaxLayoutWidth = 60;
        value.backgroundColor = [UIColor clearColor];
        value.font = [UIFont fontWithName:@"AkzidenzGroteskBQ-LigCnd" size:30];
        value.textColor = DARK_GREY;
        value.tag = valueTag;
        
        [value setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [value setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [value setTranslatesAutoresizingMaskIntoConstraints:NO];
        [view addSubview:value];
        
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[value(60@300)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(value)]];
    }
    value.text = valueStr;
    
    
    UILabel *unit = (UILabel*)[view viewWithTag:unitTag];
    if (unit == nil) {
        unit = [[UILabel alloc] init];
        unit.numberOfLines = 0;
        unit.lineBreakMode = NSLineBreakByWordWrapping;
        unit.preferredMaxLayoutWidth = 40;
        unit.font = [UIFont fontWithName:@"AkzidenzGroteskBQ-LigCnd" size:15];
        unit.backgroundColor = [UIColor clearColor];
        unit.textColor = DARK_GREY;
        unit.tag = unitTag;
        
        [unit setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [unit setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
        [unit setTranslatesAutoresizingMaskIntoConstraints:NO];
        [view addSubview:unit];
        
        NSArray* brconstrs = [NSLayoutConstraint constraintsWithVisualFormat:@"|[value][unit]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(value ,unit)];
        [view addConstraints:brconstrs];
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-12-[unit(60@300)]" options:0 metrics:nil views:NSDictionaryOfVariableBindings(unit)]];
    }
    unit.text = unitStr;
    
    UILabel *unitDesc = (UILabel*)[view viewWithTag:unitDescTag];
    if (unitDesc == nil) {
        unitDesc = [[UILabel alloc] init];
        unitDesc.backgroundColor = [UIColor clearColor];
        unitDesc.preferredMaxLayoutWidth = 60;
        unitDesc.font = [UIFont systemFontOfSize:14];
        unitDesc.textColor = MIDDLE_GREY;
        unitDesc.backgroundColor = [UIColor clearColor];
        [unitDesc setTranslatesAutoresizingMaskIntoConstraints:NO];
        unitDesc.tag = unitDescTag;
        
        [view addSubview:unitDesc];
        
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[unitDesc]|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(unitDesc)]];
        [view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[unitDesc]-0-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(unitDesc)]];
    }
    unitDesc.text = unitDescStr;
     */
}

- (void)initWithPlasticInfo:(PlasticInfo*)plasticInfo
{
    [_icon setImageWithURL:[NSURL URLWithString:plasticInfo.icon]
          placeholderImage:[UIImage imageNamed:@"messageTip"]];
    [_name setText:plasticInfo.name];
    [_domain setText:plasticInfo.domain];
    [_certifiedImage setImage:[UIImage imageNamed:plasticInfo.isCertified?@"tabbaritem1":@"tabbaritemselect1"]];
    [_ratingView displayRating:1.5f];
}

-(void)ratingChanged:(float)newRating {
}

@end
