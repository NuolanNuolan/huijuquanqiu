//
//  JDLOrderinfoModel.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/20.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "HUBObject.h"

@interface JDLOrderinfoModel : HUBObject
@property(nonatomic,strong)NSString *order_id;
//用户id
@property(nonatomic,strong)NSString *user_id;
//商品总数量
@property(nonatomic,strong)NSString *allshop_count;
//订单状态(0表示订单未确认//1表示订单已经确认//2表示订单已经取消)
@property(nonatomic,strong)NSString *order_status;
//#订单支付状态(0表示未付款//2表示已付款)
@property(nonatomic,strong)NSString *pay_status;
//(1表示已发货//2表示已收货//3表示已配货)
@property(nonatomic,strong)NSString *shipping_status;
//#商品收货人
@property(nonatomic,strong)NSString *consignee;
//国家
@property(nonatomic,strong)NSString *country;
//省
@property(nonatomic,strong)NSString *province;
//城市
@property(nonatomic,strong)NSString *city;
//区
@property(nonatomic,strong)NSString *district;
//地址
@property(nonatomic,strong)NSString *address;
//
@property(nonatomic,strong)NSString *sign_building;
//zipcode
@property(nonatomic,strong)NSString *zipcode;
//电话
@property(nonatomic,strong)NSString *tel;
//邮箱
@property(nonatomic,strong)NSString *email;
//手机号码
@property(nonatomic,strong)NSString *mobile;
//派送时间
@property(nonatomic,strong)NSString *time_best;
//留言
@property(nonatomic,strong)NSString *postscript;
//配送方式
@property(nonatomic,strong)NSString *shipping_id;
//#配送方式名称
@property(nonatomic,strong)NSString *shipping_name;
//支付方式
@property(nonatomic,strong)NSString *pay_id;
@property(nonatomic,strong)NSString *pay_name;
//订单金额
@property(nonatomic,strong)NSString *goods_amount;
//运费
@property(nonatomic,strong)NSString *shipping_fee;
//保险费
@property(nonatomic,strong)NSString *insure_fee;
//#包装费
@property(nonatomic,strong)NSString *pack_fee;
//应支付的订单总金额
@property(nonatomic,strong)NSString *order_amount;

@end













