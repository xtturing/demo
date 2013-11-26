//
//  TBShopViewController.m
//  taobaodemo
//
//  Created by admin on 13-11-22.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBShopViewController.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
#import "TSPopoverController.h"
#import "TBshopCell.h"
#import "TBshopBottomCell.h"
#import "TBshopTopCell.h"
#import <QuartzCore/QuartzCore.h>
#import "TBbuyViewController.h"
#import "TBdetailViewController.h"
@interface TBShopViewController (){
    
}

@end

@implementation TBShopViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    self.view.backgroundColor=[UIColor clearColor];
    topView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    CALayer *layer=[topView layer];
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[UIColor colorFromRGB:0xe6e6e6] CGColor]];
    bottomView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    CALayer *blayer=[bottomView layer];
    [blayer setBorderWidth:1.0];
    [blayer setBorderColor:[[UIColor colorFromRGB:0xe6e6e6] CGColor]];
    myTableView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    myTableView.delegate=self;
    myTableView.dataSource=self;
    myTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    check.titleLabel.font=[TBFont fzltFontOfSize:18];
    [check setTintColor:[UIColor colorFromRGB:0xff5500]];
    
    moveBtn.titleLabel.font=[TBFont fzltFontOfSize:18];
    [moveBtn setTintColor:[UIColor colorFromRGB:0xff5500]];
    
    deleteBtn.titleLabel.font=[TBFont fzltFontOfSize:18];
    [deleteBtn setTintColor:[UIColor colorFromRGB:0xff5500]];
    
    titlebtn.titleLabel.font=[TBFont fzltFontOfSize:18];
    [titlebtn setTintColor:[UIColor colorFromRGB:0x444444]];
    
//    buyBtn.titleLabel.font=[TBFont fzltFontOfSize:18];
    [buyBtn.titleLabel setFont:[TBFont fzltFontOfSize:18]];
    
     numLab.font=[TBFont fzltFontOfSize:18];
    [numLab setTextColor:[UIColor colorFromRGB:0x888888]];
    
     priceLab.font=[TBFont DINBoldFontOfSize:18];
    [priceLab setTextColor:[UIColor colorFromRGB:0xff5500]];
    
     allLab.font=[TBFont fzltFontOfSize:18];
    [allLab setTextColor:[UIColor colorFromRGB:0x444444]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0)
    {
        static NSString *topRowIdentifier = @"topRowIdentifier";
        TBshopTopCell *cell = [tableView dequeueReusableCellWithIdentifier:topRowIdentifier];
        if (cell == nil)
        {
            cell = [[TBshopTopCell alloc]
                    initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topRowIdentifier];
        }
        return cell;
    }else if (indexPath.row==3){
        static NSString *bottomRowIdentifier = @"bottomRowIdentifier";
        TBshopBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:bottomRowIdentifier];
        if (cell == nil)
        {
            cell = [[TBshopBottomCell alloc]
                    initWithStyle:UITableViewCellStyleDefault reuseIdentifier:bottomRowIdentifier];
        }
        return cell;
    }else{
        static NSString *TableSampleIdentifier = @"TBshopCellIdentifier";
        TBshopCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
        if (cell == nil) {
            cell = [[TBshopCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
        }
        cell.imageText=[NSString stringWithFormat:@"%d",(int)indexPath.row];
        return cell;
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0)
    {
       return 50;
    }else if (indexPath.row==3){
        return 70;
    }else{
        return 134;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0)
    {
    }else if (indexPath.row==3){
        
    }else{
        TBdetailViewController *view=[self.storyboard instantiateViewControllerWithIdentifier:@"detailViewController"];
        [self.navigationController pushViewController:view animated:YES];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"buyView"])
    {
        
    }
}
@end
