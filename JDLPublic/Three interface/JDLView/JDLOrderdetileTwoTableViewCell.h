//
//  JDLOrderdetileTwoTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/3.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLSureCartModel.h"
@interface JDLOrderdetileTwoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *orderDetileTwoView;
@property (weak, nonatomic) IBOutlet UIImageView *orderDetileImage;
//尺码
@property (weak, nonatomic) IBOutlet UILabel *orderColourLab;

//价格
@property (weak, nonatomic) IBOutlet UILabel *orderPriceLab;
//数量
@property (weak, nonatomic) IBOutlet UILabel *orderNumLab;
//名字
@property (weak, nonatomic) IBOutlet UILabel *orderNameLab;

@property (weak, nonatomic) IBOutlet UIView *orderDetilTwosView;
//淘宝图片
@property (weak, nonatomic) IBOutlet UIImageView *tmImage;
//店铺名字
@property (weak, nonatomic) IBOutlet UILabel *orderShopLab;
@property (weak, nonatomic) IBOutlet UITextField *orderTextFiled;

//共几件商品
@property (weak, nonatomic) IBOutlet UILabel *orderDetileLab;
//总价
@property (weak, nonatomic) IBOutlet UILabel *orderPrileLab;
-(void)shopcartmodel:(JDLSureCartModel *)shopcartmodel;
@end
