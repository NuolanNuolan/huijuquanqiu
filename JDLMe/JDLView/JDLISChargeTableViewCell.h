//
//  JDLISChargeTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/17.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol LookLogisticsDelegate <NSObject>


-(void)LookLogistics_section_indexpath:(NSInteger)index_section Andindex_path:(NSInteger)index_path;
-(void)LookLogistics_TuiKuan:(NSInteger)index_section Andindex_path:(NSInteger)index_path;
@end
@interface JDLISChargeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *ISCharge_imageview;
@property (weak, nonatomic) IBOutlet UILabel *ISCharge_title;
@property (weak, nonatomic) IBOutlet UILabel *ISCharge_detail;
@property (weak, nonatomic) IBOutlet UILabel *ISCharge_price;
@property (weak, nonatomic) IBOutlet UILabel *ISCharge_count;
- (IBAction)ISCharge_tuikuan:(UIButton *)sender;
- (IBAction)ISCharge_look:(UIButton *)sender;
- (IBAction)ISCharge_shouhuo:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIView *ISChare_view_down;


@property (nonatomic) NSInteger index_section;
@property (nonatomic) NSInteger index_path;
@property (nonatomic,weak) id<LookLogisticsDelegate> delegate;
@end
