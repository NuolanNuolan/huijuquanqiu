//
//  CategoryLabel_pub.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/7/13.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "CategoryLabel_pub.h"
@interface CategoryLabel_pub ()
@property (strong, nonatomic) UIView *lineView;
@end
@implementation CategoryLabel_pub

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:13];
        self.userInteractionEnabled = YES;
        self.scale = 0.0;
        self.lineView = [[UIView alloc]init];
        [self.lineView setBackgroundColor:[UIColor clearColor]];
        [self addSubview:self.lineView];
    }
    return self;
}

- (void)setScale:(CGFloat)scale
{
    _scale = scale;
    self.textColor = [UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:1];
    [[self.subviews lastObject] setBackgroundColor:[UIColor colorWithRed:scale green:0.0 blue:0.0 alpha:scale]];
    //改变字体大小，缩放效果
    CGFloat minScale = 1.1;
    CGFloat trueScale = minScale + (minScale-1)*scale;
    self.transform = CGAffineTransformMakeScale(trueScale, trueScale);
}

- (void)setContent:(NSString *)content{
    self.text = content;
//        NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:self.font,NSFontAttributeName, nil];
//    根据标题文字获取文字宽度
//        CGSize fontSize =[self.text sizeWithAttributes:dic];
    CGRect frame = self.lineView.frame;
    frame = CGRectMake(0, 29 , screen_Width/6, 1);
    self.lineView.frame = frame;
}

@end
