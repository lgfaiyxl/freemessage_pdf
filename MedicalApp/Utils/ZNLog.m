//
//  ZNLog.m
//  ChatApp
//
//  Created by lgf on 14-9-24.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import "ZNLog.h"

@implementation ZNLog
+ (void)file:(char*)sourceFile function:(char*)functionName lineNumber:(int)lineNumber format:(NSString*)format, ...
{
    
    
    va_list ap;
    NSString *print, *file, *function;
    va_start(ap,format);
    file = [[NSString alloc] initWithBytes: sourceFile length: strlen(sourceFile) encoding: NSUTF8StringEncoding];
    
    function = [NSString stringWithCString: functionName encoding:NSUTF8StringEncoding];
    print = [[NSString alloc] initWithFormat: format arguments: ap];
    va_end(ap);
    //NSLog(@"%@:%d %@; %@", [file lastPathComponent], lineNumber, function, print);
    //    printf("%s:%d %s; %s \n\n", [[file lastPathComponent] UTF8String], lineNumber, [function UTF8String], [print UTF8String]);
    
    printf("%s:%d %s \n\n", [[file lastPathComponent] UTF8String], lineNumber, [print UTF8String]);
    
    
    
}
@end
