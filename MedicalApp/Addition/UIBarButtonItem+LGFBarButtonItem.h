//
//  UIBarButtonItem+LGFBarButtonItem.h
//  ChatApp
//
//  Created by lgf on 14-9-24.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (LGFBarButtonItem)
- (id)initWithImage:(UIImage *)normalImage selectedImage:(UIImage *)selectImage target:(id)target action:(SEL)action;
- (id)initWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color;
- (id)initWithTitle:(NSString *)normalImage  target:(id)target action:(SEL)action;
- (id)initWithTitles:(NSString *)normalImage  target:(id)target action:(SEL)action;
@end
