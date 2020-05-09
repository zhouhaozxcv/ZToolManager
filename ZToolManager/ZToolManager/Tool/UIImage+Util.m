//
//  UIImage+Util.m
//  ZToolManager
//
//  Created by zhouhao on 2020/5/9.
//  Copyright © 2020 zhouhao. All rights reserved.
//

#import "UIImage+Util.h"

@implementation UIImage (Util)

// UIColor 转UIImage
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

// UIColor 转UIImage 带alpha
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
    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    return [UIColor colorWithRed:R/255.0f green:G/255.0f blue:B/255.0f alpha:1.0f];
}

@end
