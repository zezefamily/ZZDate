//
//  ZZDate.m
//  ZZDateUse
//
//  Created by zezefamily on 15/6/13.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import "ZZDate.h"

@implementation ZZDate

+ (NSString *)getTimsStrWithString:(NSString *)time
{
    NSString *timeStr = nil;
    
    NSDateComponents *components = [ZZDate readTodayInfoWithDate:nil];
    if(components.month <10&&components.day < 10){
        
        timeStr = [NSString stringWithFormat:@"%ld0%ld0%ld%@00",components.year,components.month,components.day,time];
        
    }else if(components.month <10 &&components.day >=10){
        
        timeStr = [NSString stringWithFormat:@"%ld0%ld%ld%@00",components.year,components.month,components.day,time];
        
    }else if(components.month >10 &&components.day <10){
        
        timeStr = [NSString stringWithFormat:@"%ld%ld0%ld%@00",components.year,components.month,components.day,time];
    }else{
        
        timeStr = [NSString stringWithFormat:@"%ld%ld%ld%@00",components.year,components.month,components.day,time];
    }
    return timeStr;
}

+ (NSDateComponents *)readTodayInfoWithDate:(NSDate *)date
{
    NSDate *_date;
    if(date == nil){
        _date = [NSDate date];
    }else {
        _date = date;
    }
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    [calendar setLocale:locale];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond | NSCalendarUnitWeekOfMonth | kCFCalendarUnitWeekday | NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekOfYear fromDate:_date];
    
    return dateComponents;
}


+ (NSInteger)getMonthLengthWithDate:(NSDate *)date
{
    NSDate *_date;
    if(date == nil){
        _date = [NSDate date];
    }else {
        _date = date;
    }
    return [[NSCalendar currentCalendar] rangeOfUnit:NSCalendarUnitDay inUnit:NSCalendarUnitMonth forDate:_date].length;
}

+ (NSString *)getWeekDayWithDate:(NSDate *)date
{
    NSDate *_date;
    if(date == nil){
        _date = [NSDate date];
    }else{
        _date = date;
    }
    NSArray *weeks = @[@"",@"星期天",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六"];
    NSCalendar *calendar = [[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"zh"];
    [calendar setLocale:locale];
    NSDateComponents *dateComponents = [calendar components:NSCalendarUnitWeekday fromDate:_date];
    return weeks[dateComponents.weekday];
}

#pragma mark - 将 时间戳 转化 为标准当前时间 timeStamp
+ (NSDate *)changeTimeStampToNowTimeWithString:(double)timeStamp
{
    NSDate *comfromTimesp = [NSDate dateWithTimeIntervalSince1970:timeStamp];
    NSTimeZone *zone = [NSTimeZone timeZoneWithName:@"Asia/Beijing"];
    NSInteger interval = [zone secondsFromGMTForDate:comfromTimesp];
    
    NSDateFormatter *matter = [[NSDateFormatter alloc]init];
    [matter setTimeZone:zone];
    [matter dateFromString:@"yyyy-MM-dd HH:mm:ss"];
    [matter stringFromDate:comfromTimesp];
    
    NSDate *locateDate = [comfromTimesp dateByAddingTimeInterval:interval];
    
    return locateDate;
}
#pragma mark - 将 标准当前时间 ==> 时间戳
+ (NSString *)changeNowTimeToTimeStampWithTime
{
    NSDate *dateNow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:dateNow];
    NSDate *locateDate = [dateNow dateByAddingTimeInterval:interval];
    NSString *timeSp = [NSString stringWithFormat:@"%.0f",[locateDate timeIntervalSince1970]];
    return timeSp;
}



+ (NSDate *)getLoctionTime
{
    NSDate *dateNow = [NSDate date];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:dateNow];
    NSDate *locateDate = [dateNow dateByAddingTimeInterval:interval];
    return locateDate;
}


+ (NSDate *)locateDateWithTimeInterValSinceNow:(NSTimeInterval)secs
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:secs];
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
    NSDate *locateDate = [date dateByAddingTimeInterval:interval];
    return locateDate;
}


@end
