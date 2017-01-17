//
//  JDLInternstionModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/21.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLInternstionModel.h"

@implementation JDLInternstionModel
- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/country";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        //        consultID = self.objectId;
        self.name = dictionary[@"name"];
        self.rec = dictionary[@"rec"];
        self.img = dictionary[@"img"];
        self.id =  dictionary[@"id"];
        //        self.isDefault = [dictionary[@"isDefault"] boolValue];
        
        
    }
    
    return self;
}
@end
