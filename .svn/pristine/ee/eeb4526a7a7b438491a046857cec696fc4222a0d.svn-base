//
//  JDLNewPassWardViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/25.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLNewPassWardViewController.h"
#import "JDLLoggingViewController.h"
#import "JDLMeViewController.h"

@interface JDLNewPassWardViewController ()<UITextFieldDelegate>
{
    UIView *bgView;
    UITextField *passward;
    UITextField *passward_QR;
}
@property (nonatomic , strong) MBProgressHUD *hud;
@end

@implementation JDLNewPassWardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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

-(void)createTextFields
{
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake(30, 75, self.view.frame.size.width-90, 30)];
    label.text=@"请设置新的密码";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 100)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    passward=[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"6-20位字母或数字"];
    passward.clearButtonMode = UITextFieldViewModeWhileEditing;
    passward.secureTextEntry=YES;
    passward.delegate =self;
    
    passward_QR=[self createTextFielfFrame:CGRectMake(100, 60, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"请确认您的密码"];
    passward_QR.clearButtonMode = UITextFieldViewModeWhileEditing;
    passward_QR.secureTextEntry=YES;
    passward_QR.delegate =self;
    
    UILabel *phonelabel=[[UILabel alloc]initWithFrame:CGRectMake(20, 12, 50, 25)];
    phonelabel.text=@"密码";
    phonelabel.textColor=[UIColor blackColor];
    phonelabel.textAlignment=NSTextAlignmentLeft;
    phonelabel.font=[UIFont systemFontOfSize:14];
    
    UILabel *pwd_QR=[[UILabel alloc]initWithFrame:CGRectMake(20, 62, 100, 25)];
    pwd_QR.text=@"确认密码";
    pwd_QR.textColor=[UIColor blackColor];
    pwd_QR.textAlignment=NSTextAlignmentLeft;
    pwd_QR.font=[UIFont systemFontOfSize:14];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"完成" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(okClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    [bgView addSubview:passward];
    [bgView addSubview:passward_QR];
    
    [bgView addSubview:pwd_QR];
    [bgView addSubview:phonelabel];
    [bgView addSubview:line1];
    [self.view addSubview:landBtn];
}
//TEXT开始编辑
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    
    if (screen_Width==iphone4_width) {
        [UIView animateWithDuration:0.3 animations:^{
            
            self.view.frame = CGRectMake(0, -30, screen_Width, screen_Height+30) ;
        }];
        return YES;
    }
    return YES;
}


-(void)okClick
{
    if([passward.text isEqualToString:@""])
    {
        
        
         [MBProgressHUD showError:@"请输入您的密码"];
        return;
    }
    if(passward.text.length>20||passward.text.length<6)
    {
        
        
         [MBProgressHUD showError:@"您输入的密码格式不正确"];
        return;
    }
    if([passward_QR.text isEqualToString:@""])
    {
        
        
         [MBProgressHUD showError:@"请确认您的密码"];
        return;
    }
    if(![passward.text isEqualToString:passward_QR.text])
    {
        
         [MBProgressHUD showError:@"您两次输入的密码不相同"];
        return;
    }
    [self createPwd];
    //    //    [self.tabBarController.tabBar setHidden:NO];
    //    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    //    [self dismissViewControllerAnimated:YES completion:nil];
    //    [self.navigationController pushViewController:[[JDLMeViewController alloc]init] animated:YES];
    
    
}

-(void)createPwd{
    HUBClient *client = [HUBClient sharedClient];
    [client changePasswordWithPhone:_userPhone
                           password:passward_QR.text
                           authCode:_code
                         completion:^(BOOL success, NSError *error) {
                 if (success) {
                     MYLOG(@"change password successfully");
                     [MBProgressHUD show:@"修改成功,请使用新密码登录" icon:@"success.png" view:nil];
                     //	[self.tabBarController.tabBar setHidden:YES];
                     self.navigationController.interactivePopGestureRecognizer.enabled = YES;
                     [self.navigationController popToViewController:[self.navigationController.viewControllers objectAtIndex:1] animated:YES];
                 } else {
                     // display error
                     MYLOG(@"change password error %@", error);
                     
                      [MBProgressHUD showError:@"你输入的手机号或验证码错误"];
                 }
                 
             }];
}




-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [passward resignFirstResponder];
    [passward_QR resignFirstResponder];
}

-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [passward resignFirstResponder];
    [passward_QR resignFirstResponder];
    if (screen_Width==iphone4_width) {
        //键盘收回的时候,
        [UIView animateWithDuration:0.3 animations:^{
            
            self.view.frame = CGRectMake(0, 0, screen_Width, screen_Height) ;
        }];

        
    }
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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
