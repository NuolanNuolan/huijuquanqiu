//
//  JDLWebViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/22.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLWebViewController.h"

@interface JDLWebViewController ()<UIWebViewDelegate>

@end

@implementation JDLWebViewController
{

    NSString *_url;
}
- (id)initWith_web_url:(NSString *)url
{

    self = [super init];
    if (self) {
        
        _url =url;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=  [UIColor whiteColor];
    self.title = @"天猫商品";
    //左边返回
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    [self createWebView];
    [self createLastView];
}

-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)createLastView{

    UIView *lastView = [[UIView alloc]initWithFrame:CGRectMake(0, screen_Height-49, screen_Width, 49)];
    lastView.backgroundColor = [UIColor redColor];
    [self.view addSubview:lastView];
}

-(void)createWebView{

    UIWebView *vi = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
    [vi loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_url]]];
    vi.delegate = self;
    [self.view addSubview:vi];
}

//-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
//
//    if (navigationType == UIWebViewNavigationTypeLinkClicked) {
//        
//        MYLOG(@"dainjishijian");
//        return NO;
//    }
//    return YES;
//}


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
