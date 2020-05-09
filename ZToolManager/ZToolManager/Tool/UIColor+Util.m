//
//  UIColor+Util.m
//  ZToolManager
//
//  Created by zhouhao on 2020/5/9.
//  Copyright © 2020 zhouhao. All rights reserved.
//

#import "UIColor+Util.h"

@implementation UIColor (Util)

+ (UIColor *)colorWithHex:(long)hexColor{
    return [UIColor colorWithHex:hexColor alpha:1.f];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+ (UIColor *)randomColor{
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    return [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f];
}
@end
