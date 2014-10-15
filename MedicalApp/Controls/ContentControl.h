//
//  ContentControl.h
//  ChatApp
//
//  Created by lgf on 14-9-25.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
@interface ContentControl : UIViewController<CBDataRequestDelegate>
@property (nonatomic,strong)UIScrollView *contentView;
@property (nonatomic,strong)UILabel *titleLabel;
@end
