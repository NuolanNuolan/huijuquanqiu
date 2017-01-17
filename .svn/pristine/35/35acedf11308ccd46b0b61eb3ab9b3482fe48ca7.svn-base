//
//  JDLBuyDetileViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLBuyDetileViewController.h"
#import "JDLOrderdetailsTableViewCell.h"
#import "JDLOrderdetileTwoTableViewCell.h"
#import "AddrListViewController.h"
#import "JDLChooseAddViewController.h"
#import "JDLOrderinfoModel.h"
#import "JDLOrderDeatilViewController.h"
#import "JDLAddTableViewCell.h"
#import "JDLPayViewController.h"
#import "Address.h"
#import "UIImageView+AFNetworking.h"
#import "Order.h"
#import "DataSigner.h"
#import <AlipaySDK/AlipaySDK.h>
#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
#import "WXApi.h"
#import "AFNetworking.h"
#import "getIPhoneIP.h"
#import "DataMD5.h"
#import "DataSigner.h"
#import "XMLDictionary.h"
#import "JDLPayModel.h"


#define Wechatnotify_url @"http://phoinix.cn:8088/payment/verify"
#define WechatAppid @"wxa8235233746fd58d"
#define WechatAppKey @"2878950da9ddbf2f03e2839d6e3d7a05"
#define Wechatsecret_key @"pWfauLw1xIJN24jQi9mbDv6V0FO5BkZc"
#define Wechatmch_id @"1349174101"

#define AliPaypartner_rsa_private @"MIICXQIBAAKBgQDOXvO83hbcLu5/UXdiSzn2oBppvkL8zqNU7L9Tb8qiZvppi3DDI3Sc9dQFDEn1A2B3mtvSqqgybfrTRVN7DwpvtK9V+FJ2oQZGpktx7fERQcVhmxjJbdL2wzvUbNBBLqMyppFmV1nNnCaqw7ZMFJA7jvD6LdSGYegeuWOYwQkpoQIDAQABAoGASXVDDVeAi5+pBWjaNgLQ/xi+TiWLcrGbMf+Tmv+QAX7mY+temBdmyvg2IBXfvXcWP3zAApz8gfbj8ZAbxxHzhGwBA1OHetwpr3PkDeJfMJ7r/0FoIbS817tO2zggHRruTkQUqP5noLBCAVoIeVjomCNJzxQ0DDUJBix08JyJ/oECQQDqwXsM7uIAesRo6Z0R6oNXeHhamqPM1YEM7hQ1wBEsNsSq3Z4L4J1yKlOvSPbsfvRAPRBc/1PcOEfc8YXl4mpLAkEA4QvjHz4y9ofen36bjITEA/kAogksr8FGCij7fEtNNetzZmy0EbMj9lWxuV4FE1PQIbtv+6QHlI3UKs8qMT8IQwJAAzS3OHr+rSEAE6q1EWyRdJ1Zj2szN3Xm+EU8E2vXEDKDRw4VvXXI0KlRUUB+1sX5EfODiLGX9Jb0LElEGdqYtwJBAJVFWzsH+KnJaYMFaYuFLLct3Jud1kQlwJ1Qna7OC8KuD/dqNu5ekoX8RUwc7uTo/O7C8v5IyLZidM6IZwYPNx0CQQDhSFFagBUJq+rstqfogS19Y0Yr1CSzY1UOLT5sCyfC9EDbVEXhU141a8SUcy+hWtJ4zMS2rKGfGtkFfIXVGuON"
#define AliPaynotify_url @"http://phoinix.cn:8088/payment/verify"
#define AliPaypartner @"2088221704197690"
#define AliPayseller_id @"1098463094@qq.com"
@interface JDLBuyDetileViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIActionSheetDelegate>
{
//    结算的lab
    UILabel *_pricelab;
    //总价
    float allPrice;
    Address *_tenModel;
    UITableView *_buyDetileTab;
    UITextField *_text;
    UIImageView *_imageView;
    UIButton *_addbtn;
    UITextField *_countText;
    UIButton *_reduceBtn;
    UILabel *_lab;
    UILabel *_numLab;
    
    NSString *outTradeNo;
    NSString *resultStatus;
    NSString *wxOut_trade_no;
    //    订单的model
    JDLPayModel *_payModel;
//    订单的客户信息
    JDLOrderinfoModel *_orderinfoModel;
    //    头部视图
    JDLOrderdetailsTableViewCell *_Orderdetailscell;
    //购物车传过来的数组
    NSMutableArray *_shopcartmodelarr;
    //总价
    int _allprice ;
    //总共几件商品
    int _count_shop;
    //model
    JDLSureCartModel *_shopmodel_cart;
//    订单支付状态
    int _paystatus;
    int k;
//    地址
    NSDictionary *_dicAdd;
}
@property(nonatomic,strong)NSString *OpusID;
@property(nonatomic,strong)NSString *amount;
@property (nonatomic,strong) NSDictionary *wxDic;
@property(nonatomic) int stock;
@end

@implementation JDLBuyDetileViewController
- (id)initWith_shopcartmodel:(NSMutableArray *)shopcartmodel andallprice:(int)allprice
{
    
    self = [super init];
    if (self) {
        _shopcartmodelarr = shopcartmodel;
        _allprice = allprice;
    }
    return self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    [_buyDetileTab reloadData];
    _dicAdd = [[NSUserDefaults standardUserDefaults]objectForKey:@"ADDRESS"];
    if (_dicAdd) {
        _Orderdetailscell.nameLab.text = [NSString stringWithFormat:@"收货人:%@",[_dicAdd objectForKey:@"name"]];
        _Orderdetailscell.phoneLab.text = [NSString stringWithFormat:@"手机号:%@",[_dicAdd objectForKey:@"tel"]];
        _Orderdetailscell.orderAddLab.text = [NSString stringWithFormat:@"地址:%@%@",[_dicAdd objectForKey:@"area"],[_dicAdd objectForKey:@"address"]];
        _Orderdetailscell.orderAddLab.textColor = [UIColor blackColor];
        
    }
    else
    {
        _Orderdetailscell.orderAddLab.text = @" 您还没有默认的地址";
        _Orderdetailscell.orderAddLab.textColor = [UIColor colorWithRed:255/255.0f green:59/255.0f blue:18/255.0f alpha:1];
        
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //	[self.tabBarController.tabBar setHidden:YES];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"确认订单";
    [self All_price];
    [self createNavLeftItem];
    [self createTebView];
    [self createFootView];
    [self createKeyBord];
//    dismiss_w;
    
    //接收支付宝支付成功的回调
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPaySuccess:) name:@"WXPaySuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getOrderPayFailed:) name:@"WXPayFailed" object:nil];
    
}
//总价
-(void)All_price{
    
    _shopmodel_cart = [[JDLSureCartModel alloc]init];
    if (_shopcartmodelarr.count>0) {
        allPrice = _allprice  ;
        for (int i = 0; i<_shopcartmodelarr.count; i++) {
            _shopmodel_cart = [_shopcartmodelarr objectAtIndex:i];
            _count_shop = _count_shop+ [_shopmodel_cart.buy_amount intValue];
        }
    }
    else
    {
        
        NSString *number = [NSString stringWithFormat:@"%@",_detileModel.buy_amount];
        int i = [number intValue];
        allPrice = i*[_detileModel.price intValue];
        
        _count_shop = [_detileModel.buy_amount intValue];
    }
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
//-(void)loaddata
//{
//     dic = [[NSUserDefaults standardUserDefaults]objectForKey:@"ADDRESS"];
//}
#pragma mark - 设置左边返回按钮
-(void)createNavLeftItem{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    
}

-(void)createViewClick
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)createTebView{
    _buyDetileTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
    _buyDetileTab.delegate = self;
    _buyDetileTab.dataSource = self;
    _buyDetileTab.separatorStyle = UITableViewCellSeparatorStyleNone;
    _buyDetileTab.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_buyDetileTab];
    
    _Orderdetailscell = [[[NSBundle mainBundle] loadNibNamed:@"JDLOrderdetailsTableViewCell" owner:self options:nil] lastObject];
    _buyDetileTab.tableHeaderView = _Orderdetailscell;
    NSDictionary *dic = [[NSUserDefaults standardUserDefaults]objectForKey:@"ADDRESS"];
    if (dic) {
        _Orderdetailscell.nameLab.text = [NSString stringWithFormat:@"收货人:%@",[dic objectForKey:@"name"]];
        _Orderdetailscell.phoneLab.text = [NSString stringWithFormat:@"手机号:%@",[dic objectForKey:@"tel"]];
        _Orderdetailscell.orderAddLab.text = [NSString stringWithFormat:@"地址:%@%@",[dic objectForKey:@"area"],[dic objectForKey:@"address"]];
        _Orderdetailscell.orderAddLab.textColor = [UIColor blackColor];
        
    }
    else
    {
        _Orderdetailscell.orderAddLab.text = @" 您还没有默认的地址";
        _Orderdetailscell.orderAddLab.textColor = [UIColor colorWithRed:255/255.0f green:59/255.0f blue:18/255.0f alpha:1];
    }
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick)];
    [_Orderdetailscell.orderTwoView addGestureRecognizer:tap1];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (_shopcartmodelarr.count>0) {
        return _shopcartmodelarr.count;
    }
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"cellName";
    JDLOrderdetileTwoTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell2) {
        cell2 = [[[NSBundle mainBundle] loadNibNamed:@"JDLOrderdetileTwoTableViewCell" owner:self options:nil] lastObject];
    }
    if(_shopcartmodelarr.count>0)
    {
        _shopmodel_cart = [_shopcartmodelarr objectAtIndex:indexPath.row];
        [cell2 shopcartmodel:_shopmodel_cart];
    }
    else
    {
                cell2.orderColourLab.text =[NSString stringWithFormat:@"%@;%@",_detileModel.size,_detileModel.color] ;
                cell2.orderPriceLab.text = [NSString stringWithFormat:@"￥%@",_detileModel.price];
                cell2.orderShopLab.text = _detileModel.store_name;
                cell2.orderNameLab.text = _detileModel.pname;
                cell2.orderNumLab.text = [NSString stringWithFormat:@"x%@",_detileModel.buy_amount];
                [cell2.orderDetileImage sd_setImageWithURL:  [NSURL URLWithString: _detileModel.pimg] ];
    }
    cell2.orderTextFiled.delegate =self;
    _text = cell2.orderTextFiled;
    cell2.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell2;
}

//点击地址跳转
-(void)tapClick{
    
    JDLChooseAddViewController *choose = [[JDLChooseAddViewController alloc]init];
    //跳转事件
    [self.navigationController pushViewController:choose animated:YES];
}



-(void)createFootView{
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, screen_Height -60 , screen_Width, 60)];
    footView.backgroundColor = [UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1];
    UIButton *jsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jsBtn.frame = CGRectMake(screen_Width-130, 0, 130, 60);
    [jsBtn setTitle:@"结算" forState:UIControlStateNormal];
    [jsBtn addTarget:self action:@selector(payClick) forControlEvents:UIControlEventTouchUpInside];
    jsBtn.backgroundColor = [UIColor redColor];
    [footView addSubview:jsBtn];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width - jsBtn.frame.size.width-100-80, 22, 100, 20)];
    _lab.text = [NSString stringWithFormat:@"共%d件商品",_count_shop];
    _lab.font = [UIFont systemFontOfSize:15.0f];
    _lab.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
    [footView addSubview:_lab];
    
    if (screen_Width == iphone5_width) {
       
        _pricelab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width - jsBtn.frame.size.width-105, 17, 105, 30)];
        _pricelab.font = [UIFont systemFontOfSize:13.0f];
    }
    else{
        _pricelab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width - jsBtn.frame.size.width-110, 17, 110, 30)];
        _pricelab.font = [UIFont systemFontOfSize:15.0f];
    }
    
    NSString *contentStr = [NSString stringWithFormat:@"实付:￥%0.2f",allPrice];
    MYLOG(@"contentStr%@",contentStr);
    
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, contentStr.length-3)];
    _pricelab.attributedText = str;
    
    //    pricelab.textColor = [UIColor lightGrayColor];
    //    allPrice = [_detileModel.priceStr intValue];
    [footView addSubview:_pricelab];
    [self.view addSubview:footView];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 326;
}


-(void)createKeyBord{
    
    //    上升
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyBoard:) name:UIKeyboardWillShowNotification object:nil];
    //    下降
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyBoard:) name:UIKeyboardWillHideNotification object:nil];
}

-(void)hideKeyBoard:(NSNotification *)notify
{
    NSDictionary *userInfo = notify.userInfo;
    NSValue *value = userInfo[UIKeyboardFrameEndUserInfoKey];
    //    [UIView animateWithDuration:1 animations:^{
    CGPoint center = _buyDetileTab.center;
    center.y += [value CGRectValue].size.height-30;
    _buyDetileTab.center = center;
    //    }];
}

-(void)showKeyBoard:(NSNotification *)notifty
{
    
    NSDictionary *userInfo = notifty.userInfo;
    NSValue *value = userInfo[UIKeyboardFrameEndUserInfoKey];
    //    [UIView animateWithDuration:1 animations:^{
    //        CGPoint center = _buyDetileTab.center;
    //        center.y -= [value CGRectValue].size.height;
    //        _buyDetileTab.center = center;
    //    }];
    
    _buyDetileTab.frame = CGRectMake(0, -[value CGRectValue].size.height+30, screen_Width, screen_Height);
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    //    [self searchWithStr:searchText];
    [_text resignFirstResponder];
    [_countText resignFirstResponder];
    return NO;
}

-(void)payClick{
    if ([_Orderdetailscell.nameLab.text isEqualToString:@""]) {
        [MBProgressHUD showError:@"亲,你还没有收货地址哦"];
        return;
    }
     [self aliPayClick];
//    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"支付宝支付",@"微信支付", nil];
//    //手动添加按钮
//    //注意: 要在显示之前添加
//    //    [actionSheet addButtonWithTitle:@"女神"];
////    [self createLoadData];
//    [actionSheet showInView:self.view];
//    
//    //    JDLPayViewController *payVc = [[JDLPayViewController alloc]init];
//    //    [self.navigationController pushViewController:payVc animated:YES];
    
}

//-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
//{
//    if(buttonIndex == [actionSheet cancelButtonIndex])
//    {
//        MYLOG(@"%@",[actionSheet buttonTitleAtIndex:buttonIndex]);
//        MYLOG(@"%ld",(long)buttonIndex);
//    }
//    else if (buttonIndex == 0) {
//        [self aliPayClick];
//        
//        [self createAlipMutableArray:_shopcartmodelarr Model:_shopmodel_cart nameStr:_shopmodel_cart.pname ModelName:nil priceStr:allPrice paystatus:nil className:nil];
//
//        
//    }
//    else if (buttonIndex == 1){
//    
//        [self wechatClick];
//    }
//}




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
    if(_shopcartmodelarr.count>0)
    {
        _shopmodel_cart = [_shopcartmodelarr objectAtIndex:0];
        order.productName =[NSString stringWithFormat:@"%@等多件商品",_shopmodel_cart.pname];
        
    }else
    {
    
        order.productName = [NSString stringWithFormat:@"%@",_detileModel.pname]; //商品标题
    }
    
//        order.productDescription = [NSString stringWithFormat:@"%@",_detileModel.nameStr]; //商品描述
    NSString *stringFloat = [NSString stringWithFormat:@"%0.2f",allPrice];
    
    order.amount = [NSString stringWithFormat:@"%@",stringFloat]  ; //商品价格
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
            if (resultStatus.intValue==9000)
            {
                //支付成功
                MYLOG(@"00000支付成功");
                _paystatus = 2;
                [self createLoadData];
            }
            else{
            
                MYLOG(@"9000支付失败");
                _paystatus = 0;
                [self createLoadData];
                
            }
        }];
    }
}

-(void)createLoadData{

    _orderinfoModel = [[JDLOrderinfoModel alloc]init];
    //    商品的订单
    _orderinfoModel.order_id =  outTradeNo;
    //商品总数量
    _orderinfoModel.allshop_count = [NSString stringWithFormat:@"%d",_count_shop];
    _orderinfoModel.user_id = [[NSUserDefaults standardUserDefaults]objectForKey:@"PHONE"];
    //    _orderinfoModel.status_order =
    //    订单支付状态
    _orderinfoModel.pay_status = [NSString stringWithFormat:@"%d",_paystatus];
    //    收货人
    _orderinfoModel.consignee = [_dicAdd objectForKey:@"name"];
    _orderinfoModel.country = @"中国";
    NSArray *address =  [[_dicAdd objectForKey:@"area"]componentsSeparatedByString:@" "];
    if (address.count>2) {
        _orderinfoModel.province = [address objectAtIndex:0];
        _orderinfoModel.city =[address objectAtIndex:1];
        _orderinfoModel.district = [address objectAtIndex:2];
    }
    else
    {
        
        _orderinfoModel.province = @"";
        _orderinfoModel.city =[address objectAtIndex:0];
        _orderinfoModel.district = [address objectAtIndex:1];
    }
    //    地址
    _orderinfoModel.address =[_dicAdd objectForKey:@"address"];
    _orderinfoModel.tel =[_dicAdd objectForKey:@"tel"];;
    //    _orderinfoModel.email =
    //    _orderinfoModel.mobile =[[NSUserDefaults standardUserDefaults]objectForKey:@"TEL"];
    //    //派送时间
    //    _orderinfoModel.time_best =
    //    留言
    _orderinfoModel.postscript = _text.text;
    //    配送方式
    //    _orderinfoModel.shipping_id = @"";
    //    配送方式名称
    //    _orderinfoModel.shipping_name = @"";
//    发货状态（已配货等）
//    _orderinfoModel.shipping_status = @""
    //支付方式
    //    _orderinfoModel.pay_id =
    //支付方式名称
    //    _orderinfoModel.pay_name =
    //    订单金额
    _orderinfoModel.goods_amount = [NSString stringWithFormat:@"%0.2f",allPrice];
    //    运输费
    //    _orderinfoModel.shipping_fee =
    //    保险费
    _orderinfoModel.insure_fee = @"0";
    //    包装费
    _orderinfoModel.pack_fee = @"0";
    //    应支付的订单金额
    _orderinfoModel.order_amount = [NSString stringWithFormat:@"%0.2f",allPrice];
    
    
    [_orderinfoModel saveObjectWithCompletion:^(JDLOrderinfoModel *infoModel, NSError *error) {
        if (error == nil) {
            MYLOG(@"saveFeedback is %@", infoModel);
           
            //传goods
            [self Order_Goods];
        } else {
            // deal with error
            [MBProgressHUD showError:@"提交订单失败,请稍后再试" toView:self.view];
            MYLOG(@"save book error= %@", error);
        }
    }];
}
-(void)Order_Goods
{
    
    if (_shopcartmodelarr.count>0) {
        k=0;
        for (int i = 0; i<_shopcartmodelarr.count; i++) {
             _payModel = [[JDLPayModel alloc] init];
            _shopmodel_cart = [_shopcartmodelarr objectAtIndex:i];
            [self order_goodsmodel:_shopmodel_cart];
            [self del_shopmodel:_shopmodel_cart];
        }
    }
    else
    {
        [self order_goodsmodel:_detileModel];
        
    }
}
//上传商品model
-(void)order_goodsmodel:(JDLSureCartModel * )detileModel
{

    _payModel = [[JDLPayModel alloc] init];
    //    商品名字
    _payModel.goods_name = detileModel.pname;
    //    商品价格
    _payModel.shop_price = [NSString stringWithFormat:@"%0.2f",[detileModel.price floatValue]];
    //    商品总价
    _payModel.goods_amount = [NSString stringWithFormat:@"%0.2f",allPrice];
    //    市场价格
    _payModel.market_price = [NSString stringWithFormat:@"%0.2f",[detileModel.shop_price floatValue]];
    //    商品id
    _payModel.goods_id = detileModel.ID;
    //    商品数量
    _payModel.goods_number = detileModel.buy_amount;
    //    商品的订单
    _payModel.order_id =  outTradeNo;
    //    商品图片
    _payModel.pimg =[NSString stringWithFormat:@"%@",[NSURL URLWithString: detileModel.pimg]] ;
    //    商品尺寸
    _payModel.size = detileModel.size;
    _payModel.color = detileModel.color;
    //    店铺id
    _payModel.sid = detileModel.sid;
    //  店铺名字
    _payModel.store_name = detileModel.store_name;
    [_payModel saveObjectWithCompletion:^(JDLPayModel *payModel, NSError *error) {
        if (error == nil) {
            MYLOG(@"saveFeedback is %@", payModel);
            if (_shopcartmodelarr==nil) {
                JDLOrderDeatilViewController *orderdeatil = [[JDLOrderDeatilViewController alloc]initWith_Order_ID:outTradeNo andOrder:@"付款"];
                [self.navigationController pushViewController:orderdeatil animated:YES];
            }else
            {
                k = k+1;
                if (k==_shopcartmodelarr.count) {
                    JDLOrderDeatilViewController *orderdeatil = [[JDLOrderDeatilViewController alloc]initWith_Order_ID:outTradeNo andOrder:@""];
                    [self.navigationController pushViewController:orderdeatil animated:YES];
                    k=0;
                }
               
                
            }
            
        } else {
            // deal with error
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            MYLOG(@"save book error= %@", error);
            [MBProgressHUD showError:@"服务器繁忙,订单提交失败"];
        }
    }];
}
//提交订单删除购物车数据
-(void)del_shopmodel:(JDLSureCartModel *)cartmodel
{
    [cartmodel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
        if (error == nil) {
            MYLOG(@"seccecc");
        } else {
            MYLOG(@"save book error= %@", error);
            
        }
    }];
    
}
//微信支付
- (void)wechatClick
{
    //应用APPID
    NSString *appid = WechatAppid;
    //微信支付商户号
    NSString *mch_id = Wechatmch_id;
    ///产生随机字符串，这里最好使用和安卓端一致的生成逻辑
    NSString *nonce_str =[self generateTradeNO];
    MYLOG(@"nonce_str =%@",nonce_str);
    NSString *body =@"青币充值";
    //随机产生订单号用于测试，正式使用请换成你从自己服务器获取的订单号
    wxOut_trade_no = [self sendGenerateTradeNO];
    //交易价格1表示0.01元，10表示0.1元
    NSString *total_fee = @"1";
    MYLOG(@"total_fee = %@",total_fee);
    //获取本机IP地址，请再wifi环境下测试，否则获取的ip地址为error，正确格式应该是8.8.8.8
    NSString *spbill_create_ip = [getIPhoneIP getIPAddress];
    //交易结果通知网站此处用于测试，随意填写，正式使用时填写正确网站
    NSString *notify_url = Wechatnotify_url;
    NSString *trade_type = @"APP";
    //商户密钥
    NSString * partner = Wechatsecret_key;
    MYLOG(@"partner = %@",partner);
    //获取sign签名
    DataMD5 *data = [[DataMD5 alloc] initWithAppid:appid mch_id:mch_id nonce_str:nonce_str partner_id:partner body:body out_trade_no:wxOut_trade_no total_fee:total_fee spbill_create_ip:spbill_create_ip notify_url:notify_url trade_type:trade_type];
    NSString *sign = [data getSignForMD5];
    //设置参数并转化成xml格式
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:appid forKey:@"appid"];//公众账号ID
    [dic setValue:mch_id forKey:@"mch_id"];//商户号
    [dic setValue:nonce_str forKey:@"nonce_str"];//随机字符串
    [dic setValue:sign forKey:@"sign"];//签名
    [dic setValue:body forKey:@"body"];//商品描述
    [dic setValue:wxOut_trade_no forKey:@"out_trade_no"];//订单号
    [dic setValue:total_fee forKey:@"total_fee"];//金额
    [dic setValue:spbill_create_ip forKey:@"spbill_create_ip"];//终端IP
    [dic setValue:notify_url forKey:@"notify_url"];//通知地址
    [dic setValue:trade_type forKey:@"trade_type"];//交易类型
    MYLOG(@"dic = %@",dic);
    NSString *string = [dic XMLString];

    [self http:string];
}

- (void)http:(NSString *)xml{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //这里传入的xml字符串只是形似xml，但是不是正确是xml格式，需要使用af方法进行转义
    manager.responseSerializer = [[AFHTTPResponseSerializer alloc] init];
    [manager.requestSerializer setValue:@"text/xml; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer setValue:@"https://api.mch.weixin.qq.com/pay/unifiedorder" forHTTPHeaderField:@"SOAPAction"];
    [manager.requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, NSDictionary *parameters, NSError *__autoreleasing *error) {
        return xml;
    }];
    //发起请求
    [manager POST:@"https://api.mch.weixin.qq.com/pay/unifiedorder" parameters:xml success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSString *responseString = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding] ;
        MYLOG(@"responseString is %@",responseString);
        //将微信返回的xml数据解析转义成字典
        self.wxDic = [NSDictionary dictionaryWithXMLString:responseString];
        //判断返回的许可
        MYLOG(@"dic is %@",self.wxDic);
        if ([[self.wxDic objectForKey:@"result_code"] isEqualToString:@"SUCCESS"] &&[[self.wxDic objectForKey:@"return_code"] isEqualToString:@"SUCCESS"] )
        {
            //发起微信支付，设置参数
            PayReq *request = [[PayReq alloc] init];
            request.partnerId = [self.wxDic objectForKey:@"mch_id"];
            request.prepayId= [self.wxDic objectForKey:@"prepay_id"];
            request.package = @"Sign=WXPay";
            request.nonceStr= [self.wxDic objectForKey:@"nonce_str"];
            //将当前事件转化成时间戳
            NSDate *datenow = [NSDate date];
            NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
            UInt32 timeStamp =[timeSp intValue];
            request.timeStamp= timeStamp;
            DataMD5 *md5 = [[DataMD5 alloc] init];
            request.sign=[md5 createMD5SingForPay:WechatAppid partnerid:request.partnerId prepayid:request.prepayId package:request.package noncestr:request.nonceStr timestamp:request.timeStamp];
            //            调用微信
            [WXApi sendReq:request];
        }else{
            MYLOG(@"参数不正确，请检查参数");
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        MYLOG(@"error is %@",error);
    }];
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
