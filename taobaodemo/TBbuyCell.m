//
//  TBbuyCell.m
//  taobaodemo
//
//  Created by admin on 13-11-23.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBbuyCell.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
@implementation TBbuyCell

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
    priceLab.font=[TBFont DINBoldFontOfSize:14];
    priceLab.textColor=[UIColor colorFromRGB:0x444444];
    totalLab.font=[TBFont DINBoldFontOfSize:14];
    totalLab.textColor=[UIColor colorFromRGB:0xff5500];
    
    line.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"分割线平铺"]];
    
    
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

@end
