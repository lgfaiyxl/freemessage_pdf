//
//  ContentControl.m
//  ChatApp
//
//  Created by lgf on 14-9-25.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import "ContentControl.h"
#import "UIBarButtonItem+LGFBarButtonItem.h"
#import "AppDelegate.h"
@interface ContentControl ()

@end

@implementation ContentControl
#pragma mark ---requestDelegate--

- (void)requestDataDidFinish:(RequestCenter *)dataRequest{
     ZNLog(@"=========%@",dataRequest.properties);  
}
-(void)requestDataDidFaild:(RequestCenter *)dataRequest{
    
}
-(void)goToBack{
    [self.navigationController popViewControllerAnimated:YES];
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    delegate.window.rootViewController = delegate.rootControl;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [RequestCenter shareDowloadManger].delegate = self;
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"top"] forBarPosition:UIBarPositionTopAttached barMetrics:UIBarMetricsDefault];
     self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"right" font:[UIFont systemFontOfSize:12] titleColor:[UIColor redColor]];
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"back"] selectedImage:[UIImage imageNamed:@"back"] target:self action:@selector(goToBack)];
    _contentView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _contentView.backgroundColor = [UIColor colorWithRed:235.0/255.0 green:235.0/255.0 blue:235.0/255.0 alpha:1];
    _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.text = self.title;
    _titleLabel.backgroundColor = [UIColor clearColor];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
     self.navigationItem.titleView = _titleLabel;
    [self.view addSubview:_contentView];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc{
    if (self.contentView) {
        [_contentView release];
        self.contentView = nil;
    }
    if (self.titleLabel) {
        [_titleLabel release];
        self.titleLabel = nil;
    }
    [super dealloc];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
