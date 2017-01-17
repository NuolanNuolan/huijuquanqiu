//
//  JDLDayDetileModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLDayDetileModel.h"

@implementation JDLDayDetileModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/rec_product";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        
        self.rid = dictionary[@"rid"];
        self.pid = dictionary[@"pid"];
        self.name = dictionary[@"name"];
        self.type = dictionary[@"type"];
        self.url = dictionary[@"url"];
        self.cname = dictionary[@"cname"];
        self.pimg = dictionary[@"pimg"];
        self.cimg = dictionary[@"cimg"];
//        self.shop_price = dictionary[@"shop_price"];
//        self.p_img = dictionary[@"p_img"];
//        self.cname = dictionary[@"cname"];
    }
    return self;
}

@end
