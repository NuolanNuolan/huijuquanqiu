//
//  JDLSecondTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLSecondTableViewCell.h"

@implementation JDLSecondTableViewCell
{

    JDLSecondModel *_jdlsecmodel;
    NSMutableArray * _Data_sec;
    //第一个数组；
    NSDictionary *_dic_sec;
    //第二个数组
    NSDictionary *_dic_sec_info;
}




- (void)awakeFromNib {
    // Initialization code
}

-(void)setSecondmodel:(JDLSecondModel*)jdlsecondmodel
{

    _jdlsecmodel = jdlsecondmodel;
    _Data_sec = _jdlsecmodel.recArr;
    for (int i =0; i<_Data_sec.count; i++) {
        _dic_sec  =   [_Data_sec objectAtIndex:i];
        _dic_sec_info = [_dic_sec objectForKey:@"info"];
        
        if (i==0) {
            
            [self.detailView1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic_sec objectForKey:@"img"]]]placeholderImage:[UIImage imageNamed:@"bg_home_dailyrecommendations"]];
            UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_second:)];
            self.detailView1.userInteractionEnabled =YES;
            [self.detailView1 addGestureRecognizer:tap1];
            self.detailView1.restorationIdentifier =_dic_sec_info[@"id"];

        }
        else if (i==1)
        {
           [self.detailView2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic_sec objectForKey:@"img"]]]placeholderImage:[UIImage imageNamed:@"bg_home_dailyrecommendations"]];
            
            UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_second:)];
            self.detailView2.userInteractionEnabled =YES;
            [self.detailView2 addGestureRecognizer:tap2];
            self.detailView2.restorationIdentifier =_dic_sec_info[@"id"];
            
            

        }
        else if (i==2)
        {
            [self.detailView3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", [_dic_sec objectForKey:@"img"]]]placeholderImage:[UIImage imageNamed:@"bg_home_dailyrecommendations"]];
            UITapGestureRecognizer *tap3 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_second:)];
            self.detailView3.userInteractionEnabled =YES;
            [self.detailView3 addGestureRecognizer:tap3];
            self.detailView3.restorationIdentifier =_dic_sec_info[@"id"];

        }
    }
    
}

-(void)tap1Click_second:(UITapGestureRecognizer * )sender
{

    [self.delegate2 pushToModel1Second:sender.view.restorationIdentifier];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
