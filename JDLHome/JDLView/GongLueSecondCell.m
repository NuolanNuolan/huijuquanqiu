//
//  GongLueSecondCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "GongLueSecondCell.h"
//#import "GSFristBasicViewController.h"


@implementation GongLueSecondCell
{
    NSString * _name;
    
}
- (void)awakeFromNib {
    // Initialization code
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setModel1:(JDLGongLueSecondModel *)model1{
    _model1 = model1;
    self.lb1.text = model1.gtfName;
    [self.im1 sd_setImageWithURL:[NSURL URLWithString:model1.imgURL]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick1:)];
    [self.vi1 addGestureRecognizer:tap];
}



- (void)setModel2:(JDLGongLueSecondModel *)model2{
    _model2 = model2;
    self.lb2.text = model2.gtfName;
    [self.im2 sd_setImageWithURL:[NSURL URLWithString:model2.imgURL] placeholderImage:[UIImage imageNamed:@"imgURL"]];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick2)];
        [self.vi2 addGestureRecognizer:tap];
    }


- (void)setModel3:(JDLGongLueSecondModel *)model3{
    _model3 = model3;
    self.lb3.text = model3.gtfName;
    [self.im3 sd_setImageWithURL:[NSURL URLWithString:model3.imgURL] placeholderImage:[UIImage imageNamed:@"imgURL"]];

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick3)];
        [self.vi3 addGestureRecognizer:tap];
    }


- (void)setModel4:(JDLGongLueSecondModel *)model4{
    _model4 = model4;
    self.lb4.text = model4.gtfName;
    [self.im4 sd_setImageWithURL:[NSURL URLWithString:model4.imgURL] placeholderImage:[UIImage imageNamed:@"imgURL"]];
    
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick4)];
        [self.vi4 addGestureRecognizer:tap];
    }



- (void)tapClick1:(UIGestureRecognizer * )name{
     MYLOG(@"1");
    [self.delegate sendGongLueSecondModel:self.model1];
}

- (void)tapClick2{
    MYLOG(@"2");
    [self.delegate sendGongLueSecondModel:self.model2];
}

- (void)tapClick3{
    MYLOG(@"3");
    [self.delegate sendGongLueSecondModel:self.model3];

}

- (void)tapClick4{
     MYLOG(@"4");
    [self.delegate sendGongLueSecondModel:self.model4];
}


@end
