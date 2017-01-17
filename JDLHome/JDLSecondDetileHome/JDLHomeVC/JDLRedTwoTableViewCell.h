//
//  JDLRedTwoTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/26.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLRed_oneModel.h"

@protocol Red_twoTableviewDelegate <NSObject>

-(void)Red_Two:(NSInteger)index;

@end


@interface JDLRedTwoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *View_Two;
@property (nonatomic) NSInteger index;
@property (nonatomic,weak) id<Red_twoTableviewDelegate> delegate;
@property(nonatomic,strong)JDLRed_oneModel *Red_model;

@end
