//
//  JDLStoredeatail.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLStoredeatail.h"

@implementation JDLStoredeatail
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/shop_detail";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.shop = dictionary[@"shop"];
        self.home_id = dictionary[@"home"];
        self.products_id = dictionary[@"products"];
        self.newshop_id = dictionary[@"new"];
        self.activity_id = dictionary[@"activity"];
    }
    
    return self;
}
@end
