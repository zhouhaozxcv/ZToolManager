//
//  NSString+Util.h
//  ZToolManager
//
//  Created by zhouhao on 2020/5/9.
//  Copyright © 2020 zhouhao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Util)

///是否是空字符串
- (BOOL)isBlank;
///安全的string
- (NSString *)safety;

///md5字符串
- (NSString *)stringByMD5;

@end

NS_ASSUME_NONNULL_END
