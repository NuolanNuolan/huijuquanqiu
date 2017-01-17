//
//  JDLRedOneTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/26.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLRed_oneModel.h"

@protocol Red_oneTableviewDelegate <NSObject>

-(void)Red_One:(NSInteger)index;

@end

@interface JDLRedOneTableViewCell : UITableViewCell
@property (nonatomic) NSInteger index;
@property (nonatomic,weak) id<Red_oneTableviewDelegate> delegate;
@property(nonatomic,strong)JDLRed_oneModel *Red_model;

@property (weak, nonatomic) IBOutlet UIView *View_One;

@end
