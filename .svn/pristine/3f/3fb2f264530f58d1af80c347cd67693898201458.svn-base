//
//  Feedback.m
//  feedback
//
//  Created by phoinixtech on 16/5/13.
//  Copyright (c) 2016年 JDL. All rights reserved.
//

#import "Feedback.h"

@implementation Feedback


- (NSString *) collectionName{
    // DataHubDemo: set collection name
    return @"document/feedback";
}

-(id) initWithDictionary:(NSDictionary *)dictionary{
    self = [super initWithDictionary:dictionary];
    if(self){
        //        consultID = self.objectId;
        self.name = dictionary[@"name"];
        self.email = dictionary[@"email"];
        self.tel = dictionary[@"tel"];
        self.other = dictionary[@"other"];
        self.feedback = dictionary[@"feedback"];
        NSArray *array = dictionary[@"imgArray"];
        if(array){
            self.imgArray = [NSMutableArray arrayWithArray:array];
        }

        
    }
    
    return self;
}


@end
