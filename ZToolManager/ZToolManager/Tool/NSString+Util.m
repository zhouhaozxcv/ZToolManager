//
//  NSString+Util.m
//  ZToolManager
//
//  Created by zhouhao on 2020/5/9.
//  Copyright © 2020 zhouhao. All rights reserved.
//

#import "NSString+Util.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Util)

- (BOOL)isBlank{
    NSString *string = self;
    if (![string isKindOfClass:[NSString class]]) return YES;
    if ([string isKindOfClass:[NSNull class]]) return YES;
    if (string == nil || string == NULL) return YES;
    if ([@"" isEqualToString:string]) return YES;
    
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length]==0) {
        return YES;
    }
    
    return NO;
}

///安全的string
- (NSString *)safety{
    if ([self isBlank]) {
        return @"";
    }else{
        return [NSString stringWithFormat:@"%@",self];
    }
}

///md5字符串
- (NSString *)stringByMD5{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest);
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return output;
}

@end
