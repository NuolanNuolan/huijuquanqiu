//
//  JDLBuyDetileViewController.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLSureDetileModel.h"
#import "JDLSureCartModel.h"
@interface JDLBuyDetileViewController : BaseViewController
@property(nonatomic,strong)JDLSureCartModel *detileModel;

- (id)initWith_shopcartmodel:(NSMutableArray *)shopcartmodel andallprice:(int)allprice;
@end
