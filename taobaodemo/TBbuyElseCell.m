//
//  TBbuyElseCell.m
//  taobaodemo
//
//  Created by admin on 13-11-25.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBbuyElseCell.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
@implementation TBbuyElseCell

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
    detailLab.font=[TBFont fzltFontOfSize:14];
    detailLab.textColor=[UIColor colorFromRGB:0x444444];
    line.backgroundColor=[UIColor colorFromRGB:0xeeeeee];
}
-(void)setTitleText:(NSString *)titleText{
    titleLab.text=titleText;
}
-(void)setDetailtext:(NSString *)detailtext{
    detailLab.text=detailtext;
}
@end
