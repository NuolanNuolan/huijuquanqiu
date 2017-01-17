//
//  JDLDayTuiJianTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/31.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLDayDetileModel.h"
@protocol JDLDayTuiJianCellDelegate <NSObject>

- (void)sendDayDetileModel:(NSString  *)model;

@end

@interface JDLDayTuiJianTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *view1;
@property (weak, nonatomic) IBOutlet UIView *view2;
@property (weak, nonatomic) IBOutlet UIView *view3;



@property (weak, nonatomic) IBOutlet UIImageView *dayImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *dayImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *dayImageView3;

@property (weak, nonatomic) IBOutlet UILabel *dayLab1;
@property (weak, nonatomic) IBOutlet UILabel *dayPriceLab1;
@property (weak, nonatomic) IBOutlet UILabel *dayAreaLab1;


@property (weak, nonatomic) IBOutlet UILabel *daylab2;
@property (weak, nonatomic) IBOutlet UILabel *daypriceLab2;
@property (weak, nonatomic) IBOutlet UILabel *dayAreaLab2;

@property (weak, nonatomic) IBOutlet UILabel *daylab3;
@property (weak, nonatomic) IBOutlet UILabel *dayPriceLab3;
@property (weak, nonatomic) IBOutlet UILabel *dayAreaLab3;


@property(nonatomic,strong)JDLDayDetileModel *model1;
@property(nonatomic,strong)JDLDayDetileModel *model2;
@property(nonatomic,strong)JDLDayDetileModel *model3;

@property(nonatomic,strong)id<JDLDayTuiJianCellDelegate>delegate;
@end
