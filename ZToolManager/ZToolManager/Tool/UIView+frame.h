//
//  UIView+frame.h
//  guodian
//
//  Created by 超级犀牛 on 2019/9/5.
//  Copyright © 2019 zhouhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (frame)

@property (nonatomic) CGFloat left;

/**
 * Sets frame.origin.y = top
 */
@property (nonatomic) CGFloat top;

/**
 * Sets frame.origin.x = right - frame.size.width
 */
@property (nonatomic) CGFloat right;

/**
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property (nonatomic) CGFloat bottom;

/**
 * Sets frame.size.width = width
 */
@property (nonatomic) CGFloat width;

/**
 * Sets frame.size.height = height
 */
@property (nonatomic) CGFloat height;

/**
 * Sets center.x = centerX
 */
@property (nonatomic) CGFloat centerX;

/**
 * Sets center.y = centerY
 */
@property (nonatomic) CGFloat centerY;
/**
 * Shortcut for frame.origin
 */
@property (nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property (nonatomic) CGSize size;

/**
 * Shortcut for frame.origin.x
 */
@property (nonatomic) CGFloat x;

/**
 * Shortcut for frame.origin.y
 */
@property (nonatomic) CGFloat y;


@end

NS_ASSUME_NONNULL_END
