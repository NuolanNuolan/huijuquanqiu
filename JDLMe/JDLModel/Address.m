//
//  Address.m
//  feedback
//
//  Created by phoinixtech on 16/5/13.
//  Copyright (c) 2016年 JDL. All rights reserved.
//

#import "Address.h"

@implementation Address

- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/address";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        self.name = dictionary[@"name"];
        self.tel = dictionary[@"tel"];
        self.address = dictionary[@"address"];
        self.area = dictionary[@"area"];
        self.isDefault = [dictionary[@"isDefault"] intValue];
        
        
    }
    
    return self;
}


@end
