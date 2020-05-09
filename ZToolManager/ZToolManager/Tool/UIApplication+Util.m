//
//  UIApplication+Util.m
//  guodian
//
//  Created by 超级犀牛 on 2019/9/2.
//  Copyright © 2019 zhouhao. All rights reserved.
//

#import "UIApplication+Util.h"

@implementation UIApplication (Util)
+ (NSString *)appVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

+ (NSString *)appBuildVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}

+ (NSDictionary *)appInfoDictionary{
    return [[NSBundle mainBundle] infoDictionary];
}

+ (void)resignFirstResponder{
    [[UIApplication sharedApplication] sendAction:@selector(resignFirstResponder) to:nil from:nil forEvent:nil];
}

///app 的Bundle id
+ (NSString *)bundleId{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
}
@end
