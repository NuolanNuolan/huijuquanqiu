//
//  JDLThirdTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/18.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLThirdTableViewCell.h"

@implementation JDLThirdTableViewCell

-(void)setBtnArr:(NSArray *)btnArr{
//    MYLOG(@"aaaaaaaaaa");
//    NSArray *arr = @[_btn1,_btn2,_btn3,_btn4];
//    for (int i = 0; i < 4; ++i) {
//        [arr[i] layer].cornerRadius = 10.f;
//        [arr[i] layer].masksToBounds = YES;
//        [arr[i] addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//        
//    }
    [_btn1 addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [_btn2 addTarget:self action:@selector(btnClick1) forControlEvents:UIControlEventTouchUpInside];
    [_btn3 addTarget:self action:@selector(btnClick2) forControlEvents:UIControlEventTouchUpInside];
    [_btn4 addTarget:self action:@selector(btnClick3) forControlEvents:UIControlEventTouchUpInside];
}

-(void)btnClick{
//    MYLOG(@"adadaffsfas");
    [self.delegate ThirdClick];
}

-(void)btnClick1{
//    MYLOG(@"adadaffsfas");
    [self.delegate ThirdClick1];
}
-(void)btnClick2
{

    [self.delegate ThirdClick2];
}


-(void)btnClick3{

    [self.delegate ThirdClick3];
}

- (void)awakeFromNib {
    // Initialization code
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
