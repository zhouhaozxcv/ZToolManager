//
//  UIView+Util.m
//  guodian
//
//  Created by 超级犀牛 on 2019/9/21.
//  Copyright © 2019 zhouhao. All rights reserved.
//

#import "UIView+Util.h"


@implementation UIView (Util)

- (void)addTarget:(id)target action:(SEL)action {
    self.userInteractionEnabled = YES;
    UIGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:target action:action];
    [self addGestureRecognizer:gesture];
}

- (void)addLongDuration:(NSInteger)duration target:(id)target action:(SEL)action{
    self.userInteractionEnabled = YES;
    UILongPressGestureRecognizer *gesture = [[UILongPressGestureRecognizer alloc] initWithTarget:target action:action];
    gesture.minimumPressDuration = duration;
    [self addGestureRecognizer:gesture];
}

- (BOOL)intersectsWithAnotherView:(UIView *)anotherView{
    //如果anotherView为nil，那么就代表keyWindow
    if (anotherView == nil) {
        anotherView = [UIApplication sharedApplication].keyWindow;
    }
    CGRect selfRect = [self convertRect:self.bounds toView:nil];
    CGRect anotherRect = [anotherView convertRect:anotherView.bounds toView:nil];
    //CGRectIntersectsRect是否有交叉
    return CGRectIntersectsRect(selfRect, anotherRect);
}

@end
