//
//  JDLDetileCollectionCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLDetileCollectionCell.h"

@implementation JDLDetileCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDetileColltionModel:(NSDictionary *)detileColltionModel{

//    _detileColltionModel = detileColltionModel;

    self.detileColltion_nameLab.text =[detileColltionModel objectForKey:@"pname"];
    self.detileColltion_PriceLab.text = [NSString stringWithFormat:@"￥%@",[detileColltionModel objectForKey:@"price"]];
    [self.detileColltionImage sd_setImageWithURL:[NSURL URLWithString:[detileColltionModel  objectForKey:@"img"]]];

        
    
    
    
//    self.detileColltion_nameLab.text = detileColltionModel.pid;
}

@end
