//
//  BaseViewController.h
//  ScreenShotBack
//
//  Created by 郑文明 on 16/5/10.
//  Copyright © 2016年 郑文明. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
@property (nonatomic, assign) BOOL enablePanGesture;//是否支持拖动pop手势，默认yes,支持手势
@property (nonatomic, assign) NSString * address_base; //当前所在位置
//导航栏标题
-(void)navTitle:(NSString *)str;
- (void)checkNetWork;
- (void)showNoNetWorkUI;

-(void)createAlipMutableArray:(NSMutableArray *)alipMutabArry Model:(NSObject*)model nameStr:(NSString *)nameStr ModelName:(NSString *)modelName priceStr:(float)priceStr paystatu:(int)paystatus className:(NSString *)className;

-(void)createOrderID:(NSString *)OrderID shoppingMutabArr:(NSMutableArray *)shoppingMutabArr shoppingName:(NSString *)shoppingName shoppingTwoName:(NSString *)shoppingTwoName allprice:(NSString *)allprice modelName:(NSString *)modelName leistr:(SEL)leistr;
-(void)DangqianWeizi;

@end
