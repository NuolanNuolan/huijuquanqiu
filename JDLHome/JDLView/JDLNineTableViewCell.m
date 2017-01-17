//
//  JDLNineTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLNineTableViewCell.h"

@implementation JDLNineTableViewCell
{

    NSMutableArray *_data;
    NSDictionary *dic ;
    
    NSMutableArray *_arr;
}

- (void)awakeFromNib {
    // Initialization code
    [PublicClass creatcelllab:_priceLab1 celllabFont1:10.0f celllabFont2:13.0f celllabFont3:14.0f];
    [PublicClass creatcelllab:_priceLab2 celllabFont1:10.0f celllabFont2:13.0f celllabFont3:14.0f];
    
    [PublicClass creatcelllab:_presentLab1 celllabFont1:9.0f celllabFont2:13.0f celllabFont3:14.0f];
    [PublicClass creatcelllab:_presentLab2 celllabFont1:9.0f celllabFont2:13.0f celllabFont3:14.0f];

}

-(void)setNinemodel:(JDLLovedModel*)jdlNineModel andindex:(NSInteger)row
{
    dic = [[NSDictionary alloc]init];
    _data = [[NSMutableArray alloc]initWithCapacity:0];
    _arr = [[NSMutableArray alloc]initWithCapacity:0];
    _data = [[[[jdlNineModel.LovedArr objectAtIndex:0]objectForKey:@"info"]objectAtIndex:0]objectForKey:@"goods"];
    
    if (_data.count%2==0) {
        for (int i =0 ; i<_data.count; i++) {
            
            NSString *str = [[_data objectAtIndex:i]objectForKey:@"position"];
            if ([str isEqualToString:[NSString stringWithFormat:@"%ld",(long)row]]) {
                dic = [_data objectAtIndex:i];
                [_imageView1 sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
                _commodityLab1.text = [dic objectForKey:@"pname"];
                _priceLab1.text  =[NSString stringWithFormat:@"￥%@",[dic objectForKey:@"price"]];
                _presentLab1.text = [NSString stringWithFormat:@"￥%@",[dic objectForKey:@"shop_price"]];
                
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
                self.nieeBgView1.userInteractionEnabled =YES;
                self.nieeBgView1.restorationIdentifier = [dic objectForKey:@"pid"];
                [self.nieeBgView1 addGestureRecognizer:tap1];
            }
            else if([str isEqualToString:[NSString stringWithFormat:@"%ld",_data.count+1-(long)row]])
            {

                dic = [_data objectAtIndex:i];
                [_imageView2 sd_setImageWithURL:[NSURL URLWithString:[dic objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
                _commodityLab2.text = [dic objectForKey:@"pname"];
                _priceLab2.text  = [NSString stringWithFormat:@"￥%@",[dic objectForKey:@"price"]];
                _presentLab2.text = [NSString stringWithFormat:@"￥%@",[dic objectForKey:@"shop_price"]];
                UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
                self.nineBgView2.userInteractionEnabled =YES;
                self.nineBgView2.restorationIdentifier = [dic objectForKey:@"pid"];
                [self.nineBgView2 addGestureRecognizer:tap1];
            }
            
            
            
        }
    }
    
    
}
-(void)tap1Click_Ten:(UITapGestureRecognizer * )sender
{
    
    [self.delegate pushToNineModelSecond:sender.view.restorationIdentifier];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
