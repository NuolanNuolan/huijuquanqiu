//
//  JDLISChargeTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/17.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLISChargeTableViewCell.h"

@implementation JDLISChargeTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)ISCharge_tuikuan:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate LookLogistics_TuiKuan:self.index_section Andindex_path:self.index_path];
    }
    
}

- (IBAction)ISCharge_look:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate LookLogistics_section_indexpath:self.index_section Andindex_path:self.index_path];
    }
}

- (IBAction)ISCharge_shouhuo:(UIButton *)sender {
}
@end
