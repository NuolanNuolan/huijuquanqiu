//
//  JDLPublicDetileTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/18.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLDayTJModel.h"

@protocol JDLPublicDetileTableViewCellDelegate <NSObject>

-(void)BuyViewClick:(NSString *)shop_id;

@end

@interface JDLPublicDetileTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *fristView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *lab1;
@property (weak, nonatomic) IBOutlet UILabel *lab2;
@property (weak, nonatomic) IBOutlet UILabel *lab3;
@property (weak, nonatomic) IBOutlet UIButton *zheBtn1;



@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UILabel *lab4;
@property (weak, nonatomic) IBOutlet UILabel *lab5;
@property (weak, nonatomic) IBOutlet UILabel *lab6;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UIButton *zheBtn2;


@property(nonatomic,strong)JDLDayTJModel *model1;
@property(nonatomic,strong)JDLDayTJModel *model2;
@property(nonatomic,strong) id<JDLPublicDetileTableViewCellDelegate>delegate;
-(void)setTJmodel:(JDLDayTJModel *)model andsetTJmodel:(JDLDayTJModel *)model1;
@end
