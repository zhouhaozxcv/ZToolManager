//
//  UIColor+ExtendedAttribute.h
//  ZToolManager
//
//  Created by 超级犀牛 on 2017/2/21.
//  Copyright © 2017年 zhouhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ExtendedAttribute)

///16进制颜色
+ (UIColor *)colorWithHex:(long)hexColor;

///16进制颜色 alpha通道
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

///UIColor 转UIImage
+ (UIImage *)imageWithColor:(UIColor *)color;

///UIColor 转UIImage 带alpha
+ (UIImage *)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha;

///随机颜色
+ (UIColor *)randomColor;


@end
