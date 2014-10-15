//
//  RequestCenter.m
//  MedicalApp
//
//  Created by lgf on 14-9-26.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import "RequestCenter.h"

@implementation RequestCenter
static RequestCenter *shareRequest;
-(id) init{
    if ((shareRequest = [super init])) {
        _properties = [[NSMutableDictionary alloc] init];
    }
    return shareRequest;
}
+(RequestCenter*)shareDowloadManger{
    @synchronized ([RequestCenter class]){
        if (shareRequest == nil) {
            shareRequest = [[RequestCenter alloc] init];
             return shareRequest;
        }
    }
    return shareRequest;
}
-(void)buildRequset:(NSDictionary *)dic url:(NSString *)idURL{
   
    [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] info:@"请求中。。" animated:YES];
     NSString *str = [NSString stringWithFormat:@"%@%@",baseURL,idURL];
     ZNLog(@"-----url---\n=======%@-%@-\n------%@",str,dic,shareRequest);
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:str]];
    request.delegate = shareRequest;
    [request setRequestMethod:@"POST"];
    for (NSString *temp in [dic allKeys]) {
        [request setPostValue:[dic objectForKey:temp] forKey:temp];
    }
    [request setTimeOutSeconds:20.0f];//5s超时
    [request setDidFinishSelector:@selector(requestFinished:)];
    [request setDidFailSelector:@selector(requestFailed:)];
    [request startAsynchronous];
}
- (void)requestFinished:(ASIFormDataRequest *)request{
    NSError *error;
    error = request.error;
    id responseJSON = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
     [_properties removeAllObjects];
     [_properties addEntriesFromDictionary:(NSDictionary *)responseJSON];
    if (shareRequest.delegate&&[shareRequest.delegate respondsToSelector:@selector(requestDataDidFinish:)]) {
        [shareRequest.delegate requestDataDidFinish:shareRequest];
    }
    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:YES];
    ZNLog(@"responseJSON-------%@",responseJSON);
}
- (void)requestFailed:(ASIFormDataRequest *)request{
    [MBProgressHUD hideHUDForView:[[UIApplication sharedApplication] keyWindow] animated:YES];
    NSString *str = @"网络错误";
    NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSError *error;
    error = request.error;
    id responseJSON = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    if (shareRequest.delegate&&[shareRequest.delegate respondsToSelector:@selector(requestDataDidFinish:)]) {
        [shareRequest.delegate requestDataDidFaild:shareRequest];
    }
    [MBProgressHUD showHUDAddedTo:[[UIApplication sharedApplication] keyWindow] info:@"网络错误" animated:YES hideTimes:1];
     ZNLog(@"responseJSON---网络错误----%@",responseJSON);
}

//登陆
/*
 *name：用户名
 *password：密码
 */
-(void)loginWith:(NSString*)name and:(NSString*)password{
    [shareRequest buildRequset:@{@"loginName": name,
                         @"loginPass": password,
                         } url:loginURL];
}


@end
