//
//  UIColor+ExtendedAttribute.m
//  ZToolManager
//
//  Created by 超级犀牛 on 2017/2/21.
//  Copyright © 2017年 zhouhao. All rights reserved.
//

#import "UIColor+ExtendedAttribute.h"

@implementation UIColor (ExtendedAttribute)

+ (UIColor *)colorWithHex:(long)hexColor{
    return [UIColor colorWithHex:hexColor alpha:1.0];
}

+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity
{
    float red = ((float)((hexColor & 0xFF0000) >> 16))/255.0;
    float green = ((float)((hexColor & 0xFF00) >> 8))/255.0;
    float blue = ((float)(hexColor & 0xFF))/255.0;
    return [UIColor colorWithRed:red green:green blue:blue alpha:opacity];
}

+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    const CGFloat *components = CGColorGetComponents(color.CGColor);
    CGFloat r = (CGFloat) components[0];
    CGFloat g = (CGFloat) components[1];
    CGFloat b = (CGFloat) components[2];
    UIColor *colorNew = [UIColor colorWithRed:r green:g blue:b alpha:alpha];
    
    CGContextSetFillColorWithColor(context, colorNew.CGColor);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIColor *)randomColor{
    int R = (arc4random() % 256);
    int G = (arc4random() % 256);
    int B = (arc4random() % 256);
    return [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f];
}


@end
