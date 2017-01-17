//
//  JDLRedOneTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/26.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLRedOneTableViewCell.h"

@implementation JDLRedOneTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setRed_model:(JDLRed_oneModel *)Red_model
{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Red_two_Click)];
    [self.View_One addGestureRecognizer:tap1];
}
-(void)Red_two_Click
{
    MYLOG(@"第一个手势");
    [self.delegate  Red_One:self.index];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
