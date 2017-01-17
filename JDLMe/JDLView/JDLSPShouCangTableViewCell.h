//
//  JDLSPShouCangTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLCollectionShopModel.h"
#import "JDLStore_allshop.h"
#import "JDLStore_new.h"
@class JDLCollectionShopModel;
@interface JDLSPShouCangTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *shopImageView;

@property (weak, nonatomic) IBOutlet UILabel *ShopName;
@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *shop_CityLab;

-(void)setCollectionShopModel:(JDLCollectionShopModel*)CollectionShopModel;
-(void)setallshopmodel:(NSDictionary *)allshop_model;
-(void)setallnewmodel:(NSDictionary *)allnew_model;
@end
