//
//  TBrecomendCell.m
//  taobaodemo
//
//  Created by admin on 13-11-21.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBrecomendCell.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
#import <QuartzCore/QuartzCore.h>
@implementation TBrecomendCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect
{
    title.font=[TBFont fzltFontOfSize:13];
    title.textColor=[UIColor colorFromRGB:0x444444];
    price.font=[TBFont DINBoldFontOfSize:14];
    price.textColor=[UIColor colorFromRGB:0xFF5500];
    sell.font=[TBFont DINBoldFontOfSize:12];
    sell.textColor=[UIColor colorFromRGB:0xb1b1b1];
    comment.font=[TBFont DINBoldFontOfSize:12];
    comment.textColor=[UIColor colorFromRGB:0xb1b1b1];
    
}
-(void)setImageText:(NSString *)imageText{
    CALayer *layer=[image layer];
    [layer setBorderWidth:1.0];
    [layer setBorderColor:[[UIColor colorFromRGB:0xededed] CGColor]];
    UIImageView *imageView=[[UIImageView alloc] initWithFrame:CGRectMake(1, 1, 141, 141)];
    imageView.image=[UIImage imageNamed:imageText];
    CALayer *layer1=[imageView layer];
    [layer1 setBorderWidth:4.0];
    [layer1 setBorderColor:[[UIColor colorFromRGB:0xffffff] CGColor]];
    [image addSubview:imageView];
}
@end
