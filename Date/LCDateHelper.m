//
//  LCDateHelper.m
//
//  Created by nhz on 16/6/12.
//

#import "LCDateHelper.h"


/*
 [param setObject:[NSNumber numberWithInteger:month] forKey:@"month"];
 [param setObject:[NSNumber numberWithInteger:day] forKey:@"day"];
 [param setObject:[NSNumber numberWithInteger:weekday] forKey:@"weekday"];
 [param setObject:[NSNumber numberWithInteger:hour] forKey:@"hour"];
 [param setObject:[NSNumber numberWithInteger:min] forKey:@"min"];
 [param setObject:[NSNumber numberWithInteger:sec] forKey:@"sec"];
 */




@implementation LCDateHelper

+(NSDictionary *)dateMessageForDate:(NSDate *)date{
//    NSDate* now = [NSDate date];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    //    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    //    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    //    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    //    NSDate* date = [calendar dateFromComponents:comps];
    NSDateComponents *comps = [calendar components:unitFlags fromDate:date];
    
    NSInteger month = [comps month];
    NSInteger day = [comps day];
    
    //    Sunday:1, Monday:2, Tuesday:3, Wednesday:4, Friday:5, Saturday:6
    NSInteger weekday = [comps weekday];
//    NSInteger weekdayOrdinal = [comps weekdayOrdinal];
    NSInteger hour = [comps hour];
    NSInteger min = [comps minute];
    NSInteger sec = [comps second];
    NSInteger year = [comps year];
    
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    
//    [param setObject:[NSNumber numberWithInteger:month] forKey:@"month"];
//    [param setObject:[NSNumber numberWithInteger:day] forKey:@"day"];
//    [param setObject:[NSNumber numberWithInteger:weekday] forKey:@"weekday"];
//    [param setObject:[NSNumber numberWithInteger:hour] forKey:@"hour"];
//    [param setObject:[NSNumber numberWithInteger:min] forKey:@"min"];
//    [param setObject:[NSNumber numberWithInteger:sec] forKey:@"sec"];
    
    [param setObject:[NSNumber numberWithInteger:year] forKey:kLCYear];
    [param setObject:[NSNumber numberWithInteger:month] forKey:kLCMonth];
    [param setObject:[NSNumber numberWithInteger:day] forKey:kLCDay];
//    [param setObject:[NSNumber numberWithInteger:weekday] forKey:kLCWeekDay];
    
    switch (weekday) {
        case 1:
            [param setObject:@"星期日" forKey:kLCWeekDay];
            break;
        case 2:
            [param setObject:@"星期一" forKey:kLCWeekDay];

            break;
        case 3:
            [param setObject:@"星期二" forKey:kLCWeekDay];

            break;
        case 4:
            [param setObject:@"星期三" forKey:kLCWeekDay];

            break;
        case 5:
            [param setObject:@"星期四" forKey:kLCWeekDay];

            break;
        case 6:
            [param setObject:@"星期五" forKey:kLCWeekDay];

            break;
        case 7:
            [param setObject:@"星期六" forKey:kLCWeekDay];

            break;
            
        default:
            break;
    }
    [param setObject:[NSNumber numberWithInteger:hour] forKey:kLCHour];
    [param setObject:[NSNumber numberWithInteger:min] forKey:kLCMinute];
    [param setObject:[NSNumber numberWithInteger:sec] forKey:kLCSecond];
    
    return param;
    
}
+ (NSDictionary *)intervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate flags:(NSCalendarUnit) flags{
    //计算距离某个时间还有多少时间
    //    NSDate* toDate   = [[NSDate alloc] initWithString:@"2012-9-29 0:0:00 +0600" ];
    //    NSDate*  startDate  = [[ NSDate alloc] init ];
    //    NSCalendar* chineseClendar = [[ NSCalendar alloc ] initWithCalendarIdentifier:NSGregorianCalendar ];
    //    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
    //    NSCalendar* chineseClendar = [[ NSCalendar alloc ] initWithCalendarIdentifier:NSCalendarIdentifierGregorian ];
    
    NSCalendar* chineseClendar = [[ NSCalendar alloc ] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    NSDateComponents *cps = [chineseClendar components:flags fromDate:fromDate  toDate:toDate  options:0];
    NSInteger diffHour = [cps hour];
    NSInteger diffMin    = [cps minute];
    NSInteger diffSec   = [cps second];
    NSInteger diffDay   = [cps day];
    NSInteger diffMon  = [cps month];
    NSInteger diffYear = [cps year];
    
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    [param setObject:[NSNumber numberWithInteger:diffMon] forKey:kLCMonth];
    [param setObject:[NSNumber numberWithInteger:diffDay] forKey:kLCDay];
    
    
    
    [param setObject:[NSNumber numberWithInteger:diffHour] forKey:kLCHour];
    [param setObject:[NSNumber numberWithInteger:diffMin] forKey:kLCMinute];
    [param setObject:[NSNumber numberWithInteger:diffSec] forKey:kLCSecond];
    
    return param;
}
+ (NSDictionary *)intervalFromDate:(NSDate *)fromDate toDate:(NSDate *)toDate{
    //计算距离某个时间还有多少时间
//    NSDate* toDate   = [[NSDate alloc] initWithString:@"2012-9-29 0:0:00 +0600" ];
//    NSDate*  startDate  = [[ NSDate alloc] init ];
//    NSCalendar* chineseClendar = [[ NSCalendar alloc ] initWithCalendarIdentifier:NSGregorianCalendar ];
//    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit | NSDayCalendarUnit | NSMonthCalendarUnit | NSYearCalendarUnit;
//    NSCalendar* chineseClendar = [[ NSCalendar alloc ] initWithCalendarIdentifier:NSCalendarIdentifierGregorian ];
    NSCalendar* chineseClendar = [[ NSCalendar alloc ] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    
    NSDateComponents *cps = [chineseClendar components:unitFlags fromDate:fromDate  toDate:toDate  options:0];
    NSInteger diffHour = [cps hour];
    NSInteger diffMin    = [cps minute];
    NSInteger diffSec   = [cps second];
    NSInteger diffDay   = [cps day];
    NSInteger diffMon  = [cps month];
    NSInteger diffYear = [cps year];
    
    NSMutableDictionary * param = [NSMutableDictionary dictionary];
    [param setObject:[NSNumber numberWithInteger:diffMon] forKey:kLCMonth];
    [param setObject:[NSNumber numberWithInteger:diffDay] forKey:kLCDay];
    
    
    
    [param setObject:[NSNumber numberWithInteger:diffHour] forKey:kLCHour];
    [param setObject:[NSNumber numberWithInteger:diffMin] forKey:kLCMinute];
    [param setObject:[NSNumber numberWithInteger:diffSec] forKey:kLCSecond];
    
    return param;
    
}

+ (NSDictionary *)intervalFromTodayToDate:(NSDate *)toDate{
    
    NSMutableDictionary * param = (NSMutableDictionary *)[self intervalFromDate:[NSDate date] toDate:toDate];
    
    NSInteger diffDay = [param[kLCDay] integerValue];
    NSInteger diffHour = [param[kLCHour] integerValue];
    NSInteger diffMonth = [param[kLCMonth] integerValue];
    NSInteger diffYear = [param[kLCYear] integerValue];
    
    
    
    if (diffDay == 0){
        if (diffHour > 3) {
            [param setObject:@"明天" forKey:kLCWhich];
        }else{
            [param setObject:@"今天" forKey:kLCWhich];
        }

    } else if (diffDay > 0) {
        switch (diffDay) {
            case 1:
                [param setObject:@"后天" forKey:kLCWhich];
                
                break;
//            case 2:
//                [param setObject:@"后天" forKey:kLCWhich];
                
//                break;
            default:
                [param setObject:[NSString stringWithFormat: @"%d 天后", diffDay + 1] forKey:kLCWhich];
                break;
        }
    }else if (diffDay < 0){
        switch (diffDay) {
            case -1:
                [param setObject:@"昨天" forKey:kLCWhich];
                break;
            case -2:
                [param setObject:@"前天" forKey:kLCWhich];
                break;
            default:
                [param setObject:[NSString stringWithFormat: @"%ld 天前", (long)-diffDay] forKey:kLCWhich];
                break;
        }
    }
    
    return param;
}
+ (NSDate *)getNowDateFromatAnDate:(NSDate *)anyDate
{
    NSTimeZone* sourceTimeZone = [NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    NSTimeZone* destinationTimeZone = [NSTimeZone localTimeZone];
    NSInteger sourceGMTOffset = [sourceTimeZone secondsFromGMTForDate:anyDate];
    NSInteger destinationGMTOffset = [destinationTimeZone secondsFromGMTForDate:anyDate];
    NSTimeInterval interval = destinationGMTOffset - sourceGMTOffset;
    NSDate* destinationDateNow = [[NSDate alloc] initWithTimeInterval:interval sinceDate:anyDate];
    return destinationDateNow;
}

//-(void)compareDay{
//    NSDate* now = [NSDate date];
//    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
//    
//    NSInteger unitFlags = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitWeekday | NSCalendarUnitWeekdayOrdinal | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
//
//    NSDateComponents *comps = [calendar components:unitFlags fromDate:now];
//    
//    NSInteger month = [comps month];
//    NSInteger day = [comps day];
//    
//    NSInteger weekday = [comps weekday];
//    NSInteger hour = [comps hour];
//    NSInteger min = [comps minute];
//    NSInteger sec = [comps second];
//    NSInteger year = [comps year];
//}

+ (NSDate *)beginningTimeOfDate:(NSDate *)date{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd 00:00:00";
    NSString * todayStr = [formatter stringFromDate:date];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    date = [formatter dateFromString:todayStr];
    return date;
}
+ (NSDate *)endingTimeOfDate:(NSDate *)date{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyy-MM-dd 23:59:59";
    NSString * todayStr = [formatter stringFromDate:date];
    formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    date = [formatter dateFromString:todayStr];
    return date;
}

@end
