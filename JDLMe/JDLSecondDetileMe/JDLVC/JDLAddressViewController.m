//
//  JDLAddressViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/21.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLAddressViewController.h"

@interface JDLAddressViewController ()

@end

@implementation JDLAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回
    [self Dismiss];
    // Do any additional setup after loading the view.
}
-(void)Dismiss
{
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    self.title = @"地址管理";
    navLeftreturn;
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
    
}
-(void)createViewClick:(UIButton *)btn
{
    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
