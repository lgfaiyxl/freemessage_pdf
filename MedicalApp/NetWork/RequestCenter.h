//
//  RequestCenter.h
//  MedicalApp
//
//  Created by lgf on 14-9-26.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
@class RequestCenter;
@protocol CBDataRequestDelegate <NSObject>
- (void)requestDataDidFinish:(RequestCenter *)dataRequest;
- (void)requestDataDidFaild:(RequestCenter *)dataRequest;
@end


@interface RequestCenter : NSObject<ASIHTTPRequestDelegate>
@property (nonatomic, strong) NSObject <CBDataRequestDelegate> *delegate;
@property (nonatomic, strong) NSMutableDictionary *properties;
-(void)loginWith:(NSString*)name and:(NSString*)password;
+(RequestCenter*)shareDowloadManger;
@end
