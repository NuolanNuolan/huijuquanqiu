//
//  JDLSPShouCangTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLSPShouCangTableViewCell.h"

@implementation JDLSPShouCangTableViewCell
{
    JDLCollectionShopModel *_collectionModel;
    //店铺全部商品字典
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setCollectionShopModel:(JDLCollectionShopModel*)CollectionShopModel{

    _collectionModel = CollectionShopModel;
    self.ShopName.text = CollectionShopModel.name;
    self.priceLab.text =CollectionShopModel.price;
    self.shop_CityLab.text =CollectionShopModel.cname;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:CollectionShopModel.url] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
}
-(void)setallshopmodel:(NSDictionary *)allshop_model
{

    self.ShopName.text = [allshop_model objectForKey:@"pname"];
    
    self.priceLab.text = [NSString stringWithFormat:@"¥%@",[allshop_model objectForKey:@"price"]];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:[allshop_model objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@"bg_home_imgthumb"]];
    self.shop_CityLab.text = [allshop_model objectForKey:@"cname"];
}
-(void)setallnewmodel:(NSDictionary *)allnew_model
{

        self.ShopName.text = [allnew_model objectForKey:@"pname"];
        self.priceLab.text =[NSString stringWithFormat:@"¥%@", [allnew_model objectForKey:@"price"]];
        [self.imageView sd_setImageWithURL:[NSURL URLWithString:[allnew_model objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@"bg_home_imgthumb"]];
    self.shop_CityLab.text = [allnew_model objectForKey:@"cname"];
    
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
