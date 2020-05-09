//
//  UIImage+Util.h
//  ZToolManager
//
//  Created by zhouhao on 2020/5/9.
//  Copyright © 2020 zhouhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Util)

/// UIColor 转UIImage
+ (UIImage *)imageWithColor:(UIColor *)color;

/// UIColor 转UIImage 带alpha
+ (UIImage *)imageWithColor:(UIColor *)color alpha:(CGFloat)alpha;

///随机颜色
+ (UIColor *)randomColor;

@end

NS_ASSUME_NONNULL_END
