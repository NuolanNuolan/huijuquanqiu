//
//  AppDelegate.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "AppDelegate.h"
#import "JDLHomeViewController.h"
#import "JDLChinaViewController.h"
#import "JDLInternstionViewController.h"
#import "JDLShoppingViewController.h"
#import "JDLMeViewController.h"
#import "UMSocial.h"
#import "WXApi.h"
#import <AlipaySDK/AlipaySDK.h>
#import "UserGuiderViewController.h"
#if kUseScreenShotGesture
static char szListenTabbarViewMove[] = "listenTabViewMove";
#endif
@interface AppDelegate ()<UITabBarControllerDelegate,WXApiDelegate>

@property (strong, nonatomic) JDLLoggingViewController *thirdLoginVC;
@end


@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //定义友盟KEY
    [UMSocialData setAppKey:@"571f452ae0f55ac848001423"];
//    [WXApi registerApp:@"wxa8235233746fd58d" withDescription:@"Wechat"];
    [WXApi registerApp:@"wxa8235233746fd58d"];
//    [WXApi registerApp:@"QQ1105288723"];

    [HUBBox  setBaseURL:@"http://phoinix.cn:8088/" appCode:@"1234567890"];
    
    HUBClient *client = [HUBClient sharedClient];
    HUBUser *user = client.currentUser;
    if (user) {
        [HUBUser logoutWithCompletion:^(BOOL success, NSError *error) {
                        if (success) {
//                            //退出登录后再重新登录
//                            [self Login];
                        } else {
                            // error logging out
                            MYLOG(@"logout error=%@",error);
//                            [self Login];
                        }
                    }];
        
    }






    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];

//    改变时间的颜色
    [[UIApplication sharedApplication]setStatusBarStyle:UIStatusBarStyleLightContent];
    
    
    /*初始化视图*/
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self loadRootVC];
    
    
    //active
    [self.window makeKeyAndVisible];
    
#if kUseScreenShotGesture
    self.screenshotView = [[ScreenShotView alloc] initWithFrame:CGRectMake(0, 0, self.window.frame.size.width, self.window.frame.size.height)];
    [self.window insertSubview:_screenshotView atIndex:0];
    
    [self.window.rootViewController.view addObserver:self forKeyPath:@"transform" options:NSKeyValueObservingOptionNew context:szListenTabbarViewMove];
    
    self.screenshotView.hidden = YES;
#endif
    
    return YES;
}

#if kUseScreenShotGesture
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == szListenTabbarViewMove)
    {
        NSValue *value  = [change objectForKey:NSKeyValueChangeNewKey];
        CGAffineTransform newTransform = [value CGAffineTransformValue];
        [self.screenshotView showEffectChange:CGPointMake(newTransform.tx, 0) ];
    }
}

#endif
- (void)loadRootVC {
    if (![[NSUserDefaults standardUserDefaults] boolForKey:@"firstLaunch"]) {
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"firstLaunch"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.window.rootViewController = [[UserGuiderViewController alloc]init];
    }
    else {
        self.window.rootViewController = self.tabBarViewController= [[MainTabBarController alloc] init];;
        
    }
}

-(void)Login{

    HUBClient *client = [HUBClient sharedClient];
    HUBUser *user = client.currentUser;
    NSString *tel = [[NSUserDefaults standardUserDefaults]objectForKey:@"PHONE"];
    NSString *pwd=  [[NSUserDefaults standardUserDefaults]objectForKey:@"PWD"];
    if (tel&&pwd) {
        [HUBUser loginWithPhone:tel
                       password:pwd
                     completion:^(BOOL success, NSError *error) {
                         if (success) {
                             
                     NSMutableDictionary *Mutabledic = user.visibleByRegisteredUsers;
                     //存头像
                     [[NSUserDefaults standardUserDefaults]setObject:[Mutabledic objectForKey:@"head_url"] forKey:@"DATA_IMAGE"];
                     [[NSUserDefaults standardUserDefaults]setObject:[Mutabledic objectForKey:@"nick"] forKey:@"USERNAME"];
                     [[NSUserDefaults standardUserDefaults]setObject:pwd forKey:@"PWD"];
                     [[NSUserDefaults standardUserDefaults]setObject:tel forKey:@"PHONE"];
                }
            }
         ];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    [self saveContext];
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            MYLOG(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "com.JDL.feedback" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"feedback" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"feedback.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        MYLOG(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}


- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation {
    
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"result = %@",resultDic);
        }];
    }
    return YES;
}


- (BOOL)application:(UIApplication *)app openURL:(nonnull NSURL *)url options:(nonnull NSDictionary<NSString *,id> *)options{
    if ([url.host isEqualToString:@"safepay"]) {
        //跳转支付宝钱包进行支付，处理支付结果
        [[AlipaySDK defaultService] processOrderWithPaymentResult:url standbyCallback:^(NSDictionary *resultDic) {
            NSLog(@"resultresultDicresultDicresultDic = %@",resultDic);
        }];
    }
    else
    {
        NSString *string = [url absoluteString];
        
        if ([string hasPrefix:@"weixin"])
        {
//            return [WXApi handleOpenURL:url delegate:self];
            MYLOG(@"%@",url);
        }
        else
        {
            MYLOG(@"TencentOAuth%@",url);
//            return [TencentOAuth HandleOpenURL:url];
             return [WXApi handleOpenURL:url delegate:self];
        }
    }
    return YES;
}
// 这个方法是用于从？？返回第三方App
-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url
{
    NSString *string =[url absoluteString];
    
//    if ([string hasPrefix:@"wb"])
//    {
//        return [WeiboSDK handleOpenURL:url delegate:self];
//    }
    if ([string hasPrefix:@"wxf"])
    {
        return [WXApi handleOpenURL:url delegate:self];
        MYLOG(@"%@",url);
    }
    else
    {
        MYLOG(@"TencentOAuth%@",url);
        return [TencentOAuth HandleOpenURL:url];
    }
}

//授权后回调 WXApiDelegate
- (void)onResp:(BaseResp *)resp
{
    /*
     ErrCode ERR_OK = 0(用户同意)
     ERR_AUTH_DENIED = -4（用户拒绝授权）
     ERR_USER_CANCEL = -2（用户取消）
     code    用户换取access_token的code，仅在ErrCode为0时有效
     state   第三方程序发送时用来标识其请求的唯一性的标志，由第三方程序调用sendReq时传入，由微信终端回传，state字符串长度不能超过1K
     lang    微信客户端当前语言
     country 微信用户当前国家信息
     */
    if([resp isKindOfClass:[SendAuthResp class]])
    {
        SendAuthResp *aresp = (SendAuthResp *)resp;
        if (aresp.errCode== 0) {
            NSString *code = aresp.code;
            MYLOG(@"-----wx---code-- %@",code);
            [[NSUserDefaults standardUserDefaults]setValue:code forKey:@"wx_code"];
            [[NSUserDefaults standardUserDefaults]synchronize];
            [self.thirdLoginVC getAccess_token];
            
        }
    }
    
    NSString *strTitle;
    if ([resp isKindOfClass:[SendMessageToWXResp class]])
    {
        strTitle = [NSString stringWithFormat:@"发送媒体消息结果"];
    }
    if ([resp isKindOfClass:[PayResp class]])
    {
        strTitle = [NSString stringWithFormat:@"支付结果"];
        switch (resp.errCode)
        {
            case WXSuccess:
            {
                MYLOG(@"支付成功!");
                [[NSNotificationCenter defaultCenter] postNotificationName:@"WXPaySuccess" object:nil];
                
            }
                break;
            case WXErrCodeCommon:
            {
                //签名错误、未注册APPID、项目设置APPID不正确、注册的APPID与设置的不匹配、其他异常等
                [[NSNotificationCenter defaultCenter] postNotificationName:@"WXPayFailed" object:nil];
                NSLog(@"支付结果: 失败!");
            }
                break;
            case WXErrCodeUserCancel:
            { //用户点击取消并返回
                
            }
                break;
            case WXErrCodeSentFail:
            { //发送失败
                NSLog(@"发送失败");
            }
                break;
            case WXErrCodeUnsupport:
            { //微信不支持
                NSLog(@"微信不支持");
            }
                break;
            case WXErrCodeAuthDeny:
            { //授权失败
                NSLog(@"授权失败");
            }
                break;
            default:
                break;
        }
    }
}

- (void)onReq:(BaseReq *)req
{
    
}


+ (AppDelegate* )shareAppDelegate {
    return (AppDelegate*)[UIApplication sharedApplication].delegate;
}

@end
