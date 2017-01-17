//
//  LoginModel.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface LoginModel : NSObject



//登录状态改变
+(BOOL)isLogin;

+(void)setLoginOk;
//跳转到首页
+(void)openMainVC;
//判断是否为真实手机号码
+ (BOOL)checkInputMobile:(NSString *)_text;
+(CGSize)viewHeight:(CGSize )withd :(float)thfont :(NSString*)text;
@end
