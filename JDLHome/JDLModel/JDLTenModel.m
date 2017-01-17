//
//  JDLTenModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLTenModel.h"

@implementation JDLTenModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/home";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.selectedArr =dictionary[@"selected"];
        
    }
    
    return self;
}

@end
