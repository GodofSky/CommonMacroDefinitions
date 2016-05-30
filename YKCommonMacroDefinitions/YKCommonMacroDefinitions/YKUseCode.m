//
//  YKUseCode.m
//  常用的代码合集
//
//  Created by 凯 on 16/5/30.
//  Copyright © 2016年 凯. All rights reserved.
//

#import <Foundation/Foundation.h>


#pragma mark - 关于下载方面的常用宏

//沙盒 Document 文件位置
#define KDocumentPath   [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0]

// 缓存主目录
#define YKCachesDirectory [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"HSCache"]

// 保存文件名
#define YKFileName(url) [[url componentsSeparatedByString:@"/"] lastObject]


// 文件的存放路径（caches）
#define YKFileFullpath(url) [YKCachesDirectory stringByAppendingPathComponent:YKFileName(url)]

// 文件的已下载长度
#define YKDownloadLength(url) [[[NSFileManager defaultManager] attributesOfItemAtPath:YKFileFullpath(url) error:nil][NSFileSize] integerValue]

// 存储文件总长度的文件路径（caches）
#define YKTotalLengthFullpath [YKCachesDirectory stringByAppendingPathComponent:@"totalLength.plist"]



#pragma mark - 常用的宏定义
// 屏幕的高和宽
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

//系统
#define isIOS9 [[UIDevice currentDevice].systemVersion floatValue]>=9.0f
#define isIOS7 [[UIDevice currentDevice].systemVersion floatValue]>=7.0f
#define isIOS6 [[[UIDevice currentDevice] systemVersion] floatValue]>=6.0


//屏幕适配
#define isiPhone4 CGSizeEqualToSize(CGSizeMake(320, 480), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size)
#define isiPhone5 CGSizeEqualToSize(CGSizeMake(320, 568), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size)
#define isiPhone6 CGSizeEqualToSize(CGSizeMake(375, 667), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(750, 1334), [[UIScreen mainScreen] currentMode].size)
#define isiPhone6p CGSizeEqualToSize(CGSizeMake(621, 1104), [[UIScreen mainScreen] currentMode].size) || CGSizeEqualToSize(CGSizeMake(1242, 2208), [[UIScreen mainScreen] currentMode].size)


//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]


//获取当前语言
#define CurrentLanguage ([[NSLocale preferredLanguages] objectAtIndex:0])




//----------------------图片----------------------------
//读取本地图片
#define LOADIMAGE(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]

//定义UIImage对象
#define IMAGE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]

//定义UIImage对象
#define ImageNamed(_pointer) [UIImage imageNamed:[UIUtil imageName:_pointer]]

//建议使用前两种宏定义,性能高于后者


//----------------------颜色类---------------------------
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

//带有RGBA的颜色设置
#define COLOR(R, G, B, A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

// 获取RGB颜色
#define RGBA(r,g,b,a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r,g,b) RGBA(r,g,b,1.0f)

//背景色
#define BACKGROUND_COLOR [UIColor colorWithRed:242.0/255.0 green:236.0/255.0 blue:231.0/255.0 alpha:1.0]

//清除背景色
#define CLEARCOLOR [UIColor clearColor]





//DEBUG  模式下打印日志,当前行
#ifdef DEBUG
#   define DLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define DLog(...)
#endif


//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//DEBUG  模式下打印日志,当前行 并弹出一个警告
#ifdef DEBUG
#   define ULog(fmt, ...)  { UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"%s\n [Line %d] ", __PRETTY_FUNCTION__, __LINE__] message:[NSString stringWithFormat:fmt, ##__VA_ARGS__]  delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil]; [alert show]; }
#else
#   define ULog(...)
#endif


