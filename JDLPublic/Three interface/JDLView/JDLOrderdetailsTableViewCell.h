//
//  JDLOrderdetailsTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/3.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JDLOrderdetailsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *orderView;
@property (weak, nonatomic) IBOutlet UILabel *nameLab;
@property (weak, nonatomic) IBOutlet UILabel *phoneLab;

@property (weak, nonatomic) IBOutlet UIImageView *imageciew;


@property (weak, nonatomic) IBOutlet UIView *orderTwoView;
@property (weak, nonatomic) IBOutlet UILabel *orderAddLab;
@end
