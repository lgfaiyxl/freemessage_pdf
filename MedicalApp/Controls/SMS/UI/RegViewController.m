//
//  RegViewController.m
//  SMS_SDKDemo
//
//  Created by admin on 14-6-4.
//  Copyright (c) 2014年 admin. All rights reserved.
//

#import "RegViewController.h"
#import "VerifyViewController.h"
#import "SMS_SDK/SMS_SDK.h"
#import "SMS_SDK/CountryAndAreaCode.h"
#import "SectionsViewController.h"

@interface RegViewController ()
{
    CountryAndAreaCode* _data2;
    NSString* _str;
    NSMutableData* _data;
    int _state;
    NSString* _localPhoneNumber;
    NSString* _localZoneNumber;
    
    NSString* _appKey;
    NSString* _duid;
    
    NSString* _token;
    
    NSString* _appSecret;
    
    NSMutableArray* _areaArray;
    
    NSString* _defaultCode;
    NSString* _defaultCountryName;
}

@end

@implementation RegViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)clickLeftButton
{
    [self dismissViewControllerAnimated:YES completion:^{
        _window.hidden=YES;
    }];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    //不允许用户输入 国家码
    if (textField==_areaCodeField) {
        [self.view endEditing:YES];
    }
    NSLog(@"textFieldDidBeginEditing");
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    return YES;
}

#pragma mark - SecondViewControllerDelegate的方法
- (void)setSecondData:(CountryAndAreaCode *)data {
    _data2=data;
    NSLog(@"从Second传过来的数据：%@,%@", data.areaCode,data.countryName);
    //self.areaCodeField.text=data.areaCode;
    self.areaCodeField.text=[NSString stringWithFormat:@"+%@",data.areaCode];
    [self.tableView reloadData];
}

-(void)nextStep
{
    
    if (self.telField.text.length!=11) {
        //手机号码不正确
        UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil) message:NSLocalizedString(@"errorphonenumber", nil) delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil) otherButtonTitles:nil, nil];
        [alert show];
        return;
    }
 
    
    NSString* str=[NSString stringWithFormat:@"%@:%@ %@",NSLocalizedString(@"willsendthecodeto", nil),self.areaCodeField.text,self.telField.text];
    _str=[NSString stringWithFormat:@"%@",self.telField.text];
    UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"surephonenumber", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"cancel", nil) otherButtonTitles:NSLocalizedString(@"sure", nil), nil];
    [alert show];
}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (1==buttonIndex)
    {
        NSLog(@"点击了确定按钮");
        VerifyViewController* verify=[[VerifyViewController alloc] init];
        NSString* str2=[self.areaCodeField.text stringByReplacingOccurrencesOfString:@"+" withString:@""];
        [verify setPhone:self.telField.text AndAreaCode:str2];
         verify.phoneNum = self.telField.text;
        [SMS_SDK getVerifyCodeByPhoneNumber:self.telField.text AndZone:str2 result:^(enum SMS_GetVerifyCodeResponseState state) {
            if (1==state) {
                NSLog(@"block 获取验证码成功");
                
                [self.navigationController pushViewController:verify animated:YES];
                
            }
            else if(0==state)
            {
                NSLog(@"block 获取验证码失败");
                NSString* str=[NSString stringWithFormat:NSLocalizedString(@"codesenderrormsg", nil)];
                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil) otherButtonTitles:nil, nil];
                [alert show];
            }
            else if (SMS_ResponseStateMaxVerifyCode==state)
            {
                NSString* str=[NSString stringWithFormat:NSLocalizedString(@"maxcodemsg", nil)];
                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"maxcode", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil) otherButtonTitles:nil, nil];
                [alert show];
            }
            else if(SMS_ResponseStateGetVerifyCodeTooOften==state)
            {
                NSString* str=[NSString stringWithFormat:NSLocalizedString(@"codetoooftenmsg", nil)];
                UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"notice", nil) message:str delegate:self cancelButtonTitle:NSLocalizedString(@"sure", nil) otherButtonTitles:nil, nil];
                [alert show];
            }
        }];
    }
    if (0==buttonIndex) {
        NSLog(@"点击了取消按钮");
    }
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
    
    UILabel* label=[[UILabel alloc] init];
    label.frame=CGRectMake(self.view.width/2-100, 10, 200, 21);
    label.text=[NSString stringWithFormat:NSLocalizedString(@"labelnotice", nil)];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont fontWithName:@"Helvetica" size:16];
    label.textColor=[UIColor darkGrayColor];
    [self.view addSubview:label];
    
    UITextField* areaCodeField=[[UITextField alloc] init];
    areaCodeField.frame=CGRectMake(self.view.width/2-130, 41, 60, 35);
    areaCodeField.borderStyle=UITextBorderStyleBezel;
    areaCodeField.text=[NSString stringWithFormat:@"+86"];
    areaCodeField.textAlignment=NSTextAlignmentCenter;
    areaCodeField.font=[UIFont fontWithName:@"Helvetica" size:18];
    areaCodeField.keyboardType=UIKeyboardTypePhonePad;
    [self.view addSubview:areaCodeField];
    
    UITextField* telField=[[UITextField alloc] init];
    telField.frame=CGRectMake(areaCodeField.right+4, 41, 200, 35);
    telField.borderStyle=UITextBorderStyleBezel;
    telField.placeholder=NSLocalizedString(@"telfield", nil);
    telField.text = @"15503468144";
    telField.keyboardType=UIKeyboardTypePhonePad;
    telField.clearButtonMode=UITextFieldViewModeWhileEditing;
    [self.view addSubview:telField];
    
    UIButton* nextBtn=[UIButton buttonWithType:UIButtonTypeSystem];
    [nextBtn setTitle:NSLocalizedString(@"nextbtn", nil) forState:UIControlStateNormal];
    NSString *icon = [NSString stringWithFormat:@"smssdk.bundle/button4.png"];
    [nextBtn setBackgroundImage:[UIImage imageNamed:icon] forState:UIControlStateNormal];
    nextBtn.frame=CGRectMake(self.view.width/2-130, 86, 260, 42);
    [nextBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [nextBtn addTarget:self action:@selector(nextStep) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextBtn];
    
    
    _telField=telField;
    
    _areaCodeField=areaCodeField;
    
    
    self.areaCodeField.delegate=self;
    self.telField.delegate=self;
    
    _areaArray=[NSMutableArray array];
   
    
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
