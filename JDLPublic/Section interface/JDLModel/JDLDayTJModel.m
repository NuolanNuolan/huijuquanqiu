//
//  JDLDayTJModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/24.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLDayTJModel.h"

@implementation JDLDayTJModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/rec_brand";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        
        self.cname = dictionary[@"cname"];
        self.pimg = dictionary[@"pimg"];
        self.cimg = dictionary[@"cimg"];
        self.shop_price = dictionary[@"shop_price"];
        self.prname = dictionary[@"prname"];
        self.pname = dictionary[@"pname"];
        self.price = dictionary[@"price"];
        self.shop_price = dictionary[@"shop_price"];
        self.bid = dictionary[@"bid"];
        self.pid = dictionary[@"pid"];
        
    }
    return self;
}

@end
