//
// Created by fengshuai on 13-6-25.
//
// To change the template use AppCode | Preferences | File Templates.
//

#import "NSDate+Additions.h"

@implementation NSDate (Additions)

/*
 * 获取时间戳字符串,按照产品需求拼出来
 */
- (NSString *)getTimeString
{
    NSString *title = nil;
    
    if([self compareWithToday] == 0)
    {
        // 如果是今天
        title = [NSString stringWithFormat:NSLocalizedString(@"%@",@"%@"), [self stringForTimelineWithFormat:@"hh:mm a"]];
    }
    else if([self compareWithToday] == -1)
    {
        // 如果是昨天
        title = [NSString stringWithString:NSLocalizedString(@"Yesterday", @"Yesterday")];
    }
    else if([self compareWithToday] <= -2 && [self compareWithThisWeek])
    {
        // 如果是同一个星期
//        title = [NSString stringWithFormat:@"%@",[self stringForTimelineWithFormat:@"EEEE"]];
        switch ([self getWeekDay]) {
            case 1:
                title = @"Sunday";
                break;
            case 2:
                title = @"Monday";
                break;
            case 3:
                title = @"TuesDay";
                break;
            case 4:
                title = @"Wednesday";
                break;
            case 5:
                title = @"Thursday";
                break;
            case 6:
                title = @"Friday";
                break;
            case 7:
                title = @"Saturday";
                break;
            default:
                break;
        }
    }
    else
    {
        title = [NSString stringWithFormat:@"%@",[self stringForTimelineWithFormat:@"MM/dd/yyyy"]];
    }
    return title;
}

- (NSString *)getTimeStringForComment
{
    NSString *title = nil;
    
    if([self compareWithToday] == 0)
    {
        // 如果是今天
        title = [NSString stringWithFormat:NSLocalizedString(@"%@",@"%@"), [self stringForTimelineWithFormat:@"hh:mm a"]];
    }
    else if([self compareWithToday] == -1)
    {
        // 如果是昨天
        title = [NSString stringWithFormat:NSLocalizedString(@"Yesterday %@", @"Yesterday %@"),[self stringForTimelineWithFormat:@"hh:mm a"]];
    }
    else
    {
        // 昨天以前
        title = [NSString stringWithFormat:@"%@",[self stringForTimelineWithFormat:@"MM/dd/yyyy hh:mm a"]];
    }
    return title;
}

/*
 * 与今天的时间做比较
 */
- (NSInteger) compareWithToday {
	
	
	NSDate *today = [NSDate date];
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"yyyy-MM-dd"];
	
	NSString *todayStr = [formatter stringFromDate:today];
	today = [formatter dateFromString:todayStr];
	
	NSInteger interval = (NSInteger) [self timeIntervalSinceDate:today];
	
	NSInteger intervalDate = 0;
	if (interval <= 0) {
		intervalDate = interval / (24 * 60 * 60) - 1;
	} else {
		intervalDate = interval / (24 * 60 * 60);
	}
	
	return intervalDate;
}

/*
 * 按给定格式返回时间字符串
 */
- (NSString *) stringForTimelineWithFormat:(NSString *)format
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:format];
	NSString *timeStr = [formatter stringFromDate:self];
	
	return timeStr;
}


- (BOOL)compareWithThisWeek
{
    NSDate *date = [NSDate date];
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit)
                       fromDate:date];
    NSInteger thisWeek = [comps week]; // 今年的第几周
    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit)
                       fromDate:self];
    NSInteger compareWeek = [comps week];
    
    return thisWeek == compareWeek;
}

- (int)getWeekDay
{
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSDateComponents *comps;
    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit)
                       fromDate:self];
    int weekDay = [comps weekday];
    return weekDay;
}

- (NSString*) stringForTimeline {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    NSString *timeStr = [formatter stringFromDate:self];
    return timeStr;
}

/**
 * 计算原时间与现在时间的相对差，以字符串形式返回
 */
- (NSString*) stringForTimeRelative {
    NSString *title = nil;

    int intervalSecond = -(int)[self timeIntervalSinceNow];
    int t = 0;

    // 手机时间慢于服务器的情况均视为刚刚发送(e.g mobile： 11:28, server: 11:30)
    if (intervalSecond < 0)
    {
        //title = @"刚刚更新";
        title = NSLocalizedString(@"刚刚发送", @"刚刚发送");
    } else if ((t = intervalSecond/(60*60*24)) != 0) {
        if (t > 2) {
            title = [self stringForTimeline];
        }else {
            title = [NSString stringWithFormat:NSLocalizedString(@"%d天前", @"%d天前") ,t];
        }
    } else if ((t = intervalSecond/(60*60)) != 0) {
        title = [NSString stringWithFormat:NSLocalizedString(@"%d小时前", @"%d小时前"),t];
    } else if ((t = intervalSecond/60) != 0) {
        title = [NSString stringWithFormat:NSLocalizedString(@"%d分钟前", @"%d分钟前"),t];
    } else {
        //title = @"刚刚更新";
        title = NSLocalizedString(@"刚刚发送", @"刚刚发送");
    }

    return title;
}

+(NSDate *)dateString:(NSString *)dstr formateString:(NSString *)formatestr localstr:(NSString *)local
{
    NSDateFormatter *dateformate= [[NSDateFormatter alloc]init];
    [dateformate setDateFormat:formatestr];
    [dateformate setLocale:[[NSLocale alloc]initWithLocaleIdentifier:local]];
    NSDate *date=[dateformate dateFromString:dstr];

    return date;
}
/**
 */

+(NSString *)obtainDate:(NSDate *)date formateString:(NSString *)formatestr{
    NSString *daterepresent=@"";
    NSDateFormatter *dateformate= [[NSDateFormatter alloc] init];
    [dateformate setDateFormat:formatestr];
    daterepresent=[dateformate stringFromDate:date];

    return daterepresent;
}

-(NSDate *)dateFormat:(NSDate *)date formateString:(NSString *)formatestr{

    NSDateFormatter *dateformate= [[NSDateFormatter alloc] init];
    [dateformate setDateFormat:formatestr];


    return nil;

}


+(NSInteger)computeDateDeviedDate:(NSDate *)begin to:(NSDate *)to{

    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    unsigned int unitFlags = NSDayCalendarUnit;
    NSDateComponents *comps = [gregorian components:unitFlags fromDate:begin  toDate:to  options:0];
    int days = [comps day];

    return days;

}

+(NSMutableArray *)getDateArrayFromDate:(NSDate *)begin to:(NSDate *)to{


    NSMutableArray *distantdate=[[NSMutableArray alloc] init];


    NSInteger  days=[NSDate computeDateDeviedDate:begin to:to];

    NSDate   *dateinfo=nil;


    int hours=24;

    [distantdate addObject:begin];

    for (int i=1;i<=days;i++) {

        dateinfo = [self getAfterHoursForCurrentDate:begin afteredHours:hours];

        [distantdate addObject:dateinfo];
        NSLog(@"日期直接输出=>>>> %@",dateinfo);
        NSLog(@"日期转化后==>>>> %@",[NSDate obtainDate:dateinfo formateString:@"yyyy-MM-dd k:mm"]);
        begin= dateinfo;

    }

    //[distantdate addObject:to];

    return distantdate;
}

+(NSString *)getCurrentTimeIntervalString{

    NSTimeInterval time = [[NSDate date] timeIntervalSince1970];

    long long dTime = [[NSNumber numberWithDouble:time] longLongValue]; // 将double转为long long型

    NSString *curTime = [NSString stringWithFormat:@"%llu",dTime]; // 输出long long型

    return curTime;
}

+ (NSDate *)dateFromString:(NSString *)dateString{

    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    //[dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    NSDate *destDate= [dateFormatter dateFromString:dateString];

    return destDate;

}

+(NSString *)formatDateYYYYMMdd:(NSDate *)date{

    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat: @"yyyy-MM-dd"];
    NSString* str = [formatter stringFromDate:date];
    return str;

}

+ (NSString *)formattedDateYYYYddHHmmss:(NSDate *)aDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSS"];
    return [dateFormatter stringFromDate:aDate];
}



+(NSInteger)getWeekDayFromDate:(NSDate *)date{

    NSCalendar*calendar = [NSCalendar currentCalendar];
    NSDateComponents*comps;
    comps =[calendar components:(NSWeekCalendarUnit | NSWeekdayCalendarUnit |NSWeekdayOrdinalCalendarUnit) fromDate:date];

    return [comps weekday];



}


//获取当前日期的前一天
+(NSDate *)getPreviousDateForCurrentDate:(NSDate *)date{

    NSDate *newDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([date timeIntervalSinceReferenceDate] - 24*3600)];

    return newDate;
}

//获取当前日期的指定时间前一天
+(NSDate *)getPreviousDateForCurrentDate:(NSDate *)date withPointTime:(NSString *)time{

    NSDate  *newdate=[self getPreviousDateForCurrentDate:date];

    NSString *newdatestr= [NSDate obtainDate:newdate formateString:@"yyyy-MM-dd"];

    NSString  *newdatetimestr=[NSString stringWithFormat:@"%@ %@",newdatestr,time];

    NSLog(@"日期转化前==>>>> %@",newdatetimestr);

    NSDate   *previousdatebyspecifictime=[NSDate  dateString:newdatetimestr formateString:DATE_FORMAT_CH_WITH_NOS_SEP localstr:@"zh_CN"];
    NSLog(@"日期直接输出=>>>> %@",previousdatebyspecifictime);
    NSLog(@"日期转化后==>>>> %@",[NSDate obtainDate:previousdatebyspecifictime formateString:@"yyyy-MM-dd k:mm"]);
    return previousdatebyspecifictime;
}

//取当前日期的前几个小时的时间
+(NSDate *)getPreviousHourForCurrentDate:(NSDate *)date previouseHour:(NSInteger)hour{

    NSDate *newDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([date timeIntervalSinceReferenceDate] - hour*3600)];

    return newDate;
}

//获取当前时候后的几个小时的时间
+(NSDate *)getAfterHoursForCurrentDate:(NSDate *)date afteredHours:(NSInteger)hour{


    NSDate *newDate = [[NSDate alloc] initWithTimeIntervalSinceReferenceDate:([date timeIntervalSinceReferenceDate] + hour*3600)];

    return newDate;
}

/**
 * day of week (narrow name)
 */
-(NSString *)dayOfWeek{
    NSDateFormatter *fmtter =[[NSDateFormatter alloc] init];
    [fmtter setLocale:[[NSLocale alloc] initWithLocaleIdentifier:@"en_US"]];
    [fmtter setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [fmtter setDateFormat:@"EEE"];
    return [fmtter stringFromDate:[NSDate date]];
}
/**
 * day of week type
 */
+(NSString *)dayOfWeekType:(NSDate *)date{
    NSInteger day = [NSDate getWeekDayFromDate:date];
    
    if (day == 2) {
        return DayOfWeekMon;
    }else if (day == 3) {
        return DayOfWeekTue;
    }else if (day == 4) {
        return DayOfWeekWed;
    }else if (day == 5) {
        return DayOfWeekThu;
    }else if (day == 6) {
        return DayOfWeekFri;
    }else if (day == 7) {
        return DayOfWeekSat;
    }else if (day == 1) {
        return DayOfWeekSun;
    }
    
    return DayOfWeekUnknown;
}
@end
