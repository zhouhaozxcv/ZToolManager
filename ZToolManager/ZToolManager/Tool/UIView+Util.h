//
//  UIView+Util.h
//  guodian
//
//  Created by 超级犀牛 on 2019/9/21.
//  Copyright © 2019 zhouhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Util)

- (void)addTarget:(id)target action:(SEL)action;
- (void)addLongDuration:(NSInteger)duration target:(id)target action:(SEL)action;

///判断当前view是否在最上面
- (BOOL)intersectsWithAnotherView:(UIView *)anotherView;
@end

NS_ASSUME_NONNULL_END
