//
//  JDLLoggingViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/23.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLLoggingViewController.h"
#import "JDLRegisterViewController.h"
#import "JDLForgotPasswordViewController.h"
#import "LoginModel.h"
#import "User.h"
#import "WXApi.h"

#import "JDLMeViewController.h"
#import "JDLHeadViewController.h"
#define kWeiXinAppId @"wxa8235233746fd58d"
#define kWeiXinAppSecret @"2878950da9ddbf2f03e2839d6e3d7a05"

@interface JDLLoggingViewController ()<WXApiDelegate>
{
    
    UIImageView *View;
    UIView *bgView;
    UITextField *pwd;
    UITextField *phone;
    UIButton *QQBtn;
    UIButton *weixinBtn;
    UIButton *xinlangBtn;
}

@property(nonatomic,retain)NSString *wx_access_token;
@property(nonatomic,retain)NSString *wx_openid;

@property(nonatomic,strong)MBProgressHUD *hud;


@end

@implementation JDLLoggingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.navigationItem.title = @"登录";
    UIImageView *bgV = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
    [bgV setImage:[UIImage imageNamed:@"Login_BG"]];
    [self.view addSubview:bgV];
//    [LoginModel setLoginOk];
    [self createNavLeftItem];
    [self createTextFields];
    [self createButtons];
//  dismiss_w;
    
}

//- (void)viewWillDisappear:(BOOL)animated {
//    [super viewWillDisappear:animated];
//    //代理置空，否则会闪退
//    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        self.navigationController.interactivePopGestureRecognizer.delegate = nil;
//        //    [self.tabBarController.tabBar setHidden:NO];
//    }
//}
//- (void)viewDidAppear:(BOOL)animated {
//    [super viewDidAppear:animated];
//    //开启iOS7的滑动返回效果
//    if ([self.navigationController   respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
//        //	[self.tabBarController.tabBar setHidden:YES];
//        //只有在二级页面生效
//        if ([self.navigationController.viewControllers count] == 2) {
//            self.navigationController.interactivePopGestureRecognizer.delegate = self;
//        }
//    }
//}

#pragma mark - 设置左边返回按钮
-(void)createNavLeftItem{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    
}


-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}




//创建用户密码登录框
-(void)createTextFields{
    
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 75, frame.size.width-20, 100)];
    bgView.layer.cornerRadius=3.0;
    //    bgView.alpha=0.7;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    phone=[self createTextFielfFrame:CGRectMake(60, 10, 271, 30) font:[UIFont systemFontOfSize:14] placeholder:@"请输入您手机号码"];
    //user.text=@"13419693608";
    phone.keyboardType=UIKeyboardTypeNumberPad;
    phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    pwd=[self createTextFielfFrame:CGRectMake(60, 60, 271, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"密码" ];
    pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    //pwd.text=@"123456";
    //密文样式
    pwd.secureTextEntry=YES;
    //pwd.keyboardType=UIKeyboardTypeNumberPad;
    
    
    UIImageView *userImageView=[self createImageViewFrame:CGRectMake(20, 10, 25, 25) imageName:@"ic_landing_nickname" color:nil];
    UIImageView *pwdImageView=[self createImageViewFrame:CGRectMake(20, 60, 25, 25) imageName:@"mm_normal" color:nil];
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    [bgView addSubview:phone];
    [bgView addSubview:pwd];
    
    [bgView addSubview:userImageView];
    [bgView addSubview:pwdImageView];
    [bgView addSubview:line1];
    
    
}



-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [phone resignFirstResponder];
    [pwd resignFirstResponder];
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [phone resignFirstResponder];
    [pwd resignFirstResponder];
}



-(void)createImageViews
{
    //        UIImageView *userImageView=[self createImageViewFrame:CGRectMake(25, 10, 25, 25) imageName:@"ic_landing_nickname" color:nil];
    //        UIImageView *pwdImageView=[self createImageViewFrame:CGRectMake(25, 60, 25, 25) imageName:@"ic_landing_password" color:nil];
    //        UIImageView *line1=[self createImageViewFrame:CGRectMake(25, 50, 260, 1.5) imageName:nil color:[UIColor lightGrayColor]];
    
    //        UIImageView *line2=[self createImageViewFrame:CGRectMake(88, 210, 280, 1) imageName:nil color:[UIColor grayColor]];
    
    UIImageView *line3=[self createImageViewFrame:CGRectMake(2, 400, 100, 1) imageName:nil color:[UIColor lightGrayColor]];
    UIImageView *line4=[self createImageViewFrame:CGRectMake(SCREEN_WIDTH-100-10, 400, 110, 1) imageName:nil color:[UIColor lightGrayColor]];
    //
    //    [bgView addSubview:userImageView];
    //    [bgView addSubview:pwdImageView];
    //    [bgView addSubview:line1];
    //    [self.view addSubview:line2];
    [self.view addSubview:line3];
    [self.view addSubview:line4];
}


//设置登录按钮，快速注册以及找回密码
-(void)createButtons
{
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, 190, SCREEN_WIDTH-20, 37) backImageName:nil title:@"登 录" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:19] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    //    landBtn.backgroundColor = [UIColor lightGrayColor];
    landBtn.layer.cornerRadius=5.0f;
    
    UIButton *newUserBtn=[self createButtonFrame:CGRectMake(15, 235, 70, 30) backImageName:nil title:@"快速注册" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(registration:)];
    //    newUserBtn.backgroundColor=[UIColor blackColor];
    
    UIButton *forgotPwdBtn=[self createButtonFrame:CGRectMake(SCREEN_WIDTH-85, 235, 60, 30) backImageName:nil title:@"找回密码" titleColor:[UIColor grayColor] font:[UIFont systemFontOfSize:15] target:self action:@selector(fogetPwd:)];
    [self.view addSubview:landBtn];
    [self.view addSubview:newUserBtn];
    [self.view addSubview:forgotPwdBtn];
    
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]||[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]||[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibosso://wb22222222"]]){
    //第三方账号登录lable
//    [self createLabel];
//    }
    
#define Start_X 60.0f           // 第一个按钮的X坐标
#define Start_Y 440.0f           // 第一个按钮的Y坐标
#define Width_Space 50.0f        // 2个按钮之间的横间距
#define Height_Space 20.0f      // 竖间距
#define Button_Height 50.0f    // 高
#define Button_Width 50.0f      // 宽
    
//    
//    if (screen_Width == iphone4_width) {
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]){
//            //微信
//            weixinBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2, screen_Height/2+110, 50, 50)];
//            //    weixinBtn.tag = UMSocialSnsTypeWechatSession;
//            weixinBtn.layer.cornerRadius=25;
//            weixinBtn=[self createButtonFrame:weixinBtn.frame backImageName:@"Image2" title:nil titleColor:nil font:nil target:self action:@selector(onClickWX:)];
//            
//            UILabel *lab_WX=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-13, screen_Height/2+160, 80, 21)];
//            lab_WX.text=@"微信登录";
//            lab_WX.textColor=[UIColor grayColor];
//            lab_WX.textAlignment=NSTextAlignmentCenter;
//            lab_WX.font=[UIFont systemFontOfSize:14];
//            [self.view addSubview:lab_WX];
//            [self.view addSubview:weixinBtn];
//        }
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]){
//            //qq
//            QQBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-100, screen_Height/2+110, 50, 50)];
//            //QQBtn.tag = UMSocialSnsTypeMobileQQ;
//            QQBtn.layer.cornerRadius=25;
//            QQBtn=[self createButtonFrame:QQBtn.frame backImageName:@"Image1" title:nil titleColor:nil font:nil target:self action:@selector(onClickQQ:)];
//            UILabel *lab_QQ=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-100-13, screen_Height/2+160, 80, 21)];
//            lab_QQ.text=@"QQ登录";
//            lab_QQ.textColor=[UIColor grayColor];
//            lab_QQ.textAlignment=NSTextAlignmentCenter;
//            lab_QQ.font=[UIFont systemFontOfSize:14];
//            
//            [self.view addSubview:lab_QQ];
//            [self.view addSubview:QQBtn];
//        }
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibosso://wb22222222"]]) {
//            //新浪微博
//            xinlangBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2+100, screen_Height/2+110, 50, 50)];
//            //xinlangBtn.tag = UMSocialSnsTypeSina;
//            xinlangBtn.layer.cornerRadius=25;
//            xinlangBtn=[self createButtonFrame:xinlangBtn.frame backImageName:@"Image3" title:nil titleColor:nil font:nil target:self action:@selector(onClickSina:)];
//            
//            UILabel *lab_WB=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2+100-13, screen_Height/2+160, 80, 21)];
//            lab_WB.text=@"微博登录";
//            lab_WB.textColor=[UIColor grayColor];
//            lab_WB.textAlignment=NSTextAlignmentCenter;
//            lab_WB.font=[UIFont systemFontOfSize:14];
//            [self.view addSubview:lab_WB];
//            [self.view addSubview:xinlangBtn];
//        }
//    }
//    else if(screen_Width == iphone6_width){
//       if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
//        //qq
//        QQBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-100, screen_Height/2+60, 50, 50)];
//        //QQBtn.tag = UMSocialSnsTypeMobileQQ;
//        QQBtn.layer.cornerRadius=25;
//        QQBtn=[self createButtonFrame:QQBtn.frame backImageName:@"Image1" title:nil titleColor:nil font:nil target:self action:@selector(onClickQQ:)];
//            
//            UILabel *lab_QQ=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-100-13, screen_Height/2+120, 80, 21)];
//            lab_QQ.text=@"QQ登录";
//            lab_QQ.textColor=[UIColor grayColor];
//            lab_QQ.textAlignment=NSTextAlignmentCenter;
//            lab_QQ.font=[UIFont systemFontOfSize:14];
//            
//            [self.view addSubview:lab_QQ];
//            [self.view addSubview:QQBtn];
//        }
//         if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]){
//        //微信
//        weixinBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2, screen_Height/2+60, 50, 50)];
//        //    weixinBtn.tag = UMSocialSnsTypeWechatSession;
//        weixinBtn.layer.cornerRadius=25;
//        weixinBtn=[self createButtonFrame:weixinBtn.frame backImageName:@"Image2" title:nil titleColor:nil font:nil target:self action:@selector(onClickWX:)];
//             
//             UILabel *lab_WX=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-13, screen_Height/2+120, 80, 21)];
//             lab_WX.text=@"微信登录";
//             lab_WX.textColor=[UIColor grayColor];
//             lab_WX.textAlignment=NSTextAlignmentCenter;
//             lab_WX.font=[UIFont systemFontOfSize:14];
//             [self.view addSubview:lab_WX];
//             [self.view addSubview:weixinBtn];
//         }
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibosso://wb22222222"]]){
//        //新浪微博
//        xinlangBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2+100, screen_Height/2+60, 50, 50)];
//        //xinlangBtn.tag = UMSocialSnsTypeSina;
//        xinlangBtn.layer.cornerRadius=25;
//        xinlangBtn=[self createButtonFrame:xinlangBtn.frame backImageName:@"Image3" title:nil titleColor:nil font:nil target:self action:@selector(onClickSina:)];
//        
//       
//        UILabel *lab_WB=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2+100-13, screen_Height/2+120, 80, 21)];
//        lab_WB.text=@"微博登录";
//        lab_WB.textColor=[UIColor grayColor];
//        lab_WB.textAlignment=NSTextAlignmentCenter;
//        lab_WB.font=[UIFont systemFontOfSize:14];
//        [self.view addSubview:lab_WB];
//        [self.view addSubview:xinlangBtn];
//        }
//    }
//    else{
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]){
//        //微信
//        weixinBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2, screen_Height/2+70, 50, 50)];
//        //    weixinBtn.tag = UMSocialSnsTypeWechatSession;
//        weixinBtn.layer.cornerRadius=25;
//        weixinBtn=[self createButtonFrame:weixinBtn.frame backImageName:@"Image2" title:nil titleColor:nil font:nil target:self action:@selector(onClickWX:)];
//            
//            UILabel *lab_WX=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-13, screen_Height/2+120, 80, 21)];
//            lab_WX.text=@"微信登录";
//            lab_WX.textColor=[UIColor grayColor];
//            lab_WX.textAlignment=NSTextAlignmentCenter;
//            lab_WX.font=[UIFont systemFontOfSize:14];
//            [self.view addSubview:lab_WX];
//            [self.view addSubview:weixinBtn];
//        }
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]) {
//        //qq
//        QQBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-100, screen_Height/2+70, 50, 50)];
//        //QQBtn.tag = UMSocialSnsTypeMobileQQ;
//        QQBtn.layer.cornerRadius=25;
//        QQBtn=[self createButtonFrame:QQBtn.frame backImageName:@"Image1" title:nil titleColor:nil font:nil target:self action:@selector(onClickQQ:)];
//            
//            UILabel *lab_QQ=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2-100-13, screen_Height/2+120, 80, 21)];
//            lab_QQ.text=@"QQ登录";
//            lab_QQ.textColor=[UIColor grayColor];
//            lab_QQ.textAlignment=NSTextAlignmentCenter;
//            lab_QQ.font=[UIFont systemFontOfSize:14];
//            [self.view addSubview:lab_QQ];
//            [self.view addSubview:QQBtn];
//        }
//        if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"sinaweibosso://wb22222222"]]){
//        //新浪微博
//        xinlangBtn=[[UIButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2+100, screen_Height/2+70, 50, 50)];
//        //xinlangBtn.tag = UMSocialSnsTypeSina;
//        xinlangBtn.layer.cornerRadius=25;
//        xinlangBtn=[self createButtonFrame:xinlangBtn.frame backImageName:@"Image3" title:nil titleColor:nil font:nil target:self action:@selector(onClickSina:)];
//        
//        UILabel *lab_WB=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-50)/2+100-13, screen_Height/2+120, 80, 21)];
//        lab_WB.text=@"微博登录";
//        lab_WB.textColor=[UIColor grayColor];
//        lab_WB.textAlignment=NSTextAlignmentCenter;
//        lab_WB.font=[UIFont systemFontOfSize:14];
//        
//        [self.view addSubview:lab_WB];
//        [self.view addSubview:xinlangBtn];
//        }
//    }
}

-(void)createLabel
{
    if (screen_Width==iphone4_width) {
        UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-140)/2, screen_Height/2+60, 140, 21)];
        label.text=@"第三方账号快速登录";
        label.textColor=[UIColor grayColor];
        label.textAlignment=NSTextAlignmentCenter;
        label.font=[UIFont systemFontOfSize:14];
        [self.view addSubview:label];
    }
    else
    {
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-140)/2, screen_Height/2, 140, 21)];
    label.text=@"第三方账号快速登录";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentCenter;
    label.font=[UIFont systemFontOfSize:14];
    [self.view addSubview:label];
    }
}

//qq
- (void)onClickQQ:(UIButton *)button
{

    
    
}

//weixin
- (void)onClickWX:(UIButton *)button
{
    SendAuthReq* req = [[SendAuthReq alloc] init];
    req.scope =@"snsapi_userinfo,snsapi_base";
    [WXApi sendAuthReq:req
        viewController:self
              delegate:self];
}

//weibo
- (void)onClickSina:(UIButton *)button
{
    
}


//登录
-(void)landClick
{
    if(NETWORKEROR){
    
         [MBProgressHUD showError:@"当前无网络连接"];
        return;
    }
    if ([phone.text isEqualToString:@""])
    {
        
         [MBProgressHUD showError:@"亲,请输入手机号"];
        return;
    }
    BOOL isOk =[LoginModel checkInputMobile:phone.text];
    if (!isOk)
    {
        
         [MBProgressHUD showError:@"您输入的手机号码格式不正确"];
        return;
    }
    if ([pwd.text isEqualToString:@""])
    {
        
         [MBProgressHUD showError:@"亲,请输入密码"];
        return;
    }
    if (pwd.text.length <6)
    {

         [MBProgressHUD showError:@"亲,密码长度至少六位"];
        return;
    }
    
    [self createSignIn];
}

-(void)createSignIn{
    [MBProgressHUD showMessage:@"登陆中" toView:self.view];
    [HUBUser loginWithPhone:phone.text
                   password:pwd.text
                 completion:^(BOOL success, NSError *error) {
                     if (success) {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 
                 HUBClient *client = [HUBClient sharedClient];
                 NSMutableDictionary *Mutabledic = client.currentUser.visibleByRegisteredUsers;
//                         NSString *username = [Mutabledic objectForKey:@"nick"];
                 //通过返回的URL从服务器获取头像
//                         NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:[Mutabledic objectForKey:@"head_url"]]];
                 //存头像
                 [[NSUserDefaults standardUserDefaults]setObject:[Mutabledic objectForKey:@"head_url"] forKey:@"DATA_IMAGE"];
                 [[NSUserDefaults standardUserDefaults]setObject:[Mutabledic objectForKey:@"nick"] forKey:@"USERNAME"];
//                         [[NSUserDefaults standardUserDefaults]setObject:client.currentUser.authenticationToken forKey:@"TOKEN"];
                 [[NSUserDefaults standardUserDefaults]setObject:pwd.text forKey:@"PWD"];
                 [[NSUserDefaults standardUserDefaults]setObject:phone.text forKey:@"PHONE"];
                 MYLOG(@"user is %@", client.currentUser);
                 [LoginModel setLoginOk];
                 [self.navigationController popViewControllerAnimated:YES];
             }
            else {
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                 [MBProgressHUD showError:@"密码或者登录名不存在"];
                 MYLOG(@"user is error %ld------------%@-----------%@", (long)error.code,error.domain,error.userInfo
            );
        }
    }];
}


//快速注册
-(void)registration:(UIButton *)button
{
    //	[self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:[[JDLRegisterViewController alloc]init] animated:YES];
}

//找回密码
-(void)fogetPwd:(UIButton *)button
{
    //	[self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:[[JDLForgotPasswordViewController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UITextField *)createTextFielfFrame:(CGRect)frame font:(UIFont *)font placeholder:(NSString *)placeholder
{
    UITextField *textField=[[UITextField alloc]initWithFrame:frame];
    
    textField.font=font;
    
    textField.textColor=[UIColor grayColor];
    
    textField.borderStyle=UITextBorderStyleNone;
    
    textField.placeholder=placeholder;
    
    return textField;
}

-(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName color:(UIColor *)color
{
    UIImageView *imageView=[[UIImageView alloc]initWithFrame:frame];
    
    if (imageName)
    {
        imageView.image=[UIImage imageNamed:imageName];
    }
    if (color)
    {
        imageView.backgroundColor=color;
    }
    
    return imageView;
}



-(UIButton *)createButtonFrame:(CGRect)frame backImageName:(NSString *)imageName title:(NSString *)title titleColor:(UIColor *)color font:(UIFont *)font target:(id)target action:(SEL)action
{
    UIButton *btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    if (imageName)
    {
        [btn setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    
    if (font)
    {
        btn.titleLabel.font=font;
    }
    
    if (title)
    {
        [btn setTitle:title forState:UIControlStateNormal];
    }
    if (color)
    {
        [btn setTitleColor:color forState:UIControlStateNormal];
    }
    if (target&&action)
    {
        [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    }
    return btn;
}

#pragma mark wx
-(void)getAccess_token
{
    //https://api.weixin.qq.com/sns/oauth2/access_token?appid=APPID&secret=SECRET&code=CODE&grant_type=authorization_code
    NSString *wx_code=[[NSUserDefaults standardUserDefaults]objectForKey:@"wx_code"];
    MYLOG(@"wx_code%@",wx_code);
    NSString *urlString =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/oauth2/access_token?appid=%@&secret=%@&code=%@&grant_type=authorization_code",kWeiXinAppId,kWeiXinAppSecret,wx_code];
    
    NSString * encodedString = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)urlString, NULL, NULL,  kCFStringEncodingUTF8 ));
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:encodedString];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                MYLOG(@"--wx-getAccess_token  %@",[dic description]);
                self.wx_access_token = [dic objectForKey:@"access_token"];
                self.wx_openid = [dic objectForKey:@"openid"];
                [self getUserInfo];
            }
        });
    });
}

-(void)getUserInfo
{
    // https://api.weixin.qq.com/sns/userinfo?access_token=ACCESS_TOKEN&openid=OPENID
    NSString *url =[NSString stringWithFormat:@"https://api.weixin.qq.com/sns/userinfo?access_token=%@&openid=%@",self.wx_access_token,self.wx_openid];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *zoneUrl = [NSURL URLWithString:url];
        NSString *zoneStr = [NSString stringWithContentsOfURL:zoneUrl encoding:NSUTF8StringEncoding error:nil];
        NSData *data = [zoneStr dataUsingEncoding:NSUTF8StringEncoding];
        dispatch_async(dispatch_get_main_queue(), ^{
            if (data) {
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
                MYLOG(@"--wx-getUserInfo  %@",[dic description]);
            }
        });
    });
}



@end
