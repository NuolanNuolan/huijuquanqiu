//
//  JDLOrderdetileTwoTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/3.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLOrderdetileTwoTableViewCell.h"

@implementation JDLOrderdetileTwoTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    if (screen_Width == iphone4_width) {
        self.orderTextFiled.font = [UIFont systemFontOfSize:13.0f];
    }
    else{
    self.orderTextFiled.font = [UIFont systemFontOfSize:14.0f];
        
    }
}


-(void)shopcartmodel:(JDLSureCartModel *)shopcartmodel
{
    self.orderShopLab.text =shopcartmodel.store_name;
    self.orderColourLab.text =[NSString stringWithFormat:@"%@;%@",shopcartmodel.size,shopcartmodel.color] ;
    self.orderPriceLab.text = [NSString stringWithFormat:@"￥%@",shopcartmodel.price];
    self.orderNumLab.text = [NSString stringWithFormat:@"x%@",shopcartmodel.buy_amount];
    self.orderNameLab.text = shopcartmodel.pname;
    [self.orderDetileImage sd_setImageWithURL:  [NSURL URLWithString: shopcartmodel.pimg] ];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
