//
//  ViewController.m
//  MedicalApp
//
//  Created by lgf on 14-9-26.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import "ViewController.h"
#import "FirstControl.h"
#import "SecondControl.h"
#import "ThirdControl.h"
#import "FourthControl.h"
#import "AppDelegate.h"
#import "RegViewController.h"
#import "ReaderDocument.h"
#import "ReaderViewController.h"
#import "SectionsViewControllerFriends.h"
@interface ViewController ()<ReaderViewControllerDelegate>{
    
}

@end

@implementation ViewController

-(void)buttonClick:(UIButton *)sender{
    switch (sender.tag) {
        case 1:
        {
            
            
            
                            FirstControl *firstCotrol = [[[FirstControl alloc] init] autorelease];
                            UINavigationController *firstControlNav = [[UINavigationController alloc] initWithRootViewController:firstCotrol] ;
                            firstCotrol.title = @"历史名人";
                            AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
                            delegate.window.rootViewController = firstControlNav;
        }
        
            break;
        case 2:
        {
            SecondControl *secondCotrol = [[[SecondControl alloc] init] autorelease];
            UINavigationController *secondControlNav = [[UINavigationController alloc] initWithRootViewController:secondCotrol];
            secondCotrol.title = @"历史沿革";
            AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            delegate.window.rootViewController = secondControlNav;
        }
            break;
        case 3:
        {
            ThirdControl *theirdCotrol = [[[ThirdControl alloc] init] autorelease];
            UINavigationController *theirdControlNav = [[UINavigationController alloc] initWithRootViewController:theirdCotrol];
            theirdCotrol.title = @"文化遗产";
            AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            delegate.window.rootViewController = theirdControlNav;
        }
            break;
        case 4:
        {
            FourthControl *fourthCotrol = [[[FourthControl alloc] init] autorelease];
            UINavigationController *fourthControlNav = [[UINavigationController alloc] initWithRootViewController:fourthCotrol];
            fourthCotrol.title = @"饮食文化";
            AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
            delegate.window.rootViewController = fourthControlNav;
        }
            break;
            
        default:
            break;
    }
}

-(void)registerUser{
    
    RegViewController* reg=[[RegViewController alloc] init];
    [self presentViewController:reg animated:YES completion:nil];
    ZNLog(@"-------shoew");
}

-(void)getAddressBookFriends {
    
    NSLog(@"show my friends");
//    [_testView setNumber:0];
//    
//    SectionsViewControllerFriends* friends=[[SectionsViewControllerFriends alloc] init];
//    _friendsController=friends;
//    
//    [_friendsController setMyBlock:_friendsBlock];
//    
//    [SMS_MBProgressHUD showMessag:@"正在加载中..." toView:self.view];
//    
//    [SMS_SDK getAppContactFriends:1 result:^(enum SMS_ResponseState state, NSArray *array) {
//        if (1==state)
//        {
//            NSLog(@"block 获取好友列表成功");
//            
//            [_friendsController setMyData:array];
//            [self presentViewController:_friendsController animated:YES completion:^{
//                ;
//            }];
//        }
//        else if(0==state)
//        {
//            NSLog(@"block 获取好友列表失败");
//        }
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
      // Do any additional setup after loading the view, typically from a nib.
    UIImageView *imgBg = [[UIImageView alloc] initWithFrame:self.view.frame];
    imgBg.image = [UIImage imageNamed:@"backgoundView_loginDetail"];
    [self.view addSubview:imgBg];
    [imgBg release];
    
    CGRect theFrame =  CGRectMake(50, 160, 120, 120);
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.frame = theFrame;
    [button1 setImage:[UIImage imageNamed:@"历史名人.png"] forState:UIControlStateNormal];
    button1.tag = 1;
    [button1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    theFrame.origin.x +=150;
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.frame = theFrame;
    [button2 setImage:[UIImage imageNamed:@"历史沿革.png"] forState:UIControlStateNormal];
    button2.tag = 2;
    [button2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    theFrame.origin.y +=150; theFrame.origin.x -=150;
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.frame = theFrame;
    [button3 setImage:[UIImage imageNamed:@"文化遗产.png"] forState:UIControlStateNormal];
    button3.tag = 3;
    [button3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    theFrame.origin.x +=150;
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.frame = theFrame;
    [button4 setImage:[UIImage imageNamed:@"饮食文化.png"] forState:UIControlStateNormal];
    button4.tag =4;
    [button4 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    [self registerUser];
}
-(void)dealloc{
    [super dealloc];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
