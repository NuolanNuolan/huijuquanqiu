//
//  BaseViewController.m
//  ScreenShotBack
//
//  Created by 郑文明 on 16/5/10.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import "BaseViewController.h"
#import "AFNetworking.h"
#import "getIPhoneIP.h"
#import "DataMD5.h"
#import "DataSigner.h"
#import "XMLDictionary.h"
#import "Order.h"
#import <AlipaySDK/AlipaySDK.h>
#import <CoreLocation/CoreLocation.h>

#define AliPaypartner_rsa_private @"MIICXQIBAAKBgQDOXvO83hbcLu5/UXdiSzn2oBppvkL8zqNU7L9Tb8qiZvppi3DDI3Sc9dQFDEn1A2B3mtvSqqgybfrTRVN7DwpvtK9V+FJ2oQZGpktx7fERQcVhmxjJbdL2wzvUbNBBLqMyppFmV1nNnCaqw7ZMFJA7jvD6LdSGYegeuWOYwQkpoQIDAQABAoGASXVDDVeAi5+pBWjaNgLQ/xi+TiWLcrGbMf+Tmv+QAX7mY+temBdmyvg2IBXfvXcWP3zAApz8gfbj8ZAbxxHzhGwBA1OHetwpr3PkDeJfMJ7r/0FoIbS817tO2zggHRruTkQUqP5noLBCAVoIeVjomCNJzxQ0DDUJBix08JyJ/oECQQDqwXsM7uIAesRo6Z0R6oNXeHhamqPM1YEM7hQ1wBEsNsSq3Z4L4J1yKlOvSPbsfvRAPRBc/1PcOEfc8YXl4mpLAkEA4QvjHz4y9ofen36bjITEA/kAogksr8FGCij7fEtNNetzZmy0EbMj9lWxuV4FE1PQIbtv+6QHlI3UKs8qMT8IQwJAAzS3OHr+rSEAE6q1EWyRdJ1Zj2szN3Xm+EU8E2vXEDKDRw4VvXXI0KlRUUB+1sX5EfODiLGX9Jb0LElEGdqYtwJBAJVFWzsH+KnJaYMFaYuFLLct3Jud1kQlwJ1Qna7OC8KuD/dqNu5ekoX8RUwc7uTo/O7C8v5IyLZidM6IZwYPNx0CQQDhSFFagBUJq+rstqfogS19Y0Yr1CSzY1UOLT5sCyfC9EDbVEXhU141a8SUcy+hWtJ4zMS2rKGfGtkFfIXVGuON"
#define AliPaynotify_url @"http://phoinix.cn:8088/payment/verify"
#define AliPaypartner @"2088221704197690"
#define AliPayseller_id @"1098463094@qq.com"

@interface BaseViewController ()<CLLocationManagerDelegate>
{

    NSString *outTradeNo;
    NSString *resultStatus;
    int _paystatus;

}
@property (nonatomic, strong) CLLocationManager* locationManager;
@end
@implementation BaseViewController
- (id)init{
    self = [super init];
    if (self) {
        self.enablePanGesture = YES;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //    self.navigationController.navigationBarHidden = YES;
    //    [self.navigationController.navigationBar setBarTintColor:[UIColor orangeColor]];
    //接收支付宝支付成功的回调
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPaySuccess:) name:@"WXPaySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayFailed:) name:@"WXPayFailed" object:nil];
    
    [self checkNetWork];
}


- (void)getOrderPaySuccess:(NSNotification *)notification
{
    MYLOG(@"支付成功");
}

- (void)getOrderPayFailed:(NSNotification *)notification
{
    MYLOG(@"支付失败");
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:nil delegate:self cancelButtonTitle:@"支付失败" otherButtonTitles:nil, nil];
    [alert show];
}


#pragma mark - 设置导航栏标题
-(void)navTitle:(NSString *)str{
    
    self.navigationItem.title = str;
    
    //    UILabel *titleLab = [[UILabel alloc]init];
    //    titleLab.text = str;
    //    titleLab.textColor = [UIColor blackColor];
    //    titleLab.backgroundColor = [UIColor clearColor];
    //    titleLab.font = [UIFont boldSystemFontOfSize:18.0f];
    //    [self.view addSubview:titleLab];
    //
    //    [titleLab setTranslatesAutoresizingMaskIntoConstraints:NO];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1 constant:30.0f]];
    //    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:titleLab attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1 constant:0.0f]];
    
}

#pragma mark - 检测网络设置
- (void)checkNetWork{
    //检测网络
    AFNetworkReachabilityManager *manager = [AFNetworkReachabilityManager sharedManager];
    [manager startMonitoring];
    [manager setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        /*
         AFNetworkReachabilityStatusUnknown          = -1,
         AFNetworkReachabilityStatusNotReachable     = 0,
         AFNetworkReachabilityStatusReachableViaWWAN = 1,
         AFNetworkReachabilityStatusReachableViaWiFi = 2,
         
         */
        switch (status) {
            case AFNetworkReachabilityStatusUnknown:
            {
                
            }
                break;
            case AFNetworkReachabilityStatusNotReachable:
            {
                //没网
                [self showNoNetWorkUI];
                
                
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
            {
                //这里是3G/4G
            }
                break;
            case AFNetworkReachabilityStatusReachableViaWiFi:
            {
                
            }
                break;
                
            default:
                break;
        }
    }];
    
}

- (void)showNoNetWorkUI{
    __block UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 65, screen_Width, 20)];
    label.text = @"无网络连接";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor clearColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    [UIView animateWithDuration:1.0 animations:^{
        label.backgroundColor = [UIColor blackColor];
        label.frame = CGRectMake(0, 65, screen_Width, 20);
    }completion:^(BOOL finished) {
        [UIView animateWithDuration:3.0 animations:^{
            label.alpha = 0;
        }completion:^(BOOL finished) {
            [label removeFromSuperview];
            label = nil;
        }];
    }];
}


//-(void)createAlipMutableArray:(NSMutableArray *)alipMutabArry Model:(NSObject*)model nameStr:(NSString *)nameStr ModelName:(NSString *)modelName priceStr:(float)priceStr paystatu:(int)paystatus className:(NSString*)className{
//
//    NSArray* views = [[UIApplication sharedApplication] windows];
//    UIWindow* windowtemp = views[0];
//    if (windowtemp.hidden) {
//        windowtemp.hidden = NO;
//    }
//    else
//    {
//        MYLOG(@"no hidden");
//    }
//    /*
//     *商户的唯一的parnter和seller。
//     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
//     */
//    
//    /*============================================================================*/
//    /*=======================需要填写商户app申请的===================================*/
//    /*============================================================================*/
//    NSString *partner = AliPaypartner;
//    NSString *seller = AliPayseller_id;
//    NSString *privateKey = AliPaypartner_rsa_private;
//    /*============================================================================*/
//    /*============================================================================*/
//    /*============================================================================*/
//    
//    //partner和seller获取失败,提示
//    if ([partner length] == 0 ||
//        [seller length] == 0 ||
//        [privateKey length] == 0)
//    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                        message:@"缺少partner或者seller或者私钥。"
//                                                       delegate:self
//                                              cancelButtonTitle:@"确定"
//                                              otherButtonTitles:nil];
//        [alert show];
//        return;
//    }
//    
//    outTradeNo= [self sendGenerateTradeNO];
//    /*
//     *生成订单信息及签名
//     */
//    //将商品信息赋予AlixPayOrder的成员变量
//    Order *order = [[Order alloc] init];
//    order.partner = partner;
//    order.seller = seller;
//    order.tradeNO = outTradeNo; //订单ID（由商家自行制定）
//    if(alipMutabArry.count>0)
//    {
//        model = [alipMutabArry objectAtIndex:0];
//        order.productName =[NSString stringWithFormat:@"%@等多件商品",nameStr];
//        
//    }else
//    {
//        
//        order.productName = [NSString stringWithFormat:@"%@",nameStr]; //商品标题
//    }
//    
//    //        order.productDescription = [NSString stringWithFormat:@"%@",_detileModel.nameStr]; //商品描述
//        NSString *stringFloat = [NSString stringWithFormat:@"%0.2f",priceStr];
//    
//    order.amount = stringFloat; //商品价格
//    MYLOG(@"amount=========%@",order.amount);
//    order.notifyURL = AliPaynotify_url;//回调URL
//    
//    order.service = @"mobile.securitypay.pay";
//    order.paymentType = @"1";
//    order.inputCharset = @"utf-8";
//    order.itBPay = @"0.01";
//    order.showUrl = @"m.alipay.com";
//    
//    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
//    NSString *appScheme = @"alipayshare";
//    
//    //将商品信息拼接成字符串
//    NSString *orderSpec = [order description];
//    MYLOG(@"orderSpec = %@",orderSpec);
//    
//    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
//    id<DataSigner> signer = CreateRSADataSigner(privateKey);
//    NSString *signedString = [signer signString:orderSpec];
//    //NSString *signedString =privateKey;
//    //将签名成功字符串格式化为订单字符串,请严格按照该格式
//    NSString *orderString = nil;
//    if (signedString != nil) {
//        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
//                       orderSpec, signedString, @"RSA"];
//        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
//            MYLOG(@"reslut = %@",resultDic);
//            
//            //            windowtemp.hidden = YES;
//            resultStatus= [resultDic objectForKey:@"resultStatus"];
//            if (resultStatus.intValue==9000)
//            {
//                //支付成功
//                MYLOG(@"00000支付成功");
//                  ;
//            
////                [self createLoadData];
//            }
//            else{
//                
//                MYLOG(@"9000支付失败");
////                paystatus = 0;
////                [self createLoadData];
//                
//            }
//        }];
//    }
//
//}
//
//
//- (NSString *)sendGenerateTradeNO
//{
//    static int kNumber = 15;
//    
//    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
//    NSMutableString *resultStr = [[NSMutableString alloc] init];
//    srand(time(0));
//    for (int i = 0; i < kNumber; i++)
//    {
//        unsigned index = rand() % [sourceStr length];
//        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
//        [resultStr appendString:oneStr];
//    }
//    return resultStr;
//}






-(void)createOrderID:(NSString *)OrderID shoppingMutabArr:(NSMutableArray *)shoppingMutabArr shoppingName:(NSString *)shoppingName shoppingTwoName:(NSString *)shoppingTwoName allprice:(NSString *)allprice modelName:(NSString *)modelName leistr:(SEL)leistr{

    
    NSArray* views = [[UIApplication sharedApplication] windows];
    UIWindow* windowtemp = views[0];
    if (windowtemp.hidden) {
        windowtemp.hidden = NO;
    }
    else
    {
        MYLOG(@"no hidden");
    }
    /*
     *商户的唯一的parnter和seller。
     *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
     */
    
    /*============================================================================*/
    /*=======================需要填写商户app申请的===================================*/
    /*============================================================================*/
    NSString *partner = AliPaypartner;
    NSString *seller = AliPayseller_id;
    NSString *privateKey = AliPaypartner_rsa_private;
    /*============================================================================*/
    /*============================================================================*/
    /*============================================================================*/
    
    //partner和seller获取失败,提示
    if ([partner length] == 0 ||
        [seller length] == 0 ||
        [privateKey length] == 0)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
                                                        message:@"缺少partner或者seller或者私钥。"
                                                       delegate:self
                                              cancelButtonTitle:@"确定"
                                              otherButtonTitles:nil];
        [alert show];
        return;
    }
    
//    outTradeNo= [self sendGenerateTradeNO];
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = [NSString stringWithFormat:@"%@",OrderID]; //订单ID（由商家自行制定）
    if(shoppingMutabArr.count>1)
    {
        
        order.productName =[NSString stringWithFormat:@"%@等多件商品",shoppingName];
        
    }else
    {
        
        order.productName = [NSString stringWithFormat:@"%@",shoppingName]; //商品标题
    }
    
    //        order.productDescription = [NSString stringWithFormat:@"%@",_detileModel.nameStr]; //商品描述
    NSString *stringFloat = [NSString stringWithFormat:@"%@",allprice];
    
    order.amount = stringFloat; //商品价格
    MYLOG(@"amount=========%@",order.amount);
    order.notifyURL = AliPaynotify_url;//回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"0.01";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"alipayshare";
    
    //将商品信息拼接成字符串
    NSString *orderSpec = [order description];
    MYLOG(@"orderSpec = %@",orderSpec);
    
    //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
    id<DataSigner> signer = CreateRSADataSigner(privateKey);
    NSString *signedString = [signer signString:orderSpec];
    //NSString *signedString =privateKey;
    //将签名成功字符串格式化为订单字符串,请严格按照该格式
    NSString *orderString = nil;
    if (signedString != nil) {
        orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
                       orderSpec, signedString, @"RSA"];
        [[AlipaySDK defaultService] payOrder:orderString fromScheme:appScheme callback:^(NSDictionary *resultDic) {
            MYLOG(@"reslut = %@",resultDic);
            
            //            windowtemp.hidden = YES;
            resultStatus= [resultDic objectForKey:@"resultStatus"];
//            if (resultStatus.intValue==9000)
//            {
//                int i = 2;
            
            
//                shoppingTwoName = [NSString stringWithFormat:@"%d",i];
//                [_orderinfoModel saveObjectWithCompletion:^(id object, NSError *error) {
//                    if (error == nil) {
                        //支付成功
//                        MYLOG(@"00000支付成功");
//                        [self Loaddata];
//                    }
//                }];
//                                [self leistr];
//            }
//            else{
            
//                MYLOG(@"9000支付失败");
//                _paystatus = 0;
                //                [self createLoadData];
                
//            }
        }];
    }
}
-(void)DangqianWeizi
{

    //检测定位功能是否开启
    if([CLLocationManager locationServicesEnabled]){
        if(!_locationManager){
            self.locationManager = [[CLLocationManager alloc] init];
            if([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]){
                
                [self.locationManager requestWhenInUseAuthorization];
                [self.locationManager requestAlwaysAuthorization];
            }
            //设置代理
            [self.locationManager setDelegate:self];
            //设置定位精度
            [self.locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
            //设置距离筛选
            [self.locationManager setDistanceFilter:100];
            //开始定位
            [self.locationManager startUpdatingLocation];
            //设置开始识别方向
            [self.locationManager startUpdatingHeading];
        }
    }else{
        [MBProgressHUD showError:@"您没有开启定位功能,请在设置中开启"];
    }

}

#pragma mark - CLLocationManangerDelegate
//定位成功以后调用
- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
    [self.locationManager stopUpdatingLocation];
    CLLocation* location = locations.lastObject;
    [self reverseGeocoder:location];
}

#pragma mark Geocoder
//反地理编码
- (void)reverseGeocoder:(CLLocation *)currentLocation {
    
    CLGeocoder* geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if(error || placemarks.count == 0){
            NSLog(@"error = %@",error);
        }else{
            
            CLPlacemark* placemark = placemarks.firstObject;
//            NSDictionary *address = [placemark addressDictionary];
//            //判断直辖市
//            if([[address objectForKey:@"State"] isEqualToString:[address objectForKey:@"City"]])
//            {
//                _address_base = [address objectForKey:@"City"];
//            }
//            else
//            {
//                
//                _address_base = [[address objectForKey:@"State"]stringByAppendingString:[address objectForKey:@"City"]];
//                
//            }
            //创建一个消息对象
            NSNotification * notice = [NSNotification notificationWithName:@"234"object:nil userInfo:[placemark addressDictionary]];
            //发送消息
            [[NSNotificationCenter defaultCenter]postNotification:notice];
        }
    }];
}
@end

