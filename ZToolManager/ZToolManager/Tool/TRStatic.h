//
//  TRStatic.h
//  ZToolManager
//
//  Created by zhouhao on 2020/5/9.
//  Copyright © 2020 zhouhao. All rights reserved.
//

#import <pthread.h>
#import "NSString+Util.h"
#import "UIColor+Util.h"

#pragma mark - 线程
///创建一个子线程
static inline void dispatch_async_on_new_queue(const char *_Nullable queueName, void (^ _Nonnull block)(void)){
    dispatch_async(dispatch_queue_create(queueName, DISPATCH_QUEUE_CONCURRENT), block);
}

///使用一个固有线程Queue
static inline void dispatch_async_on_running_queue(dispatch_queue_t _Nonnull queue, void (^ _Nonnull block)(void)){
    dispatch_async(queue, block);
}


///在全局线程中执行代码
static inline void dispatch_async_on_global_queue(void (^ _Nonnull block)(void)){
    dispatch_async(dispatch_get_global_queue(0, 0), block);
}

///在主线程运行代码
static inline void dispatch_async_on_main_queue(void (^ _Nonnull block)(void)){
    if (pthread_main_np()) {
        block();
    } else {
        dispatch_async(dispatch_get_main_queue(), block);
    }
}

#pragma mark -
///字符串是否是空
static inline BOOL TRStringBlank(NSString * _Nullable str) {
    return [str isBlank];
}
///字符串转换为安全的
static inline NSString * _Nullable TRStringSafe(NSString * _Nullable str) {
    return [str safety];
}
///frame
static inline CGRect TRFrame(CGFloat x, CGFloat y, CGFloat width, CGFloat height) {
    return CGRectMake(x, y, width, height);
}

static inline UIColor * _Nonnull TRColor(long hexColor) {
    return [UIColor colorWithHex:hexColor];
}

static inline UIColor * _Nonnull TRColorAlpha(long hexColor, float alpha) {
    return [UIColor colorWithHex:hexColor alpha:alpha];
}

static inline UIFont * _Nonnull TRFont(CGFloat font) {
    return [UIFont systemFontOfSize:font];
}


#pragma mark - Frame
///设备的宽
static inline CGFloat ScreenWidth(){
    return [UIScreen mainScreen].bounds.size.width;
}
static inline CGFloat ScreenHeight(){
    return [UIScreen mainScreen].bounds.size.height;
}

///设备的长
///设备最长边
static inline CGFloat MaxScreenLength(){
    return MAX(ScreenWidth(), ScreenHeight());
}
///设备最短边
static inline CGFloat MinScreenLength(){
    return MIN(ScreenWidth(), ScreenHeight());
}
///以iPhone6的宽为准的宽高比
static inline CGFloat ScreenRate(){ return ScreenWidth()/375.f; }

///以iPhoneX高为准的宽高比
static inline CGFloat ScreenHeightRate_X(){ return ScreenHeight()/812.f; }

//是否是iPhone
static inline BOOL isiPhone(){ return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone); }

///当前设备是否是iPhone4
static inline BOOL iPhone_4Less(){ return (isiPhone() && MaxScreenLength() < 568.f); }
static inline BOOL iPhone_5(){ return (isiPhone() && MaxScreenLength() == 568.f); }
static inline BOOL iPhone_5Less(){ return (isiPhone() && MaxScreenLength() <= 568.f); }
static inline BOOL iPhone_6(){ return (isiPhone() && MaxScreenLength() == 667.f); }
static inline BOOL iPhone_6Less(){ return (isiPhone() && MaxScreenLength() <= 667.f); }
static inline BOOL iPhone_6P(){ return (isiPhone() && MaxScreenLength() == 736.f); }
static inline BOOL iPhone_X(){ return (isiPhone() && MaxScreenLength() == 812.f); }
static inline BOOL iPhone_XLater(){ return (isiPhone() && MaxScreenLength() >= 812.f); }

///当前系统是否是iOS11或者之后
static inline BOOL iOS_8Later(){ return ([UIDevice currentDevice].systemVersion.floatValue >= 8.f); };
static inline BOOL iOS_11Later(){ return ([UIDevice currentDevice].systemVersion.floatValue >= 11.f); };
static inline BOOL iOS_13Later(){ return ([UIDevice currentDevice].systemVersion.floatValue >= 13.f); };

