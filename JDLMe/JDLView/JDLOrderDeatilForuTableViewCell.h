//
//  JDLOrderDeatilForuTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/29.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLOrderinfoModel.h"
@interface JDLOrderDeatilForuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *Ordeinfo_allCount;

@property (weak, nonatomic) IBOutlet UILabel *Ordeinfo_allPrice;
@property (weak, nonatomic) IBOutlet UILabel *Ordeinfo_orderid;

@property (weak, nonatomic) IBOutlet UILabel *Ordeinfo_alipayID;

@property (weak, nonatomic) IBOutlet UILabel *Ordeinfo_Createtime;

@property (weak, nonatomic) IBOutlet UILabel *Ordeinfo_Paytime;

@property (weak, nonatomic) IBOutlet UILabel *Ordeinfo_FaHuoTime;

@property (weak, nonatomic) IBOutlet UIButton *alipayBtn;

-(void)setOrderinfomodel:(JDLOrderinfoModel*)Orderinfomodel;
@end
