//
//  JDLTenTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/28.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLTenTableViewCell.h"

@implementation JDLTenTableViewCell
{

    JDLTenModel *_jdltenmodel;
    NSMutableArray * _Data;
    //第一个
    NSDictionary *_dic;
    //第二个数组
    NSDictionary *_dic_selected_info;
    //第三个数组
    NSDictionary *_dic_selected_province;
//    第四个数组
    NSDictionary *_dic_selected_city;
//    第五个数组
    NSDictionary *_dic_selected_country;
}



-(void)setTenModel:(JDLTenModel*)jdlTenModel{
    
    _jdltenmodel = jdlTenModel;
    _Data = _jdltenmodel.selectedArr;
    for (int i=0 ; i<_Data.count; i++) {
    
        _dic =  [_Data objectAtIndex:i];
        _dic_selected_info = [_dic objectForKey:@"info"];
        
        
  
////        省的
//        _dic_selected_province = [_dic_selected_info objectForKey:@"province"];
////        城市的
//        _dic_selected_city = [_dic_selected_info objectForKey:@"city"];
////        国家的
//        _dic_selected_country = [_dic_selected_info objectForKey:@"province"];
        if (i==0) {
            
            [self.chinaImageView1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic objectForKey:@"img"]]]];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
            self.chinaImageView1.userInteractionEnabled =YES;
            [self.chinaImageView1 addGestureRecognizer:tap1];
            self.chinaImageView1.restorationIdentifier = [_dic_selected_info objectForKey:@"sel_type"];
            
        }
        else if (i==1)
        {
            [self.chinaImageView2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic objectForKey:@"img"]]]];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
            self.chinaImageView2.userInteractionEnabled =YES;
            [self.chinaImageView2 addGestureRecognizer:tap1];
            self.chinaImageView2.restorationIdentifier = [_dic_selected_info objectForKey:@"sel_type"];
        }
        else if (i==2)
        {
            [self.chinaImageView3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic objectForKey:@"img"]]]];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
            self.chinaImageView3.userInteractionEnabled =YES;
            [self.chinaImageView3 addGestureRecognizer:tap1];
            self.chinaImageView3.restorationIdentifier = [_dic_selected_info objectForKey:@"sel_type"];
        }
        else if (i==3)
        {
            [self.chinaImageView4 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic objectForKey:@"img"]]]];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
            self.chinaImageView4.userInteractionEnabled =YES;
            [self.chinaImageView4 addGestureRecognizer:tap1];
            self.chinaImageView4.restorationIdentifier = [_dic_selected_info objectForKey:@"sel_type"];
        }
        else if (i==4)
        {
            [self.chinaImageView5 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic objectForKey:@"img"]]]];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
            self.chinaImageView5.userInteractionEnabled =YES;
            [self.chinaImageView5 addGestureRecognizer:tap1];
            self.chinaImageView5.restorationIdentifier = [_dic_selected_info objectForKey:@"sel_type"];
        }
        else if (i==5)
        {
            [self.chinaImageView6 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic objectForKey:@"img"]]]];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
            self.chinaImageView6.userInteractionEnabled =YES;
            [self.chinaImageView6 addGestureRecognizer:tap1];
            self.chinaImageView6.restorationIdentifier = [_dic_selected_info objectForKey:@"sel_type"];
        }
        
        
        
        
    }
    
    
    
}
-(void)tap1Click_Ten:(UITapGestureRecognizer * )sender
{
    
    [self.delegate1 pushToChinaDetail1:sender.view.restorationIdentifier];
    
}














- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
