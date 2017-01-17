//
//  JDLThirdTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/18.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol SecondCellMoreButtonDelegate <NSObject>

-(void)ThirdClick;
-(void)ThirdClick1;
-(void)ThirdClick3;
-(void)ThirdClick2;
@end
@interface JDLThirdTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIButton *btn1;

@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;

@property(nonatomic,strong)NSArray *btnArr;
@property(nonatomic,assign)id<SecondCellMoreButtonDelegate>delegate;


@end
