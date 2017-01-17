//
//  JDLCategorTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/30.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLCategoryModel.h"
@interface JDLCategorTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *goodView1;
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView1;


@property (weak, nonatomic) IBOutlet UIView *goodView2;

@property (weak, nonatomic) IBOutlet UIImageView *goodImageView2;


@property (weak, nonatomic) IBOutlet UIView *goodView3;
@property (weak, nonatomic) IBOutlet UIImageView *goodImageView3;

- (void)configCategoryUI:(JDLCategoryModel *)Categorymodel;
@end
