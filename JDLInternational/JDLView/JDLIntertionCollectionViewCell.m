//
//  JDLIntertionCollectionViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/22.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLIntertionCollectionViewCell.h"

@implementation JDLIntertionCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [PublicClass creatcelllab:_intertionlab celllabFont1:14.0f celllabFont2:15.0f celllabFont3:16.0f];
}

- (void)configInternstionUI:(JDLInternstionModel *)InternstionModel{

    _InternstionModel = InternstionModel;
    _intertionlab.text = [NSString stringWithFormat:@"%@馆",InternstionModel.name];
    
    [_intertionImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",InternstionModel.img]]];
    

}

@end
