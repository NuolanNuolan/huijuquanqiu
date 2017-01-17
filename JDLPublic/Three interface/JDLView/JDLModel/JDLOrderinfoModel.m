//
//  JDLOrderinfoModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/20.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLOrderinfoModel.h"

@implementation JDLOrderinfoModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/order_info";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.user_id = dictionary[@"user_id"];
        self.order_status = dictionary[@"order_status"];
        self.pay_status = dictionary[@"pay_status"];
        self.consignee = dictionary[@"consignee"];
        self.country = dictionary[@"country"];
        self.province = dictionary[@"province"];
        self.city = dictionary[@"city"];
        self.district = dictionary[@"district"];
        self.address = dictionary[@"address"];
        self.sign_building = dictionary[@"sign_building"];
        self.zipcode = dictionary[@"zipcode"];
        self.tel = dictionary[@"tel"];
        self.email = dictionary[@"email"];
        self.mobile = dictionary[@"mobile"];
        self.time_best = dictionary[@"time_best"];
        self.postscript = dictionary[@"postscript"];
        self.shipping_id = dictionary[@"shipping_id"];
        self.shipping_name = dictionary[@"shipping_name"];
        self.pay_id = dictionary[@"pay_id"];
        self.pay_name = dictionary[@"pay_name"];
        self.goods_amount = dictionary[@"goods_amount"];
        self.shipping_fee = dictionary[@"shipping_fee"];
        self.insure_fee = dictionary[@"insure_fee"];
        self.pack_fee = dictionary[@"pack_fee"];
        self.order_amount = dictionary[@"order_amount"];
        self.order_id = dictionary[@"order_id"];
        self.allshop_count = dictionary[@"allshop_count"];
    }
    
    return self;
}

@end
