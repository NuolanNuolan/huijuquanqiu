//
//  JDLChinaModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/20.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLChinaModel.h"

@implementation JDLChinaModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/province";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        //        consultID = self.objectId;
        self.name = dictionary[@"name"];
        self.rec = dictionary[@"rec"];
        self.img = dictionary[@"img"];
        self.cy_name = dictionary[@"cy_name"];
        self.id =  dictionary[@"id"];
        self.cyid = dictionary[@"cyid"];
        
//        self.isDefault = [dictionary[@"isDefault"] boolValue];
        
        
    }
    
    return self;
}

@end
