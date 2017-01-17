//
//  JDLDetileColltionModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLDetileColltionModel.h"

@implementation JDLDetileColltionModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/product_prop";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.rec_shpo = dictionary[@"rec_shpo"];
        self.pid = dictionary[@"pid"];
        self.images_text = dictionary[@"images_text"];
        self.Detail = dictionary[@"Detail"];
    }
    
    return self;
}

@end
