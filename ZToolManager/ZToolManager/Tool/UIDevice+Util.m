//
//  UIDevice+Util.m
//  guodian
//
//  Created by 超级犀牛 on 2019/10/24.
//  Copyright © 2019 zhouhao. All rights reserved.
//

#import "UIDevice+Util.h"
#import "sys/utsname.h"
#include <sys/sysctl.h>
#import <sys/sockio.h>
#include <sys/socket.h> // Per msqr
#include <net/if.h>
#include <net/if_dl.h>
#import <sys/ioctl.h>
#import <arpa/inet.h>
#import <AdSupport/AdSupport.h>
#import "SimulateIDFA.h"


@implementation UIDevice (Util)


/// 获取设备型号
+ (NSString *)deviceName
{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    // iPhone  系列
    if ([deviceString isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,2"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
    if ([deviceString isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    
    if ([deviceString isEqualToString:@"iPhone5,1"])    return @"iPhone 5";
    if ([deviceString isEqualToString:@"iPhone5,2"])    return @"iPhone 5 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone5,3"])    return @"iPhone 5c (GSM)";
    if ([deviceString isEqualToString:@"iPhone5,4"])    return @"iPhone 5c (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPhone6,1"])    return @"iPhone 5s (GSM)";
    if ([deviceString isEqualToString:@"iPhone6,2"])    return @"iPhone 5s (GSM+CDMA)";
    
    if ([deviceString isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
    if ([deviceString isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
    if ([deviceString isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
    if ([deviceString isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
    
    if ([deviceString isEqualToString:@"iPhone9,1"])    return @"iPhone 7 (CDMA)";
    if ([deviceString isEqualToString:@"iPhone9,3"])    return @"iPhone 7 (GSM)";
    if ([deviceString isEqualToString:@"iPhone9,2"])    return @"iPhone 7 Plus (CDMA)";
    if ([deviceString isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus (GSM)";
    if([deviceString isEqualToString:@"iPhone10,1"])    return@"iPhone 8";
    if([deviceString isEqualToString:@"iPhone10,4"])    return@"iPhone 8";
    if([deviceString isEqualToString:@"iPhone10,2"])    return@"iPhone 8 Plus";
    if([deviceString isEqualToString:@"iPhone10,5"])    return@"iPhone 8 Plus";
    if([deviceString isEqualToString:@"iPhone10,3"])    return@"iPhone X";
    if([deviceString isEqualToString:@"iPhone10,6"])    return@"iPhone X";
    
    
    // iPod  系列
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch (5 Gen)";
    
    // iPad  系列
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad1,2"])      return @"iPad 3G";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad Mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad Mini";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad Mini (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (GSM+CDMA)";
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,4"])      return @"iPad Mini 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad4,5"])      return @"iPad Mini 2 (Cellular)";
    if ([deviceString isEqualToString:@"iPad4,6"])      return @"iPad Mini 2";
    if ([deviceString isEqualToString:@"iPad4,7"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,8"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad4,9"])      return @"iPad Mini 3";
    if ([deviceString isEqualToString:@"iPad5,1"])      return @"iPad Mini 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad5,2"])      return @"iPad Mini 4 (LTE)";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad6,3"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,4"])      return @"iPad Pro 9.7";
    if ([deviceString isEqualToString:@"iPad6,7"])      return @"iPad Pro 12.9";
    if ([deviceString isEqualToString:@"iPad6,8"])      return @"iPad Pro 12.9";
    
    if ([deviceString isEqualToString:@"i386"])         return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])       return @"Simulator";
    
    
    return deviceString;
}
+ (BOOL)deviceIsIphoneSevenOrMore{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    if ([deviceString isEqualToString:@"iPhone9,1"])    return YES;
    if ([deviceString isEqualToString:@"iPhone9,3"])    return YES;
    if ([deviceString isEqualToString:@"iPhone9,2"])    return YES;
    if ([deviceString isEqualToString:@"iPhone9,4"])    return YES;
    if ([deviceString isEqualToString:@"iPhone10,1"])   return YES;
    if ([deviceString isEqualToString:@"iPhone10,4"])   return YES;
    if ([deviceString isEqualToString:@"iPhone10,2"])   return YES;
    if ([deviceString isEqualToString:@"iPhone10,5"])   return YES;
    if ([deviceString isEqualToString:@"iPhone10,3"])   return YES;
    if ([deviceString isEqualToString:@"iPhone10,6"])   return YES;
    return NO;
}
+ (NSString *)deviceLocalizedModelName{
    return [self currentDevice].localizedModel;
}

+ (NSString *)deviceUserName{
    return [self currentDevice].name;
}

+ (CGFloat)batteryLevel{
    return [[self currentDevice] batteryLevel];
}

+ (NSString *)systemName{
    return [self currentDevice].systemName;
}

+(NSString *)systemVersion {
    return [self currentDevice].systemVersion;
}

+(NSString *)idfa{
    NSString *idfa = [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
    NSString *temp = [idfa copy];
    temp = [temp stringByReplacingOccurrencesOfString:@"0" withString:@""];
    temp = [temp stringByReplacingOccurrencesOfString:@"-" withString:@""];
    if ([idfa isEqualToString:@"00000000-0000-0000-0000-000000000000"] || temp.length<=0) {
        idfa = [SimulateIDFA createSimulateIDFA];
    }
    return idfa;
}

+ (NSString *)uuid{
    return [[[self currentDevice] identifierForVendor] UUIDString];
}

+ (NSString *)macAddress{
    return @"macAddress";
    //ios 7之后获取不到了，需要获取uuid
    int                    mib[6];
    size_t                len;
    char                *buf;
    unsigned char        *ptr;
    struct if_msghdr    *ifm;
    struct sockaddr_dl    *sdl;
    
    mib[0] = CTL_NET;
    mib[1] = AF_ROUTE;
    mib[2] = 0;
    mib[3] = AF_LINK;
    mib[4] = NET_RT_IFLIST;
    
    if ((mib[5] = if_nametoindex("en0")) == 0) {
        printf("Error: if_nametoindex error/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, NULL, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 1/n");
        return NULL;
    }
    
    if ((buf = malloc(len)) == NULL) {
        printf("Could not allocate memory. error!/n");
        return NULL;
    }
    
    if (sysctl(mib, 6, buf, &len, NULL, 0) < 0) {
        printf("Error: sysctl, take 2");
        return NULL;
    }
    
    ifm = (struct if_msghdr *)buf;
    sdl = (struct sockaddr_dl *)(ifm + 1);
    ptr = (unsigned char *)LLADDR(sdl);
    
    NSString *outstring = [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x", *ptr, *(ptr+1), *(ptr+2), *(ptr+3), *(ptr+4), *(ptr+5)];
    free(buf);
    
    return [outstring uppercaseString];
}

+ (NSString *)deviceIP{
    int sockfd = socket(AF_INET, SOCK_DGRAM, 0);
    
    
    NSMutableArray *ips = [NSMutableArray array];
    
    int BUFFERSIZE = 4096;
    
    struct ifconf ifc;
    
    char buffer[BUFFERSIZE], *ptr, lastname[IFNAMSIZ], *cptr;
    
    struct ifreq *ifr, ifrcopy;
    
    ifc.ifc_len = BUFFERSIZE;
    ifc.ifc_buf = buffer;
    
    if (ioctl(sockfd, SIOCGIFCONF, &ifc) >= 0){
        
        for (ptr = buffer; ptr < buffer + ifc.ifc_len; ){
            
            ifr = (struct ifreq *)ptr;
            int len = sizeof(struct sockaddr);
            
            if (ifr->ifr_addr.sa_len > len) {
                len = ifr->ifr_addr.sa_len;
            }
            
            ptr += sizeof(ifr->ifr_name) + len;
            if (ifr->ifr_addr.sa_family != AF_INET) continue;
            if ((cptr = (char *)strchr(ifr->ifr_name, ':')) != NULL) *cptr = 0;
            if (strncmp(lastname, ifr->ifr_name, IFNAMSIZ) == 0) continue;
            
            memcpy(lastname, ifr->ifr_name, IFNAMSIZ);
            ifrcopy = *ifr;
            ioctl(sockfd, SIOCGIFFLAGS, &ifrcopy);
            
            if ((ifrcopy.ifr_flags & IFF_UP) == 0) continue;
            
            NSString *ip = [NSString  stringWithFormat:@"%s", inet_ntoa(((struct sockaddr_in *)&ifr->ifr_addr)->sin_addr)];
            [ips addObject:ip];
        }
    }
    
    close(sockfd);
    NSString *deviceIP = @"";
    
    for (int i=0; i < ips.count; i++) {
        if (ips.count > 0) {
            deviceIP = [NSString stringWithFormat:@"%@",ips.lastObject];
        }
    }
    return deviceIP;
}

///磁盘总容量
+ (CGFloat)diskTotalSize{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager respondsToSelector:@selector(attributesOfFileSystemForPath:error:)]) {
        NSDictionary *systemAttributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
        NSString *diskTotalSize = [systemAttributes objectForKey:@"NSFileSystemSize"];
        return [diskTotalSize floatValue]/1024/1024/1024;
    }else{
        return 0.0;
    }
}

///磁盘可用容量
+ (CGFloat)diskFreeSize{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if ([fileManager respondsToSelector:@selector(attributesOfFileSystemForPath:error:)]) {
        NSDictionary *systemAttributes = [fileManager attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
        NSString *diskTotalSize = [systemAttributes objectForKey:@"NSFileSystemFreeSize"];
        return [diskTotalSize floatValue]/1024/1024/1024;
    }else{
        return 0.0;
    }
}

@end
