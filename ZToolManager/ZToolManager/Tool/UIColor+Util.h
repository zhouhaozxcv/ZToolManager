//
//  UIColor+Util.h
//  ZToolManager
//
//  Created by zhouhao on 2020/5/9.
//  Copyright © 2020 zhouhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Util)

+ (UIColor *)colorWithHex:(long)hexColor;
+ (UIColor *)colorWithHex:(long)hexColor alpha:(float)opacity;

@end

NS_ASSUME_NONNULL_END
