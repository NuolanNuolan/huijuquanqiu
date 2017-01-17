//
//  JDLShoppingCartTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/12.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLShoppingCartTableViewCell.h"

@implementation JDLShoppingCartTableViewCell
{
    JDLSureCartModel *_shoppingModel;
    //店铺全部商品字典
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [PublicClass creatcelllab:_priceLab celllabFont1:14.0f celllabFont2:15.0f celllabFont3:16.0f];
}

-(void)setShoppingModel:(JDLSureCartModel*)ShoppingModel{

    _shoppingModel = ShoppingModel;
    [self.goodImange sd_setImageWithURL:[NSURL URLWithString:ShoppingModel.pimg]];
    self.detileLab.text = ShoppingModel.pname;
    self.priceLab.text = [NSString stringWithFormat:@"￥%@",ShoppingModel.price];
    self.detileGoodLab.text = [NSString stringWithFormat:@"%@;%@",ShoppingModel.size,ShoppingModel.color];
    self.textLab.text = [NSString stringWithFormat:@"%@",ShoppingModel.buy_amount];
    self.numberLab.text = [NSString stringWithFormat:@"x%@",ShoppingModel.buy_amount];
    
    if (ShoppingModel.selectState) {
        _selectState = YES;
        [_tickBtn setImage:[UIImage imageNamed:@"btn_roundness_pre"] forState:UIControlStateNormal];
    }
    else{
        _selectState = NO;
        [_tickBtn setImage:[UIImage imageNamed:@"btn_roundness"] forState:UIControlStateNormal];
    }
}

//按钮选择
- (IBAction)tickBtn:(UIButton *)sender {
    
    if (_shoppingModel.selectState) {
            _selectState = YES;
            [sender setImage:[UIImage imageNamed:@"btn_roundness_pre"] forState:UIControlStateNormal];
        }
        else{
            _selectState = NO;
            [sender setImage:[UIImage imageNamed:@"btn_roundness"] forState:UIControlStateNormal];
        }

    }


- (IBAction)deleteBtn:(UIButton *)sender {
//    if (_selectState == YES){
    if ([self.textLab.text isEqualToString:@"1"]) {
        return;
    }
    else
    {
    
        int j=[[NSString stringWithFormat:@"%@",_shoppingModel.buy_amount]intValue];
        self.textLab.text  =  [NSString stringWithFormat:@"%d",j-1];
        _shoppingModel.buy_amount =self.textLab.text;
        self.numberLab.text = [NSString stringWithFormat:@"x%@",_shoppingModel.buy_amount];
        [self.delegate btnClick:_shoppingModel andbtntag:sender.tag andcount:[_shoppingModel.buy_amount intValue]];
        
    }
    
//    }
}

- (IBAction)addBtn:(UIButton *)sender {
//    if (_selectState == YES){

    if ([self.textLab.text isEqualToString:_shoppingModel.KuCun]) {
        return;
    }
    else
    {
    
        int j=[[NSString stringWithFormat:@"%@",_shoppingModel.buy_amount]intValue];
        self.textLab.text  =  [NSString stringWithFormat:@"%d",j+1]; ;
        _shoppingModel.buy_amount =self.textLab.text;
        self.numberLab.text = [NSString stringWithFormat:@"x%@",_shoppingModel.buy_amount];
        [self.delegate btnClick:_shoppingModel andbtntag:sender.tag andcount:[_shoppingModel.buy_amount intValue]];
        
    }
    
//    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
