//
//  JDLOrderDeatilThereTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/29.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLOrderDeatilThereTableViewCell.h"

@implementation JDLOrderDeatilThereTableViewCell
{

    JDLPayModel *_paymodel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setPayModel:(JDLPayModel*)Paymodel
{
    _paymodel = Paymodel;
    self.Store_name.text = _paymodel.store_name;
    self.Shop_name.text = _paymodel.goods_name;
    self.Shop_price.text = [NSString stringWithFormat:@"￥%@",_paymodel.shop_price];
    self.Shop_count.text = [NSString stringWithFormat:@"x%@",_paymodel.goods_number];
    self.Shop_size_color.text = [NSString stringWithFormat:@"尺码:%@,颜色:%@",_paymodel.size,_paymodel.color];
    [self.Shop_img sd_setImageWithURL:[NSURL URLWithString:_paymodel.pimg]];
    
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [self.View_store addGestureRecognizer:tap1];
    
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick1)];
    [self.View_shop addGestureRecognizer:tap2];

    
}
-(void)tapClick
{
    [self.delegate push_store_shop:_paymodel.sid Andstore_type:@"store"];
    
}
-(void)tapClick1
{

    [self.delegate push_store_shop:_paymodel.goods_id Andstore_type:@"shop"];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end