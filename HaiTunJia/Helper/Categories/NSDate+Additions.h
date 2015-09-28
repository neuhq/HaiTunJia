//
// Created by fengshuai on 13-6-25.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import <Foundation/Foundation.h>

#define DATE_FORMAT_EN_US_CST @"EEE MMM dd HH:mm:ss 'CST' yyyy"

#define LOCAL_REPRESENT_EN_US @"en_US"

#define DATE_FORMAT_CH_WITHOUT_SEP @"yyyyMMddKmmss"

#define DATE_FORMAT_CH_WITH_SEP @"yyyy-MM-dd K:mm:ss"

#define DATE_FORMAT_CH_WITH_CHN @"yyyy年MM月dd日 K:mm:ss"

#define DATE_FORMAT_CH_WITH_CHN_NOTIME @"yyyy年MM月dd日"

#define DATE_FORMAT_CH_WITH_SEP_NOTIME @"yyyy-MM-dd"

#define DATE_FORMAT_CH_WITH_SEP_NOSEC @"yyyy-MM-dd HH:mm"

#define DATE_FORMAT_CH_WITH_NOS_SEP @"yyyy-MM-dd k:mm"

#define DayOfWeekUnknown @"未知"
#define DayOfWeekMon @"周一"
#define DayOfWeekTue @"周二"
#define DayOfWeekWed @"周三"
#define DayOfWeekThu @"周四"
#define DayOfWeekFri @"周五"
#define DayOfWeekSat @"周六"
#define DayOfWeekSun @"周日"

@interface NSDate (Additions)

- (NSString *)getTimeString;

- (NSString *)getTimeStringForComment;

- (NSInteger) compareWithToday;

- (NSString *) stringForTimeline; //将时间变为 mm-dd HH:mm

- (NSString *) stringForTimeRelative;//计算原时间与现在时间的相对差，以字符串形式返回


//获取nsdate对象
+(NSDate *)dateString:(NSString *)dstr formateString:(NSString *)formatestr localstr:(NSString *)local;
//获取字符串表示
+(NSString *)obtainDate:(NSDate *)date formateString:(NSString*)formatestr;

//求begin 到 to的天数
+(NSInteger)computeDateDeviedDate:(NSDate *)begin to:(NSDate *)to;

//
+(NSString *)getCurrentTimeIntervalString;

+(NSDate *)dateFromString:(NSString *)dateString;

+(NSString *)formatDateYYYYMMdd:(NSDate *)date;

+ (NSString *)formattedDateYYYYddHHmmss:(NSDate *)aDate;


//获得当前是星期几
+(NSInteger)getWeekDayFromDate:(NSDate *)date;

//获取当前日期的前一天
+(NSDate *)getPreviousDateForCurrentDate:(NSDate *)date;

//取当前日期的前几个小时的时间
+(NSDate *)getPreviousHourForCurrentDate:(NSDate *)date previouseHour:(NSInteger)hour;

//获取当前日期的指定时间前一天
+(NSDate *)getPreviousDateForCurrentDate:(NSDate *)date withPointTime:(NSString *)time;

//获取当前时候后的几个小时的时间
+(NSDate *)getAfterHoursForCurrentDate:(NSDate *)date afteredHours:(NSInteger)hour;

//取出两个日期相隔的日期数组，包含开始和结束
+(NSMutableArray *)getDateArrayFromDate:(NSDate *)begin to:(NSDate *)to;

-(NSString *)dayOfWeek;

//获取当天星期几
+(NSString *)dayOfWeekType:(NSDate *)date;
@end
