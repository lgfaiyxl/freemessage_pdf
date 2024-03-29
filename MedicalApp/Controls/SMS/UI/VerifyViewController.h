//
//  VerifyViewController.h
//  SMS_SDKDemo
//
//  Created by admin on 14-6-4.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SMS_SDK/SMS_UserInfo.h"

@interface VerifyViewController : UIViewController <UIAlertViewDelegate>

@property(nonatomic,strong)  UILabel* telLabel;

@property(nonatomic,strong)  UITextField* verifyCodeField;

@property(nonatomic,strong)  UILabel* timeLabel;

@property(nonatomic,strong)  UIButton* repeatSMSBtn;

@property(nonatomic,strong)  UIButton* submitBtn;
@property (nonatomic,copy)   NSString  *phoneNum;
//-(NSString*)setString:(NSString*) str;

-(void)setPhone:(NSString*)phone AndAreaCode:(NSString*)areaCode;

-(void)submit;

-(void)CannotGetSMS;

@property(nonatomic,assign) NSString* isVerify;

@end
