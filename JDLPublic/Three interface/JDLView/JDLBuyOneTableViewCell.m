//
//  JDLBuyOneTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/18.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLBuyOneTableViewCell.h"

@implementation JDLBuyOneTableViewCell
//{
//
//    JDLBuyModel *_buyModel;
//}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


-(void)setBuyModel:(JDLBuyModel*)jdlBuyModel{

    _buyModel = jdlBuyModel;
    self.titleLab.text = jdlBuyModel.name;
    self.priceLab.text = [NSString stringWithFormat:@"￥%@",jdlBuyModel.price];
    self.cityLab.text = jdlBuyModel.city;
    self.originalPrice.text = [NSString stringWithFormat:@"¥%@",jdlBuyModel.shop_price] ;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
