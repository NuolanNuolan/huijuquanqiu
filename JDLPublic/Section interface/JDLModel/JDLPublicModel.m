//
//  JDLPublicModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/23.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLPublicModel.h"

@implementation JDLPublicModel

- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/sel_product";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.prname = dictionary[@"prname"];
        self.cname = dictionary[@"cname"];
        self.cimg =dictionary[@"cimg"];
        self.type = dictionary[@"type"];
        self.pimg = dictionary[@"pimg"];
        self.shop_price = dictionary[@"shop_price"];
        self.prname = dictionary[@"prname"];
        self.pname = dictionary[@"pname"];
        self.price = dictionary[@"price"];
        self.bid = dictionary[@"bid"];
        self.pid = dictionary[@"pid"];
    }
    return self;
}

@end
