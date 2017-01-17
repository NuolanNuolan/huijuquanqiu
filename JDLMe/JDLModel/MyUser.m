//
//  MyUser.m
//  Creative
//
//  Created by huahongbo on 16/1/15.
//  Copyright © 2016年 王文静. All rights reserved.
//

#import "MyUser.h"
#import "User.h"
@implementation MyUser
//从沙盒取数据
+ (User*)currentUser
{
    User *loginM = [HMFileManager getObjectByFileName:@"User"];
    return loginM;
}
+ (NSString*)userId
{
    return [[self currentUser] mbID];
}
+ (NSString*)name
{
    return [[self currentUser] mbName];
}
+ (NSString*)phone
{
    return [[self currentUser] mob];
}
+ (NSString*)pwd
{
    return [[self currentUser] mbPwd];
}

@end
