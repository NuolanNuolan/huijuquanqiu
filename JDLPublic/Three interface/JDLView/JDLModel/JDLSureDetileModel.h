//
//  JDLSureDetileModel.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/1.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JDLSureDetileModel : NSObject
@property(nonatomic,strong)NSURL *imageStr;
@property(nonatomic,strong)NSString *nameStr;
//尺码和颜色
@property(nonatomic,strong)NSString *typeStr;
@property(nonatomic,strong)NSString *colorStr;
//价格
@property(nonatomic,strong)NSString *priceStr;
@property(nonatomic,strong)NSString *numberStr;

//总价个
@property(nonatomic,strong)NSString *totalPrice;
@end
