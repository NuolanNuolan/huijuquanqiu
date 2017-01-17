//
//  JDLDetailTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLDetailTableViewCell.h"

@implementation JDLDetailTableViewCell
{

    //第一个model数据
    NSMutableArray * _Data;
    //URL;
    NSString *_url;
    //ID
    NSString *_id;
    
    //第二个model数据
    NSMutableArray * _Data_two;
    //URL;
    NSString *_url_two;
    //ID
    NSString *_id_two;
}




- (void)awakeFromNib {
    // Initialization code
    
}
-(void)setDetailModel:(JDLDetailModel*)jdldetailModel
{
    _Data = jdldetailModel.HotArr;
    _url = [[_Data objectAtIndex:0]objectForKey:@"img"];
    _id = [[_Data objectAtIndex:0]objectForKey:@"id"];
    [_imageView1 sd_setImageWithURL:[NSURL URLWithString:_url]placeholderImage:[UIImage imageNamed:@"bg_home_hot"]];
    
    _imageView1.restorationIdentifier=_id;
    _imageView1.userInteractionEnabled =YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click:)];
    [_imageView1 addGestureRecognizer:tap1];
    
}
- (void)tap1Click:(UITapGestureRecognizer*)sender{

    [self.delegate1 pushToModel1Detail:sender.view.restorationIdentifier];
}

//热卖单品的右边的品牌推荐
-(void)setDetailTwoModel:(JDLDetailTwoModel*)jdldetailtwoModel
{

    _Data_two = jdldetailtwoModel.hot_brandArr;
    _url_two = [[_Data_two objectAtIndex:0]objectForKey:@"img"];
    _id_two = [[_Data_two objectAtIndex:0]objectForKey:@"id"];
    [_imageView2 sd_setImageWithURL:[NSURL URLWithString:_url_two]placeholderImage:[UIImage imageNamed:@"bg_home_hot"]];
    
    _imageView2.restorationIdentifier=_id_two;
    _imageView2.userInteractionEnabled =YES;
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2Click:)];
    [_imageView2 addGestureRecognizer:tap1];
    
}

- (void)tap2Click:(UITapGestureRecognizer*)sender{
    
    [self.delegate2 pushToModel2Detail:sender.view.restorationIdentifier];
}






- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
