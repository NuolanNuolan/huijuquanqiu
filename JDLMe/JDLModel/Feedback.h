//
//  Feedback.h
//  feedback
//
//  Created by phoinixtech on 16/5/13.
//  Copyright (c) 2016年 JDL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HUBClient.h"

@interface Feedback : HUBObject  // DataHubDemo: extends HUBObject


@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *email;
@property (nonatomic, strong) NSString *tel;
@property (nonatomic, strong) NSString *other;
@property (nonatomic, strong) NSString *feedback;
@property (nonatomic, strong) NSMutableArray *imgArray;


@end
