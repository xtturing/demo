//
//  UIColor+Koubei.h
//  Koubei
//
//  Created by 中天 淘 on 12-3-19.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Taobao)

+ (UIColor *)colorFromRGB:(NSInteger)rgbValue withAlpha:(CGFloat)alpha;
+ (UIColor *)colorFromRGB:(NSInteger)rgbValue;
+ (UIColor *)colorWithHexString:(NSString *)hexString;
+ (UIColor *)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;
+ (UIColor *)colorWithHexStringWithAlpha:(NSString *)hexString;
@end
