//
//  JDLOrderDeatilThereTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/29.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLPayModel.h"
@protocol JDLPaymodel_store_shopdelegate <NSObject>

- (void)push_store_shop:(NSString *)str Andstore_type:(NSString *)type;
@end
@interface JDLOrderDeatilThereTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *View_store;

@property (weak, nonatomic) IBOutlet UILabel *Store_name;

@property (weak, nonatomic) IBOutlet UIImageView *Shop_img;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *shop_labWith;

@property (weak, nonatomic) IBOutlet UILabel *Shop_name;
@property (weak, nonatomic) IBOutlet UIView *View_shop;

@property (weak, nonatomic) IBOutlet UILabel *Shop_price;

@property (weak, nonatomic) IBOutlet UILabel *Shop_size_color;
@property (weak, nonatomic) IBOutlet UILabel *Shop_count;

-(void)setPayModel:(JDLPayModel*)Paymodel;
@property(nonatomic,assign)id<JDLPaymodel_store_shopdelegate>delegate;
@end
