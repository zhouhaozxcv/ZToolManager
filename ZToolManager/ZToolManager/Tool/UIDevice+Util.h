//
//  UIDevice+Util.h
//  guodian
//
//  Created by 超级犀牛 on 2019/10/24.
//  Copyright © 2019 zhouhao. All rights reserved.
//


#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (Util)

/// 获取设备型号
+ (NSString *)deviceName;

/// 获取设备局部型号
+ (NSString *)deviceLocalizedModelName;

///获取设备的名称
+ (NSString *)deviceUserName;

///获取设备的电池电量
+ (CGFloat)batteryLevel;

///系统名称
+ (NSString *)systemName;

///获取系统版本号
+ (NSString *)systemVersion;


///idfa
+ (NSString *)idfa;

///uuid
+ (NSString *)uuid;

///mac地址
+ (NSString *)macAddress __attribute__((deprecated("iOS7之后，苹果就不让获取mac地址了，慎用。")));

///设备IP地址
+ (NSString *)deviceIP;

///磁盘总容量
+ (CGFloat)diskTotalSize;

///磁盘可用容量
+ (CGFloat)diskFreeSize;

/// 设备在iphone7以上
+ (BOOL)deviceIsIphoneSevenOrMore;

@end

NS_ASSUME_NONNULL_END
