//
//  PublicClass.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/22.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "PublicClass.h"

@implementation PublicClass
+(UIButton *)createButtonWithFrame:(CGRect)frame title:(NSString *)title titleColor:(UIColor *)titleColor normalImage:(UIImage *)image highlightedImage:(UIImage *)hlImage target:(id)target SEL:(SEL)method{

    UIButton *leftbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame = frame;
    [leftbtn setTitle:title forState:UIControlStateNormal];
    [leftbtn setTitleColor:titleColor forState:UIControlStateNormal];
    [leftbtn setBackgroundImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
    [leftbtn setImage:[hlImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateHighlighted];
    [leftbtn addTarget:target action:method forControlEvents:UIControlEventTouchUpInside];
    return leftbtn;
}

+(void)creatcelllab:(UILabel *)celllab celllabFont1:(CGFloat)celllabFont1 celllabFont2:(CGFloat)celllabFont2 celllabFont3:(CGFloat)celllabFont3{

    if (screen_Width == iphone4_width) {
        celllab.font = [UIFont systemFontOfSize:celllabFont1];
    }
    else if (screen_Width == iphone6_width){
    
        celllab.font = [UIFont systemFontOfSize:celllabFont2];
    }
    else{
    
        celllab.font = [UIFont systemFontOfSize:celllabFont3];
    }
}




@end
