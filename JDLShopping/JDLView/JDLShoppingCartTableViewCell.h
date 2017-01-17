//
//  JDLShoppingCartTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/12.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLSureCartModel.h"
@class JDLSureCartModel;
//添加代理，用于按钮加减的实现
@protocol JDLShoppingCartTableViewCellDelegate <NSObject>

//-(void)btnClick:(UITableViewCell *)cell andFlag:(int)flag;
-(void)btnClick:(JDLSureCartModel *)shopmodel andbtntag:(NSInteger )tag andcount:(NSInteger )count;

@end


@interface JDLShoppingCartTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *tickBtn;
@property (weak, nonatomic) IBOutlet UIImageView *goodImange;

@property (weak, nonatomic) IBOutlet UILabel *detileLab;

@property (weak, nonatomic) IBOutlet UILabel *detileGoodLab;

@property (weak, nonatomic) IBOutlet UILabel *priceLab;

@property (weak, nonatomic) IBOutlet UILabel *numberLab;

@property (weak, nonatomic) IBOutlet UIButton *jianBtn;

@property (weak, nonatomic) IBOutlet UILabel *textLab;
@property (weak, nonatomic) IBOutlet UIButton *jiaBtn;
@property(assign,nonatomic)BOOL selectState;//选中状态

-(void)setShoppingModel:(JDLSureCartModel*)ShoppingModel;

@property(assign,nonatomic)id<JDLShoppingCartTableViewCellDelegate>delegate;
@end
