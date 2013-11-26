//
//  TBmailCell.m
//  taobaodemo
//
//  Created by admin on 13-11-25.
//  Copyright (c) 2013年 admin. All rights reserved.
//

#import "TBmailCell.h"

@implementation TBmailCell

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
 */

-(void)setImgText:(NSString *)imgText{
    [mailImg setImage:[UIImage imageNamed:imgText]];
}

@end
