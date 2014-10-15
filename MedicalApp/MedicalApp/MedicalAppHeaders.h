//
//  MedicalAppHeaders.h
//  MedicalApp
//
//  Created by lgf on 14-9-26.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#ifndef MedicalApp_MedicalAppHeaders_h
#define MedicalApp_MedicalAppHeaders_h

//请求地址和方法。
#define baseURL @"http://1.93.3.253:8088/"
#define loginURL @"AdminManager/TrainInterface/UserLogin"


//获取屏幕的大小
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kStateBarHeight 20
#define kMainHeight (kScreenHeight - kStateBarHeight)
#define kMainWidth kScreenWidth

#define LabelTextColor [UIColor colorWithRed:90/255.0 green:90/255.0 blue:90/255.0 alpha:1]
#define TetilLabelTextColor [UIColor colorWithRed:60/255.0 green:60/255.0 blue:60/255.0 alpha:1]

#endif
