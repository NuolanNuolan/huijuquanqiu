//
//  JDLBuyView.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/20.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLBuyView.h"

@implementation JDLBuyView
@synthesize addBtn,reduceBtn,countText,numberLab;

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        numberLab = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 100, 30)];
        numberLab.text = @"购买数量";
        numberLab.textColor = [UIColor blackColor];
        numberLab.font = [UIFont systemFontOfSize:14];
        [self addSubview:numberLab];
        
        addBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        addBtn.frame = CGRectMake(self.frame.size.width-10-40, 10,40, 30);
        [addBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        
        [addBtn setTitleColor:[UIColor blackColor] forState:0];
        addBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [addBtn setTitle:@"+" forState:0];
        [self addSubview:addBtn];
        
        countText = [[UITextField alloc] initWithFrame:CGRectMake(addBtn.frame.origin.x -45, 10, 40, 30)];
        countText.text = @"1";
        countText.textAlignment = NSTextAlignmentCenter;
        countText.font = [UIFont systemFontOfSize:15];
        countText.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
        [self addSubview:countText];
        
        reduceBtn= [UIButton buttonWithType:UIButtonTypeCustom];
        reduceBtn.frame = CGRectMake(countText.frame.origin.x -45, 10, 40, 30);
        [reduceBtn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        [reduceBtn setTitleColor:[UIColor blackColor] forState:0];
        reduceBtn.titleLabel.font = [UIFont systemFontOfSize:20];
        [reduceBtn setTitle:@"-" forState:0];
        [self addSubview:reduceBtn];
        
        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
        line.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:line];
    }
    return self;
}


@end
