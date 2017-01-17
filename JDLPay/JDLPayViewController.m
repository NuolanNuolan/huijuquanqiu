//
//  JDLPayViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLPayViewController.h"
#import "UIImageView+AFNetworking.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "WXApi.h"
#import "AFNetworking.h"


#define AliPaypartner_rsa_private @"MIICXQIBAAKBgQDRMujTGMKKNWYeWx4a1mcrNzbCS4hhLNfAbcO/Wve6jFhbnv7OAuSkP0q2TwaEv9Yeg8OhPsywy2ADI0AMk2RhUEp8Cak9VTy5jfQql3TTQrXcQ9qkAmb6YackFDIP4Ld/97Dz3feK9OWUwQeyIs8hPDAQfR5+piPwxY7zrSsquwIDAQABAoGBAINmAq91AdxlpfqzKLmaqbqPN6naX5MJ44pOZ4Et1iQqOuVxfIJRduNjjb3s7R88j3UjNiF1nIP/ehL+dSBxA76pH3MsGKySbNc8HzqqDD96x4haVD7Kh/+hwraBkKqMiZYr1xslyZWoNZdSFqhKmEI4Ct+K6TB/T7a0PMQDF65hAkEA7t/XdElge6u/rIXIv7nmp9Pv/2I9GsvOPkAbxC8awRLuhgYA7V8BoG4QJc/GDkXGSSj81uuJXL5pyfB63snhrQJBAOAya8tOi3X6fX57zEeUdM7Hu9jT46p+OmGgvk3tVudyZqxRU6CwciJe/jpDkwQXC2THfvp/51P+FHQfR2DT2wcCQB2Kr1GhVX5V8kF61iXn7r+otVCnLJloxRvrv8NWc/+WwMrwaSLyEfhuRC748CyJsokPuZ02yekfX2PrCrcMzo0CQQCtD57P8FCNAJAwu6Vjt8A3Ak0Jwf5i1E+Cnw9nngbQYCnLaHfSeYGQ8Jz0Isdwh81evPRSr7rExkPJo394yfCvAkAoM5LE22Sfq5hSaYF2+GfkQP6hb0cxR+Zy9ZoGoz82/OmCed8kqRki6L96fx+B8DkmNwLaKOUEG22rO6OBpSWE"
#define AliPaynotify_url @"http://phoinix.cn:8088/payment/verify"
#define AliPaypartner @"2088221704197690"
#define AliPayseller_id @"1098463094@qq.com"
@interface JDLPayViewController ()
{
    NSString *outTradeNo;
    NSString *resultStatus;
    NSString *wxOut_trade_no;
}


@property(nonatomic,strong)NSString *OpusID;
@property(nonatomic,strong)NSString *amount;
@property (nonatomic,strong) NSDictionary *wxDic;
@end

@implementation JDLPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
//    [self aliPayClick];
        //接收支付宝支付成功的回调
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPaySuccess:) name:@"WXPaySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayFailed:) name:@"WXPayFailed" object:nil];

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

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"WXpaySuccess" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"WXPayFailed" object:nil];
}

//支付宝支付
- (void)aliPayClick
{
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
    
    outTradeNo= [self sendGenerateTradeNO];
    /*
     *生成订单信息及签名
     */
    //将商品信息赋予AlixPayOrder的成员变量
    Order *order = [[Order alloc] init];
    order.partner = partner;
    order.seller = seller;
    order.tradeNO = outTradeNo; //订单ID（由商家自行制定）
    order.productName = @"Demo"; //商品标题
    order.productDescription = @"Demo"; //商品描述
    order.amount = @"0.01"; //商品价格
    MYLOG(@"amount=========%@",order.amount);
    order.notifyURL = AliPaynotify_url;//回调URL
    
    order.service = @"mobile.securitypay.pay";
    order.paymentType = @"1";
    order.inputCharset = @"utf-8";
    order.itBPay = @"0.01";
    order.showUrl = @"m.alipay.com";
    
    //应用注册scheme,在AlixPayDemo-Info.plist定义URL types
    NSString *appScheme = @"zqhcmobileshow";
    
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
            if (resultStatus.intValue==9000)
            {
                //支付成功
                MYLOG(@"支付成功");
            }
        }];
    }
}


- (NSString *)generateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789abcdefghijklmnopqrst";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}


//将订单号使用md5加密
-(NSString *) wxmd5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16]= "0123456789abcdef";
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
//产生随机数
- (NSString *)getOrderNumber{
    int random = arc4random()%10000;
    return [self wxmd5:[NSString stringWithFormat:@"%d",random]];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark md5加密
- (NSString *)md5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result); // This is the md5 call
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

- (NSString *)sendGenerateTradeNO
{
    static int kNumber = 15;
    
    NSString *sourceStr = @"0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand(time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}






@end
