//
//  LoginModel.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "LoginModel.h"
#import "MainTabBarController.h"
#import "AppDelegate.h"
@implementation LoginModel



+(BOOL)isLogin
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"ISLOGIN"] == YES){
        return YES;
    }else{
        return NO;
    }
}

+(void)setLoginOk
{
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"ISLOGIN"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
//跳转到首页
+(void)openMainVC
{
    AppDelegate *App = [[UIApplication sharedApplication] delegate];
    MainTabBarController *main = [[MainTabBarController alloc]init];
    App.window.rootViewController = main;
}
//判断手机号
+ (BOOL)checkInputMobile:(NSString *)_text
{
    //
    NSString *MOBILE    = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString *CM        = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[12378]|7[7])\\d)\\d{7}$";   // 包含电信4G 177号段
    NSString *CU        = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString *CT        = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    
    //
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    BOOL res1 = [regextestmobile evaluateWithObject:_text];
    BOOL res2 = [regextestcm evaluateWithObject:_text];
    BOOL res3 = [regextestcu evaluateWithObject:_text];
    BOOL res4 = [regextestct evaluateWithObject:_text];
    
    if (res1 || res2 || res3 || res4 )
    {
        return YES;
    }
    
    return NO;
}
+ (CGSize )viewHeight:(CGSize )withd  :(float)thfont :(NSString*)text
{
    CGSize size;
    if (text) {
        
        
        NSDictionary * attributes = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:thfont]forKey:NSFontAttributeName];
        NSAttributedString *attributedText =[[NSAttributedString alloc]initWithString:text attributes:attributes];
        CGRect rect = [attributedText boundingRectWithSize:withd
                                                   options:NSStringDrawingUsesLineFragmentOrigin
                                                   context:nil];
        size = rect.size;
        
    }
     return size;
}

@end
