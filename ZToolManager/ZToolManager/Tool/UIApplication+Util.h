//
//  UIApplication+Util.h
//  guodian
//
//  Created by 超级犀牛 on 2019/9/2.
//  Copyright © 2019 zhouhao. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIApplication (Util)

///获取app的版本号
+ (NSString *)appVersion;

///获取app build号
+ (NSString *)appBuildVersion;

///app infoDictionary
+ (NSDictionary *)appInfoDictionary;

///app 的Bundle id
+ (NSString *)bundleId;

///收起键盘
+ (void)resignFirstResponder;
@end

NS_ASSUME_NONNULL_END
