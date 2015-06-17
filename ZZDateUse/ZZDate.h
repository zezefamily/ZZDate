//
//  ZZDate.h
//  ZZDateUse
//
//  Created by zezefamily on 15/6/13.
//  Copyright (c) 2015年 zezefamily. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZZDate : NSObject

/**
 根据日期获取该日期所在月份的相关信息（更多API 请查阅 NSCalendar）
 @param date 传入的日期  传入nil 显示当前日期
 @return NSDateComponents 包含以下属性：
            年份 year
            月份 month
            日期 day
            小时 hour
            分钟 minute
            秒  second
            星期 weekday
            ......
*/
+ (NSDateComponents *)readTodayInfoWithDate:(NSDate *)date;



/**
 根据日期获取当前日期所在月份的天数
 @param date 传入的日期  传nil为当前日期
 @return NSInteger 天数
 */
+ (NSInteger)getMonthLengthWithDate:(NSDate *)date;



/**
 根据日期返回当前星期几
 @param date 传入的日期  传nil 默认为当前日期
 @return NSString 星期几字符串
 */
+ (NSString *)getWeekDayWithDate:(NSDate *)date;



/**
 将标准当前时间转化为时间戳
 @return NSString 时间戳
 */
+ (NSString *)changeNowTimeToTimeStampWithTime;



/**
 将时间戳转化为标准当前时间
 @param timeStamp 时间戳(double)
 @return 返回当前时间(NSDate)
 */
+ (NSDate *)changeTimeStampToNowTimeWithString:(double)timeStamp;



/**
 返回当前北京时间
 @return 返回时间(NSDate)
 */
+ (NSDate *)getLoctionTime;



/**
 根据北京时间获取时间
 @param secs (单位：秒)
 @return 返回时间(NSDate)
 */
+ (NSDate *)locateDateWithTimeInterValSinceNow:(NSTimeInterval)secs;



+ (NSString *)getTimsStrWithString:(NSString *)time;


@end
