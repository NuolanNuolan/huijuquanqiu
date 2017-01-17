//
//  JDLCollectionShopModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/23.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLCollectionShopModel.h"

@implementation JDLCollectionShopModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/favorite";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.name = dictionary[@"name"];
        self.price = dictionary[@"price"];
        self.cname = dictionary[@"cname"];
        self.pid = dictionary[@"pid"];
        self.url = dictionary[@"url"];
    }
    
    return self;
}

@end
