//
//  JDLAllShopCollectionViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/24.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLAllShopCollectionViewCell.h"

@implementation JDLAllShopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setChinaModel:(JDLAllShopDetileModel*)shopDetileModel
{


    [_all_image  sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",shopDetileModel.p_img]] placeholderImage:[UIImage imageNamed:@"bg_home_hot"]];
    _all_name.text = [NSString stringWithFormat:@"%@",shopDetileModel.pname];
    _all_price.text = [NSString stringWithFormat:@"￥%@",shopDetileModel.price];
    _all_address.text = [NSString stringWithFormat:@"%@",shopDetileModel.cname];
    
}
@end
