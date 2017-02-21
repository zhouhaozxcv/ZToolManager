//
//  UIApplication+TaskInfo.m
//  ZToolManager
//
//  Created by 超级犀牛 on 2017/2/21.
//  Copyright © 2017年 zhouhao. All rights reserved.
//

#import "UIApplication+TaskInfo.h"
#include <mach/mach.h>

@implementation UIApplication (TaskInfo)
///cpu使用情况
+ (CGFloat)cpuUsage
{
    thread_array_t         thread_list;
    mach_msg_type_number_t thread_count;
    thread_info_data_t     thinfo;
    mach_msg_type_number_t thread_info_count;
    thread_basic_info_t basic_info_th;
    
    // get threads in the task
    kern_return_t kr = task_threads(mach_task_self(), &thread_list, &thread_count);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    
    CGFloat tot_cpu = 0;
    
    for (int j = 0; j < thread_count; j++)
        
    {
        thread_info_count = THREAD_INFO_MAX;
        kr = thread_info(thread_list[j], THREAD_BASIC_INFO,(thread_info_t)thinfo, &thread_info_count);
        if (kr != KERN_SUCCESS) {
            return -1;
        }
        
        basic_info_th = (thread_basic_info_t)thinfo;
        
        if (!(basic_info_th->flags & TH_FLAGS_IDLE)) {
            tot_cpu = tot_cpu + basic_info_th->cpu_usage / (CGFloat)TH_USAGE_SCALE * 100.0;
        }
        
    } // for each thread
    //free mem
    kr = vm_deallocate(mach_task_self(), (vm_offset_t)thread_list, thread_count * sizeof(thread_t));
    assert(kr == KERN_SUCCESS);
    NSLog(@"Current Task Used CPU: %.1f%%",tot_cpu);
    return tot_cpu;
}


+ (unsigned long)memoryUsage
{
    struct mach_task_basic_info info;
    mach_msg_type_number_t size = sizeof(info);
    kern_return_t kr = task_info(mach_task_self(), TASK_BASIC_INFO, (task_info_t)&info, &size);
    if (kr != KERN_SUCCESS) {
        return -1;
    }
    unsigned long memorySize = info.resident_size >> 20;
    //    NSLog(@"virtual = %f\nresident = %f",info.virtual_size/1024.0/1024.0,info.resident_size/1024.0/1024.0);
    
    
    mach_task_basic_info_data_t info1;
    unsigned size1 = sizeof (info1);
    task_info (mach_task_self (), MACH_TASK_BASIC_INFO, (task_info_t) &info1, &size1);
    NSLog(@"Current Task Memory\n虚拟内存总数: %fMB\n当前任务所占用总内存: %fMB",info1.virtual_size/1024.0/1024.0,info1.resident_size/1024.0/1024.0);
    
    return memorySize;
}

@end
