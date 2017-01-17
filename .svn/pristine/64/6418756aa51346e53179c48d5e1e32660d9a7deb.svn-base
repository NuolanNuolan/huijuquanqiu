//
//  JDLOrderDeatilViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/28.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLOrderDeatilViewController.h"
#import "JDLOrderDeatilOneTableViewCell.h"
#import "JDLOrderDeatilTwoTableViewCell.h"
#import "JDLOrderDeatilThereTableViewCell.h"
#import "JDLOrderDeatilForuTableViewCell.h"
#import "JDLBuyViewController.h"
#import "JDLShoppingViewController.h"
#import "JDLOrderinfoModel.h"
#import "JDLPayModel.h"
#import "JDLBuyView.h"
#import "JDLStoreViewController.h"


#import "AFNetworking.h"
#import "getIPhoneIP.h"
#import "DataMD5.h"
#import "DataSigner.h"
#import "XMLDictionary.h"
#import "Order.h"
#import <AlipaySDK/AlipaySDK.h>

#define AliPaypartner_rsa_private @"MIICXQIBAAKBgQDOXvO83hbcLu5/UXdiSzn2oBppvkL8zqNU7L9Tb8qiZvppi3DDI3Sc9dQFDEn1A2B3mtvSqqgybfrTRVN7DwpvtK9V+FJ2oQZGpktx7fERQcVhmxjJbdL2wzvUbNBBLqMyppFmV1nNnCaqw7ZMFJA7jvD6LdSGYegeuWOYwQkpoQIDAQABAoGASXVDDVeAi5+pBWjaNgLQ/xi+TiWLcrGbMf+Tmv+QAX7mY+temBdmyvg2IBXfvXcWP3zAApz8gfbj8ZAbxxHzhGwBA1OHetwpr3PkDeJfMJ7r/0FoIbS817tO2zggHRruTkQUqP5noLBCAVoIeVjomCNJzxQ0DDUJBix08JyJ/oECQQDqwXsM7uIAesRo6Z0R6oNXeHhamqPM1YEM7hQ1wBEsNsSq3Z4L4J1yKlOvSPbsfvRAPRBc/1PcOEfc8YXl4mpLAkEA4QvjHz4y9ofen36bjITEA/kAogksr8FGCij7fEtNNetzZmy0EbMj9lWxuV4FE1PQIbtv+6QHlI3UKs8qMT8IQwJAAzS3OHr+rSEAE6q1EWyRdJ1Zj2szN3Xm+EU8E2vXEDKDRw4VvXXI0KlRUUB+1sX5EfODiLGX9Jb0LElEGdqYtwJBAJVFWzsH+KnJaYMFaYuFLLct3Jud1kQlwJ1Qna7OC8KuD/dqNu5ekoX8RUwc7uTo/O7C8v5IyLZidM6IZwYPNx0CQQDhSFFagBUJq+rstqfogS19Y0Yr1CSzY1UOLT5sCyfC9EDbVEXhU141a8SUcy+hWtJ4zMS2rKGfGtkFfIXVGuON"
#define AliPaynotify_url @"http://phoinix.cn:8088/payment/verify"
#define AliPaypartner @"2088221704197690"
#define AliPayseller_id @"1098463094@qq.com"


@interface JDLOrderDeatilViewController ()<UITableViewDataSource,UITableViewDelegate,JDLPaymodel_store_shopdelegate>
{

    //两个订单model
    //    订单的model
    JDLPayModel *_payModel;
    //    订单的客户信息
    JDLOrderinfoModel *_orderinfoModel;
    //条件查询字典
    NSDictionary *_dic_Arr;
    //表格
    UITableView *_tableview;
    //卖家是否发货
    UILabel *lable_FaHuo;
    //剩余确认时间
//    UILabel *lable_Time;
    //订单ID
    NSString *_Order_ID;
//    按钮的名字
    NSString *_order_butName;
    //装商品数组
    NSMutableArray *_Order_goods;
    
    
    NSString *outTradeNo;
    NSString *resultStatus;
    int _paystatus;

}

@end

@implementation JDLOrderDeatilViewController
- (id)initWith_Order_ID:(NSString *)Order_ID andOrder:(NSString *)butName
{
    
    self = [super init];
    if (self) {
        _Order_ID =Order_ID;
        
        _order_butName = butName;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Dismiss];
    dismiss_w;
    //上部分视图
    [self CreateTableview];
    [self Loaddata];
    // Do any additional setup after loading the view.
}
-(void)Dismiss
{
    //关闭滑动返回手势
    self.enablePanGesture=NO;
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1];
    self.title = @"订单详情";
//    返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    
}

-(void)createViewClick
{
    JDLBuyViewController *buyVc =[[JDLBuyViewController alloc]init];
    JDLShoppingViewController *shopVc = [[JDLShoppingViewController alloc]init];
    for (UIViewController *controller in self.navigationController.viewControllers) {
        if ([controller isKindOfClass:[buyVc class]]) {
            [self.navigationController popToViewController:controller animated:YES];
            return;
        }else if([controller isKindOfClass:[shopVc class]])
        {
            [self.navigationController popToViewController:controller animated:YES];
            return;
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark 加载数据
-(void)Loaddata
{
    _payModel = [[JDLPayModel alloc]init];
    _orderinfoModel = [[JDLOrderinfoModel alloc]init];
    //    NSString *str = [NSString stringWithFormat:@"order_id='%@'",_Order_ID];
    NSString *str = [NSString stringWithFormat:@"order_id='%@'",_Order_ID];

    _dic_Arr = @{@"where":str};
    
     [MBProgressHUD showMessage:@"加载中" toView:self.view];
    [JDLOrderinfoModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
        if (error==nil) {
            if (objects.count>0) {
                _orderinfoModel = [objects objectAtIndex:0];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_tableview reloadData];
                });
                [self Loaddata_goods];
            }
            else
            {
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [MBProgressHUD showError:@"服务器繁忙"];
            }
            
        }else
        {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showError:@"服务器繁忙"];
            
        }
    }];
}
-(void)Loaddata_goods
{

    [JDLPayModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
        if (error==nil) {
            if (objects.count>0) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                _payModel = [objects objectAtIndex:0];
                _Order_goods = [NSMutableArray arrayWithArray:objects];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_tableview reloadData];
                });
            }
            else
            {
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [MBProgressHUD showError:@"服务器繁忙"];
            }
            
        }else
        {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showError:@"服务器繁忙"];
            
        }
    } ];
}



-(void)createaliPay{

    [self createOrderID:_orderinfoModel.order_id shoppingMutabArr:_Order_goods shoppingName:_payModel.goods_name shoppingTwoName:nil allprice:_payModel.goods_amount modelName:nil leistr:nil];
    if (resultStatus.intValue==9000)
    {
        _orderinfoModel.pay_status = @"2";
        [_orderinfoModel saveObjectWithCompletion:^(id object, NSError *error) {
            if (error == nil) {
                //支付成功
                MYLOG(@"00000支付成功");
                [self Loaddata];
            }
        }];
        //                [self createLoadData];
    }
    else{
        
        MYLOG(@"9000支付失败");
        _paystatus = 0;
        [MBProgressHUD showError:@"付款失败" toView:self.view];
        //                [self createLoadData];
        
    }
}



-(void)CreateTableview
{
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.backgroundColor = [UIColor clearColor];
    _tableview.showsVerticalScrollIndicator =NO;
//    _tableview.scrollEnabled =NO;
    [self.view addSubview:_tableview];
}
#pragma mark 实现协议方法

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row == 0) {
        static NSString *ID = @"cEllname";
        JDLOrderDeatilOneTableViewCell *cell0 = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell0) {
            cell0 =[[[NSBundle mainBundle]loadNibNamed:@"JDLOrderDeatilOneTableViewCell" owner:self options:nil]lastObject];
        }
        if (_orderinfoModel) {
            if ([_orderinfoModel.pay_status isEqualToString:@"0"]) {
                cell0.Order_image.image = [UIImage imageNamed:@"icon_PaymentsCancelled"];
                cell0.Order_state1.text = @"付款失败,请您尽快完成付款.";
                cell0.Order_state1.textColor = [UIColor redColor];
            }else if([_orderinfoModel.pay_status isEqualToString:@"2"])
            {
            
                cell0.Order_state1.text = @" 付款成功,商家正在处理您的订单";
            }
        }
        cell0.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell0;
        
    }else if(indexPath.row==1){
        static NSString *ID = @"cEllname";
        JDLOrderDeatilTwoTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell1) {
            cell1 =[[[NSBundle mainBundle]loadNibNamed:@"JDLOrderDeatilTwoTableViewCell" owner:self options:nil]lastObject];
        }
        if (_orderinfoModel) {
            cell1.name.text = [NSString stringWithFormat:@"收件人:%@", _orderinfoModel.consignee];
            cell1.phone.text = [NSString stringWithFormat:@"手机号:%@", _orderinfoModel.tel];
            cell1.address.text=[NSString stringWithFormat:@"收货地址:%@%@%@%@",_orderinfoModel.province,_orderinfoModel.city,_orderinfoModel.district,_orderinfoModel.address];
        }
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
    }
    else if(indexPath.row>1&&indexPath.row<_Order_goods.count+2){
        static NSString *ID = @"cEllname";
        JDLOrderDeatilThereTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:ID];
        if (!cell2) {
            cell2 =[[[NSBundle mainBundle]loadNibNamed:@"JDLOrderDeatilThereTableViewCell" owner:self options:nil]lastObject];
        }
        cell2.delegate =self;
        if (_Order_goods!=nil) {
            [cell2 setPayModel:[_Order_goods objectAtIndex:indexPath.row-2]];
        }
        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell2;
    }
    else {
        static NSString *ID = @"cEllname";
        JDLOrderDeatilForuTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:ID];
        
        if (!cell3) {
            cell3 =[[[NSBundle mainBundle]loadNibNamed:@"JDLOrderDeatilForuTableViewCell" owner:self options:nil]lastObject];
        }
        if (_orderinfoModel) {
            
            [cell3 setOrderinfomodel:_orderinfoModel];
            if ([_orderinfoModel.pay_status isEqualToString:@"0"]) {
                [cell3.alipayBtn setTitle:@"付款" forState:UIControlStateNormal];
                [cell3.alipayBtn addTarget:self action:@selector(aliPayBtn:) forControlEvents:UIControlEventTouchUpInside];
            }
            else if ([_orderinfoModel.pay_status isEqualToString:@"2"]){
                [cell3.alipayBtn setTitle:@"确认收货" forState:UIControlStateNormal];
                cell3.alipayBtn.tag = 200;
                [cell3.alipayBtn addTarget:self action:@selector(aliPayBtn:) forControlEvents:UIControlEventTouchUpInside];
                
            }
            
        }
        cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell3;
    }
    
}


-(void)aliPayBtn:(UIButton *)sender{
    if (sender.tag == 200) {
        MYLOG(@"确认收货");
    }else{
        [self createaliPay];
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UIView * view  = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, 35)];
    view.backgroundColor = [UIColor redColor];
    
    lable_FaHuo = [[UILabel alloc]initWithFrame:CGRectMake(47, 11, 200, 13)];
    lable_FaHuo.font = [UIFont systemFontOfSize:13.0f];
    lable_FaHuo.textColor =[UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    [view addSubview:lable_FaHuo];
    
//    lable_Time = [[UILabel alloc]initWithFrame:CGRectMake(117, 15, 150, 10)];
//    
//    lable_Time.font = [UIFont systemFontOfSize:9.0f];
//    lable_Time.textColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
//    [view addSubview:lable_Time];
    if (_orderinfoModel) {
        if ([_orderinfoModel.pay_status isEqualToString:@"0"]) {
            
            lable_FaHuo.text = @"付款失败,请尽快完成付款";
            
        }else if([_orderinfoModel.pay_status isEqualToString:@"2"])
        {
            
            lable_FaHuo.text = @"付款成功,等待商家发货";
            
        }
    }
    
    return view;
}
//头
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 35;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if(_Order_goods.count>1)
    {
        return 3+_Order_goods.count;
        
    }else
    {
    
         return 4;
    }
   
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        return 82;
    }else if (indexPath.row==1)
    {
        return 69;
    } else if(indexPath.row>1&&indexPath.row<_Order_goods.count+2)
    {
        return 160;

    }else
    {
    
        return 194;
    }
    
}
//跳转
-(void)push_store_shop:(NSString *)str Andstore_type:(NSString *)type
{


    if ([type isEqualToString:@"shop"]) {
        JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:str];
        [self.navigationController pushViewController:buyVc animated:YES];
    }else if([type isEqualToString:@"store"]){
    
        JDLStoreViewController *store = [[JDLStoreViewController alloc]initWith_StoreID:str];
        
        [self.navigationController pushViewController:store animated:YES];
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
