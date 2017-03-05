//
//  LCDateHelper.h
//
//  Created by nhz on 16/6/12.
//

#import <Foundation/Foundation.h>

#define kLCWeekDay @"weekday"
#define kLCMonth    @"month"
#define kLCDay      @"day"
#define kLCHour     @"hour"
#define kLCMinute   @"mimute"
#define kLCSecond   @"sec"
#define kLCYear     @"year"

/**
 *  今天 明天 还是昨天
 */
#define kLCWhich @"which"

@interface LCDateHelper : NSObject

+(NSDictionary *)dateMessageForDate:(NSDate *)date;

+(NSDictionary *)intervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate;

+ (NSDictionary *)intervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate flags:(NSCalendarUnit) flags;

+ (NSDictionary *)intervalFromTodayToDate:(NSDate *)toDate;

+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate;

+ (NSDate *)beginningTimeOfDate:(NSDate *)date;


+ (NSDate *)endingTimeOfDate:(NSDate *)date;

@end
