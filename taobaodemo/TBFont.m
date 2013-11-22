//
//  TBFont.m
//  Taobao4iPad
//
//  Created by Lu Kejin on 4/24/12.
//  Copyright (c) 2012 Taobao.com. All rights reserved.
//

#import "TBFont.h"

@implementation TBFont

+ (UIFont *)fzltFontOfSize:(CGFloat)fontSize{
    UIFont *fzltFont = [UIFont fontWithName:@"FZLanTingHei-R-GBK" size:fontSize];
    return fzltFont;
}


+ (UIFont *)DINBoldFontOfSize:(CGFloat)fontSize{
    UIFont *fzs3Font = [UIFont fontWithName:@"DIN-Bold" size:fontSize];
    return fzs3Font;
}

+ (UIFont *)DINMediumFontOfSize:(CGFloat)fontSize {
    UIFont *fzs3Font = [UIFont fontWithName:@"DIN-Medium" size:fontSize];
    return fzs3Font;
}
+ (UIFont *)DINRegularFontOfSize:(CGFloat)fontSize {
    UIFont *fzs3Font = [UIFont fontWithName:@"DIN-Regular" size:fontSize];
    return fzs3Font;
}
@end
