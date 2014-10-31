//
//  ViewController.m
//  NsDate
//
//  Created by Saurabh on 31/10/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSDate *currentDate = [NSDate date];
    
    //String From Current Date
    NSLog(@"StringFromDate %@ == %@",currentDate,[self stringFromDate:currentDate]);
    
    //Date From String
    NSString *dateString = @"25-10-2016";
    NSLog(@"Date From String %@ == %@",dateString,[self dateFromString:dateString]);
    
    //To get First Date Of Current Month
    NSLog(@"First Date Of Current Month is == %@",[self date]);
    
    //Get Day From Date
    NSLog(@"Today is %@",[self dayFromDate:currentDate]);
    
    //get Time in 12Hour Format
    NSLog(@"Current Time is %@",[self TwelveHourTimeFromDate:currentDate]);
    
    //Compare Date in Range
    NSDate *firstDate = [self dateFromString:@"20-05-2014"];
    NSDate *lastDate = [self dateFromString:@"01-11-2014"];
    NSLog(@"%d",[self isDate:currentDate inRangeFirstDate:firstDate lastDate:lastDate]);
    
    //Compare Date By string
    //This is Because we Get Date 2014-10-01 18:30:00 +0000 and if we compare date it compare date with time also
    //So we have to first convert it to String Containing only Date then Compare Two Dates
    NSDate *CmpDate = [NSDate date];
    NSString *strFirstDate = [self stringFromDate:firstDate];
    NSString *strCurrentDate = [self stringFromDate:currentDate];
    
    //Here Date Do not Match So You Get 0
    NSLog(@"%d",[self isDate:strCurrentDate isEqualToDate:strFirstDate]);
    
    //Here Date Matched So You Get 1
    NSLog(@"%d",[self isDate:strCurrentDate isEqualToDate:[self stringFromDate:CmpDate]]);
}
- (BOOL)isDate:(NSDate *)date inRangeFirstDate:(NSDate *)firstDate lastDate:(NSDate *)lastDate
{
    return [date compare:firstDate] == NSOrderedDescending &&
    [date compare:lastDate]  == NSOrderedAscending;
}
-(BOOL)isDate:(NSString*)currentDate isEqualToDate:(NSString*)date
{
    if([currentDate isEqualToString:date])
        return YES;
    else
        return NO;
}
-(NSString*)dayFromDate:(NSDate*)date
{
    NSDateFormatter *Formatter = [[NSDateFormatter alloc]init];
    Formatter.dateFormat = @"EEEE";
    NSString *strDay = [Formatter stringFromDate:date];
    return strDay;
}
-(NSDate*)date
{
    NSDate *today = [NSDate date];
    NSCalendar *gregorian = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    
    NSDateComponents *components = [gregorian components:(NSCalendarUnitEra | NSCalendarUnitYear | NSCalendarUnitMonth) fromDate:today];
    components.day = 2;
    NSDate *dayOneInCurrentMonth = [gregorian dateFromComponents:components];
    return dayOneInCurrentMonth;
}
-(NSDate*)dateFromString:(NSString*)strDate
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd-MM-yyyy";
    NSDate *DateFromString = [formatter dateFromString:strDate];
    return DateFromString;
}
-(NSString*)stringFromDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"dd-MM-yyyy";
    NSString *strDate = [formatter stringFromDate:date];
    return strDate;
}
-(NSString*)TwelveHourTimeFromDate:(NSDate*)date
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"HH:mm a";
    NSString *strTime = [formatter stringFromDate:date];
    return strTime;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
