//
//  JDLShoppingModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/5.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLShoppingModel.h"

@implementation JDLShoppingModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/cart";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.pname = dictionary[@"name"];
        
        self.buy_amount = dictionary[@"buy_amount"];
        
        self.price = dictionary[@"price"];
        
        self.pimg = dictionary[@"cname"];
    }
    
    return self;
}

@end
