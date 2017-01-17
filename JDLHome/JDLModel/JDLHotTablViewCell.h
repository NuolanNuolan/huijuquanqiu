//
//  JDLHotTablViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLHotSecondModel.h"
@protocol JDLHotQiangdelegate <NSObject>

- (void)Qiang_btn:(NSString  *)model;

@end

@interface JDLHotTablViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *hotImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *introduceLab;

@property (weak, nonatomic) IBOutlet UILabel *priceLab;
@property (weak, nonatomic) IBOutlet UILabel *originalPriceLab;
@property (weak, nonatomic) IBOutlet UIButton *quanBtn;
@property (weak, nonatomic) IBOutlet UIButton *qiangBtn;
@property (weak, nonatomic) IBOutlet UILabel *shop_add;

- (IBAction)qiang_btn:(UIButton *)sender;
@property(nonatomic,strong)JDLHotSecondModel *hotSecondModel;

@property(nonatomic,strong)id<JDLHotQiangdelegate>delegate;
@end
