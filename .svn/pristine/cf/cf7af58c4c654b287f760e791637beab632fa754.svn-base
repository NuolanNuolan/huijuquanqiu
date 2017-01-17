//
//  JDLpopupView.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/19.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLpopupView.h"
#import "JDLBuyView.h"

@implementation JDLpopupView
@synthesize alphaiView,whiteView,image,deletBtn,priceLab,stockLab,detailLab,lineLab,sureBtn,mainscrollview,countView,stock;

-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        MYLOG(@"弹出视图的界面");
        self.backgroundColor = [UIColor clearColor];
//        半透明视图
        alphaiView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, screen_Height)];
        alphaiView.backgroundColor = [UIColor blackColor];
        alphaiView.alpha = 0.4;
        [self addSubview:alphaiView];
        
        if (screen_Width == iphone4_width) {
            //        商品详情的视图
            whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, screen_Height-64)];
            whiteView.backgroundColor = [UIColor whiteColor];
            [self addSubview:whiteView];
        }else if (screen_Width == iphone6_width){
            //        商品详情的视图
            whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, screen_Width, screen_Height-200)];
            whiteView.backgroundColor = [UIColor whiteColor];
            [self addSubview:whiteView];
        }
        else{
            whiteView = [[UIView alloc]initWithFrame:CGRectMake(0, 200, screen_Width, screen_Height-200)];
            whiteView.backgroundColor = [UIColor whiteColor];
            [self addSubview:whiteView];
        }
//        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
        [whiteView addGestureRecognizer:tap];
        
//        商品图片
        image = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 100, 100)];
        image.backgroundColor = [UIColor whiteColor];
        image.layer.cornerRadius = 4;
        image.layer.borderColor = [UIColor whiteColor].CGColor;
        image.layer.borderWidth = 5;
        [image.layer setMasksToBounds:YES];
        [whiteView addSubview:image];
//        删除按钮
        deletBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        deletBtn.frame = CGRectMake(whiteView.frame.size.width-40, 20, 18, 18);
        [deletBtn setBackgroundImage:[UIImage imageNamed:@"btn_cancel"] forState:UIControlStateNormal];
        [whiteView addSubview:deletBtn];
        
        
//        商品价格
        priceLab = [[UILabel alloc]initWithFrame:CGRectMake(image.frame.origin.x+image.frame.size.width+20, 20, whiteView.frame.size.width-(image.frame.origin.x+image.frame.size.width+80), 20)];
        priceLab.textColor = [UIColor blackColor];
        priceLab.font = [UIFont systemFontOfSize:14.0f];
        [whiteView addSubview:priceLab];
        
        //商品库存
        stockLab = [[UILabel alloc] initWithFrame:CGRectMake(image.frame.origin.x+image.frame.size.width+20, priceLab.frame.origin.y+priceLab.frame.size.height, whiteView.frame.size.width-(image.frame.origin.x+image.frame.size.width+40+40), 20)];
        stockLab.textColor = [UIColor redColor];
        stockLab.font = [UIFont systemFontOfSize:14.0f];
        [whiteView addSubview:stockLab];
        //选择商品的尺码和颜色
        detailLab = [[UILabel alloc] initWithFrame:CGRectMake(image.frame.origin.x+image.frame.size.width+20, 25+stockLab.frame.origin.y+stockLab.frame.size.height, whiteView.frame.size.width-(image.frame.origin.x+image.frame.size.width+40+40), 40)];
        detailLab.numberOfLines = 2;
        detailLab.textColor = [UIColor blackColor];
        detailLab.font = [UIFont systemFontOfSize:14.0f];
        [whiteView addSubview:detailLab];
        //分界线
        lineLab = [[UILabel alloc] initWithFrame:CGRectMake(0, image.frame.origin.y+image.frame.size.height+20, whiteView.frame.size.width, 0.5)];
        lineLab.backgroundColor = [UIColor lightGrayColor];
        [whiteView addSubview:lineLab];
        
        
        //确定按钮
        sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(0, whiteView.frame.size.height-50,whiteView.frame.size.width, 50);
        [sureBtn setBackgroundColor:[UIColor redColor]];
        [sureBtn setTitleColor:[UIColor whiteColor] forState:0];
        sureBtn.titleLabel.font = [UIFont systemFontOfSize:20.0f];
        [sureBtn setTitle:@"确定" forState:0];
        [whiteView addSubview:sureBtn];
        
        //商品尺码和颜色分类
        mainscrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, lineLab.frame.origin.y+lineLab.frame.size.height, whiteView.frame.size.width, sureBtn.frame.origin.y-(lineLab.frame.origin.y+lineLab.frame.size.height))];
        mainscrollview.showsHorizontalScrollIndicator = NO;
        mainscrollview.showsVerticalScrollIndicator = NO;
        [whiteView addSubview:mainscrollview];
        
        //购买数量
        countView = [[JDLBuyView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 50)];
        [mainscrollview addSubview:countView];
        [countView.addBtn addTarget:self action:@selector(add) forControlEvents:UIControlEventTouchUpInside];
        countView.countText.delegate = self;
        [countView.reduceBtn addTarget:self action:@selector(reduce) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}

//加按钮
-(void)add{
    int count =[countView.countText.text intValue];
    if (count < self.stock) {
        countView.countText.text = [NSString stringWithFormat:@"%d",count+1];
    }else
    {
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
//        alert.tag = 100;
//        [alert show];
        
         [MBProgressHUD showError:@"数量超出范围"];
    }
}

-(void)reduce{

    int count =[countView.countText.text intValue];
    if (count > 1) {
        countView.countText.text = [NSString stringWithFormat:@"%d",count-1];
    }else
    {
        //        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"数量超出范围" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        //        alert.tag = 100;
        //        [alert show];
         [MBProgressHUD showError:@"数量超出范围"];
    }

}


#pragma mark-countText代理
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    mainscrollview.contentOffset = CGPointMake(0, countView.frame.origin.y);
     countView.countText.keyboardType=UIKeyboardTypeNumberPad;
    return YES;
}
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    int count =[countView.countText.text intValue];
    if (count > self.stock) {
        
        
        [MBProgressHUD showError:@"数量超出范围"];
        countView.countText.text = [NSString stringWithFormat:@"1"];
    }
}

//-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
//{
//    [countView.countText resignFirstResponder];
//}


//-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//
//    [countView.countText resignFirstResponder];
//}

-(void)tap
{
    mainscrollview.contentOffset = CGPointMake(0, 0);
    [countView.countText resignFirstResponder];
}





















@end
