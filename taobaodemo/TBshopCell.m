//
//  TBshopCell.m
//  taobaodemo
//
//  Created by admin on 13-11-22.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBshopCell.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
#import <QuartzCore/QuartzCore.h>

@implementation TBshopCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)drawRect:(CGRect)rect{
    titleLab.font=[TBFont fzltFontOfSize:14];
    titleLab.textColor=[UIColor colorFromRGB:0x444444];
    detailLab.font=[TBFont fzltFontOfSize:13];
    detailLab.textColor=[UIColor colorFromRGB:0x888888];
    pLab1.font=[TBFont DINBoldFontOfSize:14];
    pLab1.textColor=[UIColor colorFromRGB:0x888888];
    pLab1.strikeThroughEnabled = YES;
    pLab2.font=[TBFont DINBoldFontOfSize:14];
    pLab2.textColor=[UIColor colorFromRGB:0x444444];
    plab3.font=[TBFont DINBoldFontOfSize:14];
    plab3.textColor=[UIColor colorFromRGB:0x43AD55];
    line3.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"分割线平铺"]];
    isCheck=NO;
    [check addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
    [numbtn setTintColor:[UIColor blackColor]];
    
}
-(void)checkAction:(id)sender{
    if(isCheck){
        [check setImage:[UIImage imageNamed:@"勾选框_未勾选"] forState:UIControlStateNormal];
        isCheck=NO;
    }else{
        [check setImage:[UIImage imageNamed:@"勾选框1_已勾选"] forState:UIControlStateNormal];
        isCheck=YES;
    }
}
-(void)setImageText:(NSString *)imageText{
    CALayer *layer=[imgView layer];
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[UIColor colorFromRGB:0xededed] CGColor]];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 73, 73)];
    imageView.image=[UIImage imageNamed:imageText];
    CALayer *layer1=[imageView layer];
    [layer1 setBorderWidth:4.0];
    [layer1 setBorderColor:[[UIColor colorFromRGB:0xffffff] CGColor]];
    [imgView addSubview:imageView];
}
-(IBAction)moreOther:(id)sender{
    UIViewController *viewController=[[UIViewController alloc] init];
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, 510, 674)];
    view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"SKU"]];    
    
    [viewController setView:view];
    popover = [[UIPopoverController alloc] initWithContentViewController:viewController];
    [popover setPopoverContentSize:CGSizeMake(510,674)];
    [popover presentPopoverFromRect:((UIButton *)sender).frame
                             inView:self
           permittedArrowDirections:UIPopoverArrowDirectionRight
                           animated:NO];
//    popover.backgroundColor=[UIColor whiteColor];
}
- (void)popoverControllerDidDismissPopover:(UIPopoverController*)popoverController{
    if (popover) {
        [popover dismissPopoverAnimated:YES];
        popover=nil;
    }
}

@end
