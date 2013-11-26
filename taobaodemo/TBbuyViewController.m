//
//  TBbuyViewController.m
//  taobaodemo
//
//  Created by admin on 13-11-23.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBbuyViewController.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
#import "TSPopoverController.h"
#import "TBbuyCell.h"
#import "TBbuyTitleCell.h"
#import "TBbuyElseCell.h"
#import "TBmailCell.h"
@interface TBbuyViewController (){
    NSIndexPath *selectCellIndex;
}

@end

@implementation TBbuyViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    addressView.backgroundColor=[UIColor  colorFromRGB:0xf4f4f4];
    barView.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"toolbar_bg.png"]];
    mailView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    buyView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    bottomView.backgroundColor=[UIColor colorFromRGB:0xf4f4f4];
    
    [btn1 setBackgroundImage:[UIImage imageNamed:@"关闭点击"] forState:UIControlStateHighlighted];
    
    btn2.titleLabel.font=[TBFont fzltFontOfSize:18];
    
    btn3.titleLabel.font=[TBFont fzltFontOfSize:16];
    [btn3 setTintColor:[UIColor colorFromRGB:0xff5500]];
    
    btn4.titleLabel.font=[TBFont fzltFontOfSize:16];
    [btn4 setTintColor:[UIColor colorFromRGB:0xff5500]];
    
    lab1.font=[TBFont fzltFontOfSize:18];
    [lab1 setTextColor:[UIColor colorFromRGB:0x444444]];
    
    lab2.font=[TBFont DINBoldFontOfSize:18];
    [lab2 setTextColor:[UIColor colorFromRGB:0xff5500]];
    
    lab3.font=[TBFont fzltFontOfSize:16];
    [lab3 setTextColor:[UIColor colorFromRGB:0x888888]];
    
    mailView.delegate=self;
    mailView.dataSource=self;
    mailView.showsHorizontalScrollIndicator=NO;
    mailView.showsVerticalScrollIndicator=NO;
    mailView.userInteractionEnabled=YES;
    
    buyView.delegate=self;
    buyView.dataSource=self;
    buyView.showsVerticalScrollIndicator=NO;
    buyView.showsHorizontalScrollIndicator=NO;
    buyView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    line.backgroundColor=[UIColor colorFromRGB:0xeeeeee];
	// Do any additional setup after loading the view.
}

-(IBAction)closeAction:(id)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 10;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        TBmailCell *cell = (TBmailCell*) [collectionView dequeueReusableCellWithReuseIdentifier:@"TBmailCellIdentifier"
                                                                                                 forIndexPath:indexPath];
        cell.imgText=@"信封未选中";
        return cell;
   
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{    
    int newRow=[indexPath row];
    int oldRow=(selectCellIndex!=nil)?[selectCellIndex row]:-1;
    if(newRow!=oldRow){
        TBmailCell *newcell=(TBmailCell *)[collectionView cellForItemAtIndexPath:indexPath];
        newcell.imgText=@"信封选中";
        TBmailCell *oldCell=(TBmailCell *)[collectionView cellForItemAtIndexPath:selectCellIndex];
        oldCell.imgText=@"信封未选中";
        selectCellIndex=[indexPath copy];
    }
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 8;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.row==0)
    {
        static NSString *topRowIdentifier = @"TBbuyTitleCellIdentifier";
        TBbuyTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:topRowIdentifier];
        if (cell == nil)
        {
            cell = [[TBbuyTitleCell alloc]
                    initWithStyle:UITableViewCellStyleDefault reuseIdentifier:topRowIdentifier];
        }
        return cell;
    }else if (indexPath.row>=3){
        static NSString *bottomRowIdentifier = @"TBbuyElseCellIdentifier";
        TBbuyElseCell *cell = [tableView dequeueReusableCellWithIdentifier:bottomRowIdentifier];
        if (cell == nil)
        {
            cell = [[TBbuyElseCell alloc]
                    initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:bottomRowIdentifier];
        }
        if(indexPath.row==3){
            cell.titleText=@"配送方式";
            cell.detailtext=@"EMS 20 元";
        }else if(indexPath.row==4){
            cell.titleText=@"店铺优惠";
            cell.detailtext=@"8.5折";
        }else{
            cell.titleText=@"双11红包";
            cell.detailtext=@"100元";
        }
        return cell;
    }else{
        static NSString *TableSampleIdentifier = @"TBbuyCellIdentifier";
        TBbuyCell *cell = [tableView dequeueReusableCellWithIdentifier:TableSampleIdentifier];
        if (cell == nil) {
            cell = [[TBbuyCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:TableSampleIdentifier];
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
    }else if (indexPath.row<3){
        return 134;
    }else{
        return 50;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
