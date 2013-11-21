//
//  CommonUtility.h
//  MangaBook
//
//  Created by Ryou Zhang on 7/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

@interface CommonUtility : NSObject
+(NSString*)urlEncodedString:(NSString*)sourceText;
+(NSString*)urlDecodingString:(NSString*)sourceText;
+(NSMutableDictionary*)parserQueryText:(NSString*)queryText;

+(NSString*)generateMD5Key:(NSString*)sourceText;

+(void)signatureParams:(NSMutableDictionary*)params;

+(NSString*)generateHost:(NSString*)host
            RelativePath:(NSString*)relativePath
               QueryText:(NSDictionary*)params;


+(NSData*)generatePostBody:(NSDictionary*)params;

/**
 字符串格式日期转换成NSDate
 @param httpDate    字符串格式日期
 @param NSDate对象
 */
+ (NSDate *)stringToDate:(NSString *)httpDate;

+ (NSString *)dateWithWeekDay:(NSDate *)date;

+ (NSString *)dateToString:(NSDate *)date;
@end
