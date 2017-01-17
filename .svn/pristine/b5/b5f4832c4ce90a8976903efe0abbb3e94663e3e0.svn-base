//
//  JDLAllShopingTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/25.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLAllShopingModel.h"
@protocol AllShopingCellDelegate <NSObject>

- (void)sendAllShopingModel:(JDLAllShopingModel *)model;

@end
@interface JDLAllShopingTableViewCell : UITableViewCell


@property (weak, nonatomic) IBOutlet UIView *allView1;
@property (weak, nonatomic) IBOutlet UIView *allView2;
@property (weak, nonatomic) IBOutlet UIView *allView3;
@property (weak, nonatomic) IBOutlet UIView *allView4;
@property (weak, nonatomic) IBOutlet UIView *allView5;


@property (weak, nonatomic) IBOutlet UIImageView *allImage1;
@property (weak, nonatomic) IBOutlet UIImageView *allImage2;
@property (weak, nonatomic) IBOutlet UIImageView *allImage3;
@property (weak, nonatomic) IBOutlet UIImageView *allImage4;
@property (weak, nonatomic) IBOutlet UIImageView *allImage5;


@property (nonatomic,strong)JDLAllShopingModel *model1;
@property (nonatomic,strong)JDLAllShopingModel *model2;
@property (nonatomic,strong)JDLAllShopingModel *model3;
@property (nonatomic,strong)JDLAllShopingModel *model4;
@property (nonatomic,strong)JDLAllShopingModel *model5;


@property(nonatomic,strong)id<AllShopingCellDelegate>delegate;
@end
