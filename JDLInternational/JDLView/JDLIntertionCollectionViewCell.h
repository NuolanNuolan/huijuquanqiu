//
//  JDLIntertionCollectionViewCell.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/22.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLInternstionModel.h"
@interface JDLIntertionCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *intertionImageView;
@property (weak, nonatomic) IBOutlet UILabel *intertionlab;

@property(nonatomic,strong)JDLInternstionModel *InternstionModel;
- (void)configInternstionUI:(JDLInternstionModel *)InternstionModel;
@end
