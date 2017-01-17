//
//  JDLRedThereTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/26.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLRedThereTableViewCell.h"

@implementation JDLRedThereTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setRed_model:(JDLRed_oneModel *)Red_model
{
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(Red_One_Click)];
    [self.View_There addGestureRecognizer:tap1];
}
-(void)Red_One_Click
{
    MYLOG(@"第一个手势");
    [self.delegate  Red_There:self.index];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
