/***************************
 功能：系统设置的一些宏定义
 备注：此处为了区分功能，只能添加与系统设备
 相关宏定义
 **************************/

#ifndef HaiTunJia_SystemMacro_h
#define HaiTunJia_SystemMacro_h

//判断iphone6p
#define iPhone6Plus ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242,2208), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iphone6
#define iPhone6 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(750,1334), [[UIScreen mainScreen] currentMode].size) : NO)

// 判断iPhone5
#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

//判断iphone4
#define iPhone4 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)

//空转换
#define StringIsNull(string)  {if((NSNull*)string == [NSNull null]){string = nil;}}

#define StringToNull(string)  {if(string && [string isEqualToString:@""]){string = nil;}}

#define NullToBank(string)  {if(((NSNull*)string == [NSNull null]) || !string){string = @"";}}


// 手机版本
#define SYSTEM_VERSION_NOLESS_THAN_7 [[UIDevice currentDevice].systemVersion floatValue] >= 7.0

//导航栏高度
#define CONTENT_NAVIGATIONBAR_HEIGHT 44

//底部tabbar 高度
#define CONTENT_TABBAR_HEIGHT 49

//英文状态下键盘的高度
#define ENGISH_KEYBOARD_HEIGHT 216

//屏幕宽度
#define kScreenWidth ([[UIScreen mainScreen]bounds].size.width)

//屏幕高度
#define kScreenHeight ([[UIScreen mainScreen]bounds].size.height)

//iPhone statusbar 高度
#define PHONE_STATUSBAR_HEIGHT  20

//导航栏高度
#define kNavigationBarHeight     64.0f

//iPhone 屏幕尺寸,已去掉status bar的高度
#define PHONE_SCREEN_SIZE  (CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT - PHONE_STATUSBAR_HEIGHT))

// 仅在调试模式下打印日志
#ifdef DEBUG
#define NSLog(...) NSLog(__VA_ARGS__)
#else
#define NSLog(...)
#endif


// 避免内存溢出警告
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)

// url转义字符
#define URL_PERCENT_ESCAPES @"!*'();:@&=+$,/?%#[]"


#endif
