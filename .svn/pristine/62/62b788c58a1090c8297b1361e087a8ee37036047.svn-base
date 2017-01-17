//
//  JDLOrderDeatilForuTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/29.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLOrderDeatilForuTableViewCell.h"

@implementation JDLOrderDeatilForuTableViewCell
{

    JDLOrderinfoModel *_orderinfomodel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}




-(void)setOrderinfomodel:(JDLOrderinfoModel*)Orderinfomodel
{
    _orderinfomodel =Orderinfomodel;
    self.Ordeinfo_allCount.text = [NSString stringWithFormat:@"共%@件商品",_orderinfomodel.allshop_count];
    self.Ordeinfo_allPrice.text = [NSString stringWithFormat:@"实付:￥%@",_orderinfomodel.goods_amount];
    self.Ordeinfo_orderid.text = [NSString stringWithFormat:@"订单编号:%@",_orderinfomodel.order_id];
    self.Ordeinfo_alipayID.text =[NSString stringWithFormat:@"支付宝交易号:%@",nil];
    self.Ordeinfo_Createtime.text = [NSString stringWithFormat:@"创建时间:%@",nil];
    self.Ordeinfo_Paytime.text = [NSString stringWithFormat:@"付款时间:%@",nil];
    self.Ordeinfo_FaHuoTime.text = [NSString stringWithFormat:@"发货时间:%@",nil];
    
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
