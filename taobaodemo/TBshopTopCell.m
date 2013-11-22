
//
//  TBshopTopCell.m
//  taobaodemo
//
//  Created by admin on 13-11-22.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBshopTopCell.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
@implementation TBshopTopCell

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
    titleLab.textColor=[UIColor colorFromRGB:0x888888];
    line1.backgroundColor=[UIColor colorFromRGB:0xe6e6e6];
    line2.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"分割线平铺"]];
    isCheck=NO;
    [check addTarget:self action:@selector(checkAction:) forControlEvents:UIControlEventTouchUpInside];
   
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
@end
