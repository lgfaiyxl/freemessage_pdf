//
//  FirstControl.m
//  MedicalApp
//
//  Created by lgf on 14-9-26.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import "FirstControl.h"
#import "ReaderDocument.h"
#import "ReaderViewController.h"
@interface FirstControl ()<ReaderViewControllerDelegate>{
    
}
@end

@implementation FirstControl
- (void)dismissReaderViewController:(ReaderViewController *)viewController{
    
}
- (void)requestDataDidFinish:(RequestCenter *)dataRequest{
    [super requestDataDidFinish:dataRequest];
    ZNLog(@"-----------%@",dataRequest.properties);
}
-(void)buttonAction{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"雪卡露莎集合店各品牌介绍+系列搭配-art ponit SO0903" ofType:@"pdf"];
    ZNLog(@"------%@",filePath);
    NSString *phrase = nil;
    ReaderDocument *document = [ReaderDocument withDocumentFilePath:filePath password:phrase];
    if (document != nil){
        ReaderViewController *readerViewController = [[ReaderViewController alloc] initWithReaderDocument:document];
        readerViewController.bookTitle = @"bookName";
        readerViewController.urlEpub = filePath;
        readerViewController.delegate = self; // Set the ReaderViewController delegate to self
        [self.navigationController pushViewController:readerViewController animated:YES];
    }
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //[[RequestCenter shareDowloadManger] loginWith:@"lgf" and:@"123456"];
    
    UIButton *butt = [UIButton buttonWithType:0];
    butt.backgroundColor = [UIColor grayColor];
    butt.frame = CGRectMake(self.view.width/2-150, 20, 300, 50);
    [butt addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [butt setTitle:@"雪卡露莎集合店各品牌介绍+系列搭配" forState:UIControlStateNormal];
    [self.view addSubview:butt];
 
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
