//
//  JDLStore_allshop.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLStore_allshop.h"

@implementation JDLStore_allshop
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/shop_products";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.sid = dictionary[@"sid"];
        self.allshoparr = dictionary[@"products"];

    }
    
    return self;
}
@end
