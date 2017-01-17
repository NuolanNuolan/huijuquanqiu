//
//  JDLHotTablViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLHotTablViewCell.h"

@implementation JDLHotTablViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setHotSecondModel:(JDLHotSecondModel *)hotSecondModel{
    _hotSecondModel = hotSecondModel;
    [_hotImageView sd_setImageWithURL:[NSURL URLWithString:hotSecondModel.img]];
    _nameLab.text = hotSecondModel.name;
    _priceLab.text = [NSString stringWithFormat:@"￥%@",hotSecondModel.price];
    _originalPriceLab.text =[NSString stringWithFormat:@"￥%@",hotSecondModel.shop_price];
    _shop_add.text =hotSecondModel.cname;
}




- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)qiang_btn:(UIButton *)sender {
    [self.delegate Qiang_btn:_hotSecondModel.pid];
}
@end
