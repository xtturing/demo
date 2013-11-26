//
//  TBbuyTitleCell.m
//  taobaodemo
//
//  Created by admin on 13-11-25.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBbuyTitleCell.h"
#import "UIColor+Taobao.h"
#import "TBFont.h"
@implementation TBbuyTitleCell

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
    lab1.font=[TBFont fzltFontOfSize:14];
    lab1.textColor=[UIColor colorFromRGB:0x888888];
    lab2.font=[TBFont fzltFontOfSize:14];
    lab2.textColor=[UIColor colorFromRGB:0x888888];
    lab3.font=[TBFont fzltFontOfSize:14];
    lab3.textColor=[UIColor colorFromRGB:0x888888];
    lab4.font=[TBFont fzltFontOfSize:14];
    lab4.textColor=[UIColor colorFromRGB:0x888888];
    line.backgroundColor=[UIColor colorFromRGB:0xeeeeee];
}
@end
