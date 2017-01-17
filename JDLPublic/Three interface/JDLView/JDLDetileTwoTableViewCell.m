//
//  JDLDetileTwoTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/3.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLDetileTwoTableViewCell.h"

@implementation JDLDetileTwoTableViewCell
{

//    JDLDetileTwoModel *_detileModel;
//    NSMutableArray *_detileArr;
//    NSDictionary *_detileDic;
//    NSDictionary *_contentDic;
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setDetileTwoModel:(NSDictionary *)jdlDetileTwoModel_dic
{

    self.detileTwoLab.text =[jdlDetileTwoModel_dic objectForKey:@"name"];
    self.detileTwoLab1.text =[jdlDetileTwoModel_dic objectForKey:@"value"];
    
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
