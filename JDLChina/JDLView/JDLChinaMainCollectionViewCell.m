//
//  JDLChinaMainCollectionViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/22.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLChinaMainCollectionViewCell.h"


@implementation JDLChinaMainCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    [PublicClass creatcelllab:_chianLab celllabFont1:14.0f celllabFont2:15.0f celllabFont3:16.0f];
}


-(void)setChinaModel:(JDLChinaModel *)chinaModel{
    _chinamodel = chinaModel;
    _chianLab.text = [NSString stringWithFormat:@"%@",chinaModel.name]; 
    [_chianImageView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",chinaModel.img]]];
    
}
@end
