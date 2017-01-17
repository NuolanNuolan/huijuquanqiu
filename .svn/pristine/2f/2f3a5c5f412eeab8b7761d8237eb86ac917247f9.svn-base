//
//  JDLBuyModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/23.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLBuyModel.h"

@implementation JDLBuyModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/product";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.name = dictionary[@"name"];
        self.price = dictionary[@"price"];
        self.img = dictionary[@"img"];
        self.city = dictionary[@"city"];
        self.cat1_id = dictionary[@"cat1_id"];
        self.cat1_name = dictionary[@"cat1_name"];
        self.cat2_id = dictionary[@"cat2_id"];
        self.shop_price = dictionary[@"shop_price"];
        self.ID = dictionary[@"ID"];
        self.sid = dictionary[@"sid"];
        self.stock =dictionary[@"stock"];
        self.product_imgsArr = dictionary[@"product_imgs"];
        self.product_prop_imgsArr = dictionary[@"product_prop_imgs"];
    }
    
    return self;
}

@end
