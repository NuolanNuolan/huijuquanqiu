//
//  JDLDayTuiJianTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/31.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLDayTuiJianTableViewCell.h"

@implementation JDLDayTuiJianTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel1:(JDLDayDetileModel *)model1{

    _model1 = model1;
    if (model1 != nil) {
        [self.dayImageView1 sd_setImageWithURL:model1.pimg];
        self.dayLab1.text = model1.name;
        self.dayPriceLab1.text = [NSString stringWithFormat:@"￥%@",model1.url];
        self.dayAreaLab1.text = model1.cname;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick1)];
        [self.view1 addGestureRecognizer:tap];
    }
    else{
    
        self.dayLab1.text = nil;
        self.dayImageView1 = nil;
        self.dayPriceLab1.text = nil;
        self.dayAreaLab1.text = nil;
    }
    
}

-(void)setModel2:(JDLDayDetileModel *)model2{

    _model2 = model2;
    if (model2 != nil) {
        [self.dayImageView2 sd_setImageWithURL:model2.pimg];
        self.daylab2.text = model2.name;
        self.daypriceLab2.text = [NSString stringWithFormat:@"￥%@",model2.url];
        self.dayAreaLab2.text = model2.cname;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick2)];
        [self.view2 addGestureRecognizer:tap];
    }
    else{
        self.daylab2.text = nil;
        self.dayImageView2 = nil;
        self.daypriceLab2.text = nil;
        self.dayAreaLab2.text = nil;
        
    }
    
}

-(void)setModel3:(JDLDayDetileModel *)model3{
    _model3 = model3;
    if (model3 != nil) {
        [self.dayImageView3 sd_setImageWithURL:model3.pimg];
        self.daylab3.text = model3.name;
        self.dayPriceLab3.text = [NSString stringWithFormat:@"￥%@",model3.url];
        self.dayAreaLab3.text = model3.cname;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapClick3)];
        [self.view3 addGestureRecognizer:tap];
    }
    else{
    
        self.daylab3.text = nil;
        self.dayImageView3 = nil;
        self.dayPriceLab3.text = nil;
        self.dayAreaLab3.text = nil;
    }
    
}






-(void)tapClick1{

    [self.delegate sendDayDetileModel:_model1.pid];
}

-(void)tapClick2{
    
    [self.delegate sendDayDetileModel:_model2.pid];
}

-(void)tapClick3{

    [self.delegate sendDayDetileModel:_model3.pid];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
