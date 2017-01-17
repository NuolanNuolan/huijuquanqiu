//
//  JDLPayModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/2.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLPayModel.h"

@implementation JDLPayModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/order_goods";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.goods_name = dictionary[@"goods_name"];
        self.sid = dictionary[@"sid"];
        self.shop_price = dictionary[@"shop_price"];
        self.total_fee = dictionary[@"total_fee"];
        self.pimg = dictionary[@"pimg"];
        self.seller_nick = dictionary[@"seller_nick"];
        self.goods_number = dictionary[@"goods_number"];
        self.goods_amount = dictionary[@"goods_amount"];
        self.order_id = dictionary[@"order_id"];
        self.size = dictionary[@"size"];
        self.color = dictionary[@"color"];
        self.store_name = dictionary[@"store_name"];
        self.goods_id = dictionary[@"goods_id"];
        self.market_price = dictionary[@"market_price"];
    }
    
    return self;
}

@end
