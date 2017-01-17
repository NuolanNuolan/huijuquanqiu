//
//  JDLAboutUsViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/22.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLAboutUsViewController.h"

@interface JDLAboutUsViewController ()

@end

@implementation JDLAboutUsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //	[self.tabBarController.tabBar setHidden:YES];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"关于我们";
    [self createLeftBtn];
    [self createImange];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createLeftBtn{

    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1).png"] target:self SEL:@selector(createViewClick)]];
}

-(void)createViewClick{
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    //    [self.tabBarController.tabBar setHidden:NO];
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)createImange{

    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, screen_Height-64)];
    image.image = [UIImage imageNamed:@"Aboutus.png"];
    [self.view addSubview:image];
}
@end
