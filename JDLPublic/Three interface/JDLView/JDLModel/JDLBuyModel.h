//
//  JDLBuyModel.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/23.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "HUBObject.h"

@interface JDLBuyModel : HUBObject
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *price;
@property(nonatomic,strong)NSString *img;
@property(nonatomic,strong)NSString *city;
@property(nonatomic,strong)NSString *cat1_id;
@property(nonatomic,strong)NSString *cat1_name;
@property(nonatomic,strong)NSString *cat2_id;
@property(nonatomic,strong)NSString *cat2_name;
@property(nonatomic,strong)NSString *shop_price;
@property(nonatomic,strong)NSString *ID;
@property(nonatomic,strong)NSString *sid;
@property(nonatomic,strong)NSString *stock;
@property(nonatomic,strong)NSMutableArray *product_imgsArr;
@property(nonatomic,strong)NSMutableArray *product_prop_imgsArr;
@end
