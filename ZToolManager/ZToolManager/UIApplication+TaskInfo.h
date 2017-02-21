//
//  UIApplication+TaskInfo.h
//  ZToolManager
//
//  Created by 超级犀牛 on 2017/2/21.
//  Copyright © 2017年 zhouhao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIApplication (TaskInfo)

///cpu使用情况
+ (CGFloat)cpuUsage;

///查看VM（虚拟内存）使用情况
+ (unsigned long)memoryUsage;
@end
