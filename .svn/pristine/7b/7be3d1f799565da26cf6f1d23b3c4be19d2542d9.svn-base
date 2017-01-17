//
//  AddrListEditTableViewCell.m
//  ZKAddrList
//
//  Created by 陈婷 on 16/4/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AddrListEditTableViewCell.h"

@implementation AddrListEditTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editAddr:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate onAddrEditWithIndex:self.index_section];
    }
}

- (IBAction)delAddr:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate onAddrDelWithIndex:self.index_section];
    }
}

- (IBAction)setDefaultAddr:(UIButton *)sender {
    if (self.delegate) {
        [self.delegate onSetDefaultAddrWithIndex:self.addressmodel];
//        [self.btnSwitch removeTarget:self
//                              action:@selector(changeDefault:)
//                    forControlEvents:UIControlEventValueChanged];
//        [self.btnSwitch setOn:address.isDefault];

    }
}



@end
