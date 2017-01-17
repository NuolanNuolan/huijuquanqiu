//
//  JDLAllShopingTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/25.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLAllShopingTableViewCell.h"

@implementation JDLAllShopingTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setModel1:(JDLAllShopingModel *)model1{
    _model1 = model1;
    [self.allImage1 sd_setImageWithURL:[NSURL URLWithString:model1.img]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick1:)];
    [self.allView1 addGestureRecognizer:tap];
    
}



- (void)setModel2:(JDLAllShopingModel *)model2{
    _model2 = model2;
    [self.allImage2 sd_setImageWithURL:[NSURL URLWithString:model2.img]];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick2)];
    [self.allView2 addGestureRecognizer:tap];
}


- (void)setModel3:(JDLAllShopingModel *)model3{
    _model3 = model3;
    [self.allImage3 sd_setImageWithURL:[NSURL URLWithString:model3.img]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick3)];
    [self.allView3 addGestureRecognizer:tap];
}


- (void)setModel4:(JDLAllShopingModel *)model4{
    _model4 = model4;
    [self.allImage4 sd_setImageWithURL:[NSURL URLWithString:model4.img]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick4)];
    [self.allView4 addGestureRecognizer:tap];
}


- (void)setModel5:(JDLAllShopingModel *)model5{
    _model5 = model5;
    [self.allImage5 sd_setImageWithURL:[NSURL URLWithString:model5.img]];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick5)];
    [self.allView5 addGestureRecognizer:tap];
}



- (void)tapClick1:(UIGestureRecognizer * )name{
    MYLOG(@"1");
    [self.delegate sendAllShopingModel:self.model1];
}

- (void)tapClick2{
    MYLOG(@"2");
    [self.delegate sendAllShopingModel:self.model2];
}

- (void)tapClick3{
    MYLOG(@"3");
    [self.delegate sendAllShopingModel:self.model3];
    
}

- (void)tapClick4{
    MYLOG(@"4");
    [self.delegate sendAllShopingModel:self.model4];
}

-(void)tapClick5{

    [self.delegate sendAllShopingModel:self.model5];
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
