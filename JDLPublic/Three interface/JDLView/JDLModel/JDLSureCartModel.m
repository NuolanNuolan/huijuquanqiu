//
//  JDLSureCartModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/1.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLSureCartModel.h"

@implementation JDLSureCartModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/cart";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.pname = dictionary[@"pname"];
        self.pid = dictionary[@"pid"];
        self.buy_amount = dictionary[@"buy_amount"];
        self.price = dictionary[@"price"];
        self.total_fee = dictionary[@"total_fee"];
        self.data = dictionary[@"data"];
        self.pimg = dictionary[@"pimg"];
        self.color = dictionary[@"color"];
        self.size = dictionary[@"size"];
        self.ID = dictionary[@"ID"];
        self.selectState = [dictionary[@"selectState"]boolValue];
        self.KuCun = dictionary[@"KuCun"];
        self.sid = dictionary[@"sid"];
        self.store_name =dictionary[@"store_name"];
        self.shop_price = dictionary[@"shop_price"];
    }
    
    return self;
}

@end
