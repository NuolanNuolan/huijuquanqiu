//
//  JDLFav_shop.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/1.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLFav_shop.h"

@implementation JDLFav_shop
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/fav_shop";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.name = dictionary[@"name"];
        
        self.pid = dictionary[@"pid"];
//        
//        self.price = dictionary[@"price"];
//        
//        self.cname = dictionary[@"cname"];
        self.url = dictionary[@"url"];
    }
    
    return self;
}
@end
