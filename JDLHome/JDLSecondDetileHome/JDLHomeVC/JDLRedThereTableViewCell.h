//
//  JDLRedThereTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/26.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLRed_oneModel.h"

@protocol Red_thereTableviewDelegate <NSObject>

-(void)Red_There:(NSInteger)index;

@end
@interface JDLRedThereTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *View_There;
@property (nonatomic) NSInteger index;
@property (nonatomic,weak) id<Red_thereTableviewDelegate> delegate;
@property(nonatomic,strong)JDLRed_oneModel *Red_model;
@end
