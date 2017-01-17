//
//  UIBarButtonItem+NaviToButton.m
//  Creative
//
//  Created by huahongbo on 15/12/30.
//  Copyright © 2015年 王文静. All rights reserved.
//

#import "UIBarButtonItem+NaviToButton.h"
#import "UIView+MJExtension.h"

@implementation UIBarButtonItem (NaviToButton)
+ (instancetype)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:image] forState:0];
//    [button sizeToFit];
    // 设置尺寸
    button.mj_size = CGSizeMake(25, 25);
    return [[self alloc] initWithCustomView:button];
}
+ (instancetype)itemWithTarget:(id)target action:(SEL)action title:(NSString *)title
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:title forState:0];
    button.mj_size = CGSizeMake(40, 40);
    button.titleLabel.font = [UIFont systemFontOfSize:17];
    return [[self alloc] initWithCustomView:button];
}
@end
