//
//  JDLNineTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLLovedModel.h"

@protocol JDLNineTableViewCellDelegate1 <NSObject>

- (void)pushToNineModelSecond:(NSString *)pid;

@end



@interface JDLNineTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *nieeBgView1;
@property (weak, nonatomic) IBOutlet UIImageView *imageView1;
@property (weak, nonatomic) IBOutlet UILabel *commodityLab1;
@property (weak, nonatomic) IBOutlet UILabel *priceLab1;
@property (weak, nonatomic) IBOutlet UILabel *presentLab1;
@property (weak, nonatomic) IBOutlet UIButton *disBtn1;
@property (weak, nonatomic) IBOutlet UIButton *disBtn2;


@property (weak, nonatomic) IBOutlet UIView *nineBgView2;
@property (weak, nonatomic) IBOutlet UIImageView *imageView2;
@property (weak, nonatomic) IBOutlet UILabel *commodityLab2;
@property (weak, nonatomic) IBOutlet UILabel *priceLab2;
@property (weak, nonatomic) IBOutlet UILabel *presentLab2;

-(void)setNinemodel:(JDLLovedModel*)jdlNineModel andindex:(NSInteger)row;

@property(nonatomic,strong)id<JDLNineTableViewCellDelegate1>delegate;
@end
