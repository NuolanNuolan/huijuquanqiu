//
//  JDLSP_DPSPTableViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/7.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLFav_shop.h"
@protocol DP_btndelegate <NSObject>

-(void)DP_spID:(NSString *)index;

@end


@interface JDLSP_DPSPTableViewCell : UITableViewCell
//初始化方法传入用户ID
- (id)initWith_count:(NSInteger)count;

@property (nonatomic,strong)UIView      *view;
@property (nonatomic,strong)UIButton *btn_image;
@property (nonatomic) NSInteger index;
@property (nonatomic,weak) id<DP_btndelegate> delegate;

-(void)setCollectionStoreModel:(JDLFav_shop*)CollectionStoreModel;
@end
