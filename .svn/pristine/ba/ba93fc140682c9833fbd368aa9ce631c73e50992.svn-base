//
//  JDLChinaDetileModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/28.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLChinaDetileModel.h"

@implementation JDLChinaDetileModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/pr_product";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary]; 
    if(self){
        
        self.cyid = dictionary[@"cyid"];
        self.img = dictionary[@"img"];
        self.prid = dictionary[@"prid"];
        self.cyname = dictionary[@"cyname"];
        self.prname = dictionary[@"prname"];
        self.pid = dictionary[@"pid"];
        self.pname = dictionary[@"pname"];
        self.price = dictionary[@"price"];
        self.shop_price = dictionary[@"shop_price"];
        self.pimg = dictionary[@"pimgv"];
        self.cname = dictionary[@"cname"];
    }
    return self;
}

@end
