//
//  PlasticViewController.h
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlasticViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *plasticTableView;

@end
