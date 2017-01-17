//
//  JDLDetailTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLDetailModel.h"
#import "JDLDetailTwoModel.h"
@protocol JDLDetailTableViewCellDelegate1 <NSObject>

- (void)pushToModel1Detail:(NSString *)id_hot;

@end


@protocol JDLDetailTableViewCellDelegate2 <NSObject>

- (void)pushToModel2Detail:(NSString *)detailTwoName;

@end


@interface JDLDetailTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *bgView1;

@property (weak, nonatomic) IBOutlet UIImageView *imageView1;


@property (weak, nonatomic) IBOutlet UIView *bgView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;


-(void)setDetailModel:(JDLDetailModel*)jdldetailModel;
-(void)setDetailTwoModel:(JDLDetailTwoModel*)jdldetailtwoModel;


@property(nonatomic,strong)id<JDLDetailTableViewCellDelegate1>delegate1;
@property(nonatomic,strong)id<JDLDetailTableViewCellDelegate2>delegate2;
@end
