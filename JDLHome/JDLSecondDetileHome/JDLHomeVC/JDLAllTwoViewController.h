//
//  JDLAllTwoViewController.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JDLAllshop_buydelegate <NSObject>

- (void)pushbuyview:(NSString *)allmodel_pid;

@end
@interface JDLAllTwoViewController : BaseViewController
//初始化方法传入ID
//- (id)initWith_AllShop_Arr:(NSMutableArray *)allShop_Arr;
@property(nonatomic,strong)NSMutableArray * shop_arr;
@property(nonatomic,strong)id<JDLAllshop_buydelegate>delegate;
@end
