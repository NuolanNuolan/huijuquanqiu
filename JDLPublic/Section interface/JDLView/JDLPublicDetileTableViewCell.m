//
//  JDLPublicDetileTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/18.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLPublicDetileTableViewCell.h"
#import "JDLBuyViewController.h"

@implementation JDLPublicDetileTableViewCell
{

    JDLDayTJModel *model_1;
    JDLDayTJModel *model_2;
}

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setTJmodel:(JDLDayTJModel *)model andsetTJmodel:(JDLDayTJModel *)model1
{
    model_1 = model;
    model_2 =model1;
    
    self.lab1.text =[NSString stringWithFormat:@"￥%@",model.price] ;
    self.lab4.text = [NSString stringWithFormat:@"￥%@",model1.price];
    
//    折扣(暂无数据)
//    self.zheBtn1.background.imageNamed = @"btn_discountbox";
    [self.zheBtn1 setBackgroundImage:[UIImage imageNamed:@"btn_discountbox"] forState:UIControlStateNormal];
    [self.zheBtn1 setTitle:@"6折" forState:UIControlStateNormal];
    
    [self.zheBtn2 setBackgroundImage:[UIImage imageNamed:@"btn_discountbox"] forState:UIControlStateNormal];
    [self.zheBtn2 setTitle:@"6折" forState:UIControlStateNormal];
    
    
    [self.imageView1 sd_setImageWithURL:[NSURL URLWithString:model.pimg]];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1Click)];
    [self.fristView addGestureRecognizer:tap1];
    [self.imageView2 sd_setImageWithURL:[NSURL URLWithString:model1.pimg]];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2Click)];
    [self.secondView addGestureRecognizer:tap2];

    
    self.lab2.text =  [NSString stringWithFormat:@"￥%@" ,model.shop_price];
    self.lab5.text = [NSString stringWithFormat:@"￥%@" ,model1.shop_price];
    
    self.lab3.text = model.pname;
    self.lab6.text = model1.pname;
    
}
-(void)setModel1:(JDLDayTJModel *)model1{

//    _model1 = model1;
//    self.lab1.text = model1.price;
//    self.lab2.text = model1.shop_price;
//    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap1Click)];
//    [self.fristView addGestureRecognizer:tap1];
}


-(void)setModel2:(JDLDayTJModel *)model2{

//    _model2 = model2;
//    
//    self.lab4.text = model2.price;
//    self.lab5.text = model2.shop_price;
//    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap2Click)];
//    [self.secondView addGestureRecognizer:tap2];
}





-(void)tap1Click{

    [self.delegate BuyViewClick:model_1.pid];
    
}

-(void)tap2Click{
    


    [self.delegate BuyViewClick:model_2.pid];
    
}




@end
