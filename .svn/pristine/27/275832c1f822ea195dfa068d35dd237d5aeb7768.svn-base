//
//  JDLHotSecondModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/21.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLHotSecondModel.h"

@implementation JDLHotSecondModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/hot_product";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
     
        self.hid = dictionary[@"hid"];
        self.pid = dictionary[@"pid"];
        self.name = dictionary[@"name"];
        self.price = dictionary[@"price"];
        self.type = dictionary[@"type"];
        self.url = dictionary[@"url"];
        self.cname = dictionary[@"cname"];
        self.img = dictionary[@"img"];
        self.shop_price = dictionary[@"shop_price"];
    }
        return self;
}



@end
