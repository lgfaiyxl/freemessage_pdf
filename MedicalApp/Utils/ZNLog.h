//
//  ZNLog.h
//  ChatApp
//
//  Created by lgf on 14-9-24.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZNLog : NSObject
+(void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...;

#define ZNLog(s, ...) [ZNLog file:__FILE__ function: (char *)__FUNCTION__ lineNumber:__LINE__ format:(s),##__VA_ARGS__]


@end
