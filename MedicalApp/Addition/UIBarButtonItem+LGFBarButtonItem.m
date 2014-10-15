//
//  UIBarButtonItem+LGFBarButtonItem.m
//  ChatApp
//
//  Created by lgf on 14-9-24.
//  Copyright (c) 2014年 lgf. All rights reserved.
//

#import "UIBarButtonItem+LGFBarButtonItem.h"

@implementation UIBarButtonItem(LGFBarButtonItem)

- (id)initWithImage:(UIImage *)normalImage selectedImage:(UIImage *)selectImage target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(0, 0, selectImage.size.width/2, selectImage.size.height/2);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:selectImage forState:UIControlStateHighlighted];
    self = [[UIBarButtonItem alloc] initWithCustomView:button];
    return  self;
}

- (id)initWithTitles:(NSString *)normalImage  target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    button.frame = CGRectMake(0, 0, 50, 25);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:normalImage forState:UIControlStateNormal];
    self = [[UIBarButtonItem alloc] initWithCustomView:button];
    return  self;
}
- (id)initWithTitle:(NSString *)normalImage  target:(id)target action:(SEL)action
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    button.frame = CGRectMake(0, 0, 30, 25);
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:normalImage forState:UIControlStateNormal];
    self =  [[UIBarButtonItem alloc] initWithCustomView:button];
    self.accessibilityFrame =  button.frame;
    return  self;
}
- (id)initWithTitle:(NSString *)title font:(UIFont *)font titleColor:(UIColor *)color
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 20)];
    label.text = title;
    label.font = font;
    label.textColor = color;
//    CGSize labelSize = [title sizeWithFont:font];
//    label.frame = CGRectMake(0, 0, labelSize.width, labelSize.height);
//    label.backgroundColor = [UIColor clearColor];
//    self =   [[UIBarButtonItem alloc] initWithCustomView:label];
    return self;
}

@end
