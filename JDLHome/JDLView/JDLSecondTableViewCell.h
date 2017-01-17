//
//  JDLSecondTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLSecondModel.h"
@class JDLSecondModel;
@protocol JDLSecondTableViewCellDelegate1 <NSObject>

- (void)pushToModel1Second:(NSString *)DayTJ_ID;

@end

@interface JDLSecondTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *detailView1;
@property (weak, nonatomic) IBOutlet UIImageView *detailView2;

@property (weak, nonatomic) IBOutlet UIImageView *detailView3;

-(void)setSecondmodel:(JDLSecondModel*)jdlsecondmodel;
@property(nonatomic,strong)id<JDLSecondTableViewCellDelegate1>delegate2;

@end
