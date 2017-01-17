//
//  JDLSearchViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLSearchViewController.h"
#import "JDLSearchDetileViewController.h"
@interface JDLSearchViewController ()<UITextFieldDelegate>
{

    UITextField *_textField;
}

@end

@implementation JDLSearchViewController

//-(void)viewDidAppear:(BOOL)animated{
//
//    
//    self.navigationController.navigationBarHidden = YES;
//}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    //	[self.tabBarController.tabBar setHidden:YES];
    [self createNavLeftItem];
    [self createTextFild];
    self.view.backgroundColor = [UIColor whiteColor];
}

//设置返回按钮
-(void)createNavLeftItem{
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 20, 20);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_classification"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;

    
}



-(void)createTextFild{

    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(13, 28, screen_Width-53, 25)];
    textField.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:textField];
    //提示文本
    textField.placeholder = @"请输入关键字";
    textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    //    设置字体大小
    textField.font = [UIFont boldSystemFontOfSize:14];
//      设置左侧的view
    textField.leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@""]];
    //  设置view的大小
    textField.leftView.bounds = CGRectMake(0, 0, 4, 4);
    //  设置view的显示模式
    textField.leftViewMode = UITextFieldViewModeAlways;
    textField.tag = 1000;
    textField.delegate = self;
    _textField = textField;
//    [[UITextField appearance] setTintColor:[UIColor colorWithRed:0.0863 green:0.6275 blue:0.3333 alpha:1.0]];
    //设置returnKey的样式
    _textField.returnKeyType = UIReturnKeyGo;
    [_textField becomeFirstResponder];// 2
    
    
    UIButton *ssBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ssBtn.frame = CGRectMake(screen_Width - 47, 25, 50, 30);
    [ssBtn setTitle:@"取消" forState:UIControlStateNormal];
    [ssBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    ssBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [ssBtn addTarget:self action:@selector(searchBtn) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ssBtn];
}

-(void)searchBtn{
    [_textField resignFirstResponder];
    self.navigationController.navigationBarHidden = NO;
    [self.navigationController popViewControllerAnimated:NO];
}

//点击屏幕
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    UITextField *textFiled = (id)[self.view viewWithTag:1000];
//    [self.view endEditing:YES];
    [textFiled endEditing:YES];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSString *searchText = _textField.text;
    [_textField resignFirstResponder];
    [self searchWithStr:searchText];
    return NO;
}

-(void)searchWithStr:(NSString *)str{
    JDLSearchDetileViewController *searchVc = [[JDLSearchDetileViewController alloc]init];
    searchVc.searchKeyWord = str;
//    _searchTableView.hidden = YES;
    _textField.text = @"";
//    if (searchVc.searchKeyWord.length > 0) {
        [self.navigationController pushViewController:searchVc animated:YES];

//    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
}


@end
