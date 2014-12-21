//
//  PlasticViewController.m
//  facklift
//
//  Created by 马明晗 on 14/12/20.
//  Copyright (c) 2014年 马明晗. All rights reserved.
//

#import "PlasticViewController.h"
#import "PlasticCell.h"
#import "PlasticInfo.h"

@interface PlasticViewController (){
    NSMutableArray *_plasticList;
}

@end

@implementation PlasticViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _plasticTableView.delegate = self;
    _plasticTableView.dataSource = self;
    
    _plasticList = [NSMutableArray array];
    [self getPlasticInfo];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark
#pragma Net 
- (void)getPlasticInfo
{
    //TODO 请求网络，返回医院的列表
    PlasticInfo *plasticInfo = [[PlasticInfo alloc] init];
    plasticInfo.name = @"AABB整形医院";
    plasticInfo.icon = @"";
    plasticInfo.isCertified = YES;
    plasticInfo.domain = @"鼻子、脸";
    [_plasticList addObject:plasticInfo];
    [_plasticList addObject:plasticInfo];
    [_plasticList addObject:plasticInfo];
    [_plasticList addObject:plasticInfo];
    [_plasticList addObject:plasticInfo];
    [_plasticList addObject:plasticInfo];
    [_plasticList addObject:plasticInfo];
    [_plasticList addObject:plasticInfo];
    //[_plasticTableView reloadData];
}

#pragma mark
#pragma plasticTableView delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    
    return [_plasticList count];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 68;
}

// table with with built in cells
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    static NSString *CellIdentifierStats = @"PlasticCell";
    
    PlasticCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifierStats];
    
    if (cell == nil) {
        
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"PlasticCell" owner:nil options:nil];
        cell = (PlasticCell*)[nib objectAtIndex:0];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        //[cell initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifierStats];
        //[tableView registerClass:[PlasticCell class] forCellReuseIdentifier:CellIdentifierStats];
        
    }
    [cell initWithPlasticInfo:[_plasticList objectAtIndex:indexPath.row]];
    
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
