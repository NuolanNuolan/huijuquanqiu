//
//  JDLRegisterViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/23.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLRegisterViewController.h"
#import "JDLPassWardViewController.h"
#import "LoginModel.h"
#import "JDLHeadViewController.h"


@interface JDLRegisterViewController ()<UITextFieldDelegate>
{
    UIView *bgView;
    UITextField *phone;
    UITextField *code;
    UITextField *pwd;
    UITextField *pwd_QR;
    UINavigationBar *customNavigationBar;
    UIButton *yzButton;
    
    
}
@property(assign, nonatomic) NSInteger timeCount;
@property(strong, nonatomic) NSTimer *timer;
//验证码
@property(copy, nonatomic) NSString *smsId;
//HUD
@property (nonatomic , strong) MBProgressHUD *hud;
@end

@implementation JDLRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"注册";
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    [self createNavLeftItem];
//    dismiss_w;
    
    [self createTextFields];
}


//设置返回按钮
-(void)createNavLeftItem{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];    
}


-(void)createViewClick
{
    //	[self.tabBarController.tabBar setHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}


//设置注册
-(void)createTextFields
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
    label.text=@"请输入您的手机号码";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:13];
    
    [self.view addSubview:label];
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 200)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    phone=[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"11位手机号"];
    phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    phone.keyboardType=UIKeyboardTypeNumberPad;
    
    code=[self createTextFielfFrame:CGRectMake(100, 60, 90, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"6位数字" ];
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    //密文样式
    //code.secureTextEntry=YES;
    code.keyboardType=UIKeyboardTypeNumberPad;
    
    pwd=[self createTextFielfFrame:CGRectMake(100, 110, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"6-20位字母或数字"];
    pwd.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwd.secureTextEntry=YES;
    pwd.delegate = self;
    
    pwd_QR=[self createTextFielfFrame:CGRectMake(100, 160, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"6-20位字母或数字"];
    pwd_QR.clearButtonMode = UITextFieldViewModeWhileEditing;
    pwd_QR.secureTextEntry=YES;
    pwd_QR.delegate = self;
    
    
    UILabel *phonelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    phonelabel.text=@"手机号";
    phonelabel.textColor=[UIColor blackColor];
    phonelabel.textAlignment=NSTextAlignmentLeft;
    phonelabel.font=[UIFont systemFontOfSize:14];
    
    UILabel *codelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 62, 50, 25)];
    codelabel.text=@"验证码";
    codelabel.textColor=[UIColor blackColor];
    codelabel.textAlignment=NSTextAlignmentLeft;
    codelabel.font=[UIFont systemFontOfSize:14];
    
    UILabel *pwdlable=[[UILabel alloc]initWithFrame:CGRectMake(20, 112, 50, 25)];
    pwdlable.text=@"密码";
    pwdlable.textColor=[UIColor blackColor];
    pwdlable.textAlignment=NSTextAlignmentLeft;
    pwdlable.font=[UIFont systemFontOfSize:14];
    
    UILabel *pwd_QRlable=[[UILabel alloc]initWithFrame:CGRectMake(20, 162, 80, 25)];
    pwd_QRlable.text=@"确认密码";
    pwd_QRlable.textColor=[UIColor blackColor];
    pwd_QRlable.textAlignment=NSTextAlignmentLeft;
    pwd_QRlable.font=[UIFont systemFontOfSize:14];
    
    
    yzButton=[[UIButton alloc]initWithFrame:CGRectMake(bgView.frame.size.width-100-15, 62, 100, 30)];
    yzButton.layer.cornerRadius=3.0f;
    yzButton.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [yzButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [yzButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//    yzButton.font=[UIFont systemFontOfSize:13];
    yzButton.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [yzButton addTarget:self action:@selector(getValidCode:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:yzButton];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    UIImageView *line2=[self createImageViewFrame:CGRectMake(20, 100, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    UIImageView *line3=[self createImageViewFrame:CGRectMake(20, 150, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"完成" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(next_Register)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    
    [bgView addSubview:phone];
    [bgView addSubview:code];
    [bgView addSubview:pwd];
    [bgView addSubview:pwd_QR];
    
    [bgView addSubview:phonelabel];
    [bgView addSubview:codelabel];
    [bgView addSubview:line1];
    [bgView addSubview:line2];
    [bgView addSubview:line3];
    [bgView addSubview:pwdlable];
    [bgView addSubview:pwd_QRlable];
    [self.view addSubview:landBtn];
    
}
//TEXT开始编辑
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (screen_Width==iphone4_width) {
        [UIView animateWithDuration:0.3 animations:^{
            
            self.view.frame = CGRectMake(0, -110, screen_Width, screen_Height+110) ;
        }];
        return YES;
    }
    return YES;
}


//获取验证码
- (void)getValidCode:(UIButton *)sender
{
    if (NETWORKEROR) {
        
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
        
        [MBProgressHUD showError:@"亲,手机号格式不正确"];
        return;
    }
    sender.userInteractionEnabled = NO;
    self.timeCount = 60;

    
    HUBClient *client = [HUBClient sharedClient];
    [client getSignUpAuthCode:phone.text completion:^(BOOL success, NSError *error) {
        if (success) {
            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduceTime:) userInfo:sender repeats:YES];
        }else{
        
            
            [MBProgressHUD showError:@"您输入的手机号已经注册"];
        }
    }];
}


//获取验证码时间
- (void)reduceTime:(NSTimer *)codeTimer {
    self.timeCount--;
    if (self.timeCount == 0) {
        [yzButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
        yzButton.backgroundColor = [UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
        [yzButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        UIButton *info = codeTimer.userInfo;
        info.enabled = YES;
        yzButton.userInteractionEnabled = YES;
        [self.timer invalidate];
    } else {
        NSString *str = [NSString stringWithFormat:@"%lu秒后重新获取", (long)self.timeCount];
        [yzButton setTitle:str forState:UIControlStateNormal];
        yzButton.userInteractionEnabled = NO;
        
    }
}

-(void)next_Register
{

        if (NETWORKEROR)
        {
            
        
             [MBProgressHUD showError:@"当前无网络连接"];

            return;
        }
        if ([phone.text isEqualToString:@""])
        {
            
            
             [MBProgressHUD showError:@"请输入手机号"];
            return;
        }
        BOOL isOk =[LoginModel checkInputMobile:phone.text];
        if (!isOk)
        {
            
            
             [MBProgressHUD showError:@"您输入的手机号码格式不正确!"];
            return;
        }
         if ([code.text isEqualToString:@""])
        {
            
             [MBProgressHUD showError:@"亲,请输入验证码"];
            return;
        }
        if (code.text.length<6||code.text.length>6)
        {
            
             [MBProgressHUD showError:@"验证码格式不正确"];
            return;
        }
         if ([pwd.text isEqualToString:@""])
        {
            
            
             [MBProgressHUD showError:@"亲,请输入您的密码"];
            return;
        }
        if (pwd.text.length<6||pwd.text.length>20 )
        {
            
            
             [MBProgressHUD showError:@"亲,密码格式不正确"];
            return;
        }
        if ([pwd_QR.text isEqualToString:@""])
        {
            
            
             [MBProgressHUD showError:@"亲,请确认您的密码"];
            return;
        }
         if (![pwd.text isEqualToString:pwd_QR.text])
        {

            
             [MBProgressHUD showError:@"亲,两次输入的密码不相同"];
            return;
        }
    [self creatHubSingUp];

}

-(void)creatHubSingUp{
    HUBClient *client = [HUBClient sharedClient];
    [client createUserWithPhone:phone.text authCode:code.text password:pwd.text completion:^(BOOL success, NSError *error) {
        if (success) {
            MYLOG(@"user is %@", client.currentUser);
            [HUBUser loginWithPhone:phone.text
                           password:pwd.text
                         completion:^(BOOL success, NSError *error) {
                             if (success) {
                                 HUBClient *client = [HUBClient sharedClient];
                                 MYLOG(@"user is %@", client.currentUser);
                             } else {
                                 // show error
                                 MYLOG(@"user is error %@", error);
                                 
                             }
                         }];
            
            JDLHeadViewController *Head = [[JDLHeadViewController alloc]init];
            //传值过去
            Head.phone = phone.text;
            Head.pwd = pwd.text;
            [self.navigationController pushViewController:Head animated:YES];
        } else {
            MYLOG(@"sign up error=%@",error);
            
            [MBProgressHUD showError:@"您输入的手机号已经注册"];
        }
    }];
    
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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [phone resignFirstResponder];
    [code resignFirstResponder];
    [pwd resignFirstResponder];
    [pwd_QR resignFirstResponder];
    
    
}

-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [phone resignFirstResponder];
    [code resignFirstResponder];
    [pwd resignFirstResponder];
    [pwd_QR resignFirstResponder];
    if (screen_Width==iphone4_width) {
        //键盘收回的时候,
        [UIView animateWithDuration:0.3 animations:^{
            
            self.view.frame = CGRectMake(0, 0, screen_Width, screen_Height) ;
        }];
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
