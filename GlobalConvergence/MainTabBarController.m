//
//  MainTabBarController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "MainTabBarController.h"
#import "JDLHomeViewController.h"
#import "JDLChinaViewController.h"
#import "JDLInternstionViewController.h"
#import "JDLShoppingViewController.h"
#import "JDLMeViewController.h"
#import "BaseNavigationController.h"
//#import "JDLBaseViewController.h"
//#import "JDLFristViewController.h"
@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createTabBar];
    self.tabBar.tintColor = [UIColor colorWithRed:0.0 green:0 blue:0 alpha:1];
    self.delegate = self;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)createTabBar{
    
        NSMutableArray *childVCArray = [[NSMutableArray alloc] initWithCapacity:0];
    
        JDLHomeViewController *vc = [[JDLHomeViewController alloc]init];
        JDLChinaViewController *vc1 = [[JDLChinaViewController alloc]init];
        JDLInternstionViewController *vc2 = [[JDLInternstionViewController alloc]init];
        JDLShoppingViewController *vc3 = [[JDLShoppingViewController alloc]init];
        JDLMeViewController *vc4 = [[JDLMeViewController alloc]init];
    
        vc.tabBarItem.title = @"首页";
        vc1.tabBarItem.title = @"中国质造";
        vc2.tabBarItem.title = @"汇聚全球";
        vc3.tabBarItem.title = @"购物袋";
        vc4.tabBarItem.title = @"我的全球";
    
    
        vc.tabBarItem.image = imageRender(@"tab_home(1).png");
        vc.tabBarItem.selectedImage = imageRender(@"tab_home.png");
    
        vc1.tabBarItem.image = imageRender(@"tab_madeinchina(1).png");
        vc1.tabBarItem.selectedImage = imageRender(@"tab_madeinchina.png");
    
        vc2.tabBarItem.image = imageRender(@"tab_Allovertheworld(1).png");
        vc2.tabBarItem.selectedImage = imageRender(@"tab_Allovertheworld.png");
    
        vc3.tabBarItem.image = imageRender(@"tab_Shoppingbags(1).png");
        vc3.tabBarItem.selectedImage = imageRender(@"tab_Shoppingbags.png");
    
        vc4.tabBarItem.image = imageRender(@"tab_me(1).png");
        vc4.tabBarItem.selectedImage = imageRender(@"tab_me.png" );
    
        BaseNavigationController *nvc = [[BaseNavigationController alloc]initWithRootViewController:vc];
        BaseNavigationController *nvc1 = [[BaseNavigationController alloc]initWithRootViewController:vc1];
        BaseNavigationController *nvc2 = [[BaseNavigationController alloc]initWithRootViewController:vc2];
        BaseNavigationController *nvc3 = [[BaseNavigationController alloc]initWithRootViewController:vc3];
        BaseNavigationController *nvc4 = [[BaseNavigationController alloc]initWithRootViewController:vc4];
        [vc.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                                                          NSForegroundColorAttributeName:[UIColor blackColor]}];
        [vc1.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                                                         NSForegroundColorAttributeName:[UIColor blackColor]}];
        [vc2.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                                                         NSForegroundColorAttributeName:[UIColor blackColor]}];
        [vc3.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                                                         NSForegroundColorAttributeName:[UIColor blackColor]}];
        [vc4.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],
                                                                         NSForegroundColorAttributeName:[UIColor blackColor]}];
    [childVCArray addObject:nvc];
    [childVCArray addObject:nvc1];
    [childVCArray addObject:nvc2];
    [childVCArray addObject:nvc3];
    [childVCArray addObject:nvc4];
    
    self.viewControllers = childVCArray;
   
        
    
}
-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController
{
    
    NSString *tabba_sele = [[NSUserDefaults standardUserDefaults]objectForKey:@"tabbar_selectedIndex"];
    if (tabba_sele==nil) {
        tabba_sele = @"0";
    }
    if ([tabba_sele isEqualToString:@"0"]&&tabBarController.selectedIndex==0) {
        //创建一个消息对象
        NSNotification * notice = [NSNotification notificationWithName:@"123"object:nil];
        //发送消息
        [[NSNotificationCenter defaultCenter]postNotification:notice];
        
    }
    NSString *tabbar_selectedIndex =[NSString stringWithFormat:@"%lu",
                                     (unsigned long)tabBarController.selectedIndex];
    [[NSUserDefaults standardUserDefaults ]setObject:tabbar_selectedIndex forKey:@"tabbar_selectedIndex"];
}
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    
    if ([viewController.tabBarItem.title isEqualToString:@"购物袋"]) {
        //如果用户ID存在的话，说明已登陆
        if (![LoginModel isLogin]) {
            //跳到登录页面
            JDLLoggingViewController *login = [[JDLLoggingViewController alloc] init];
            //隐藏tabbar
            login.hidesBottomBarWhenPushed = YES;
            [((UINavigationController *)tabBarController.selectedViewController) pushViewController:login animated:YES];
            
            return NO;
            
        }
        else
        {
            
            
            return YES;
        }
    }
    
    return YES;
    
    
}



@end
