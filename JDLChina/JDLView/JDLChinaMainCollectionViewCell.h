//
//  JDLChinaMainCollectionViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/22.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLChinaModel.h"
@interface JDLChinaMainCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *chianImageView;
@property (weak, nonatomic) IBOutlet UILabel *chianLab;

@property(nonatomic,strong)JDLChinaModel *chinamodel;
-(void)setChinaModel:(JDLChinaModel*)chinaModel;
@end
