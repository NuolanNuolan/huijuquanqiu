//
//  JDLForgotPasswordViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/25.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLForgotPasswordViewController.h"
#import "JDLNewPassWardViewController.h"
#import "LoginModel.h"

@interface JDLForgotPasswordViewController ()<UITextFieldDelegate>
{
    UIView *bgView;
    UITextField *code;
    UINavigationBar *customNavigationBar;
    UIButton *yzButton;
}

@property(nonatomic, copy) NSString *oUserPhoneNum;
@property(assign, nonatomic) NSInteger timeCount;
@property(strong, nonatomic) NSTimer *timer;
//验证码
@property(copy, nonatomic) NSString *smsId;
@property (nonatomic, strong) UITextField *phone;
@property (nonatomic , strong) MBProgressHUD *hud;
@end

@implementation JDLForgotPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    [self createNavLeftItem];
//    dismiss_w;
//    HubSign;
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
    label.text=@"请输入您的手机号码";
    label.textColor=[UIColor grayColor];
    label.textAlignment=NSTextAlignmentLeft;
    label.font=[UIFont systemFontOfSize:13];
    
    [self.view addSubview:label];
    
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(10, 110, frame.size.width-20, 100)];
    bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    _phone=[self createTextFielfFrame:CGRectMake(100, 10, 200, 30) font:[UIFont systemFontOfSize:14] placeholder:@"您注册时的手机号"];
    _phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phone.keyboardType=UIKeyboardTypeNumberPad;
    //phone.text=@"15527002684";
    
    code=[self createTextFielfFrame:CGRectMake(100, 60, 90, 30) font:[UIFont systemFontOfSize:14]  placeholder:@"6位数字" ];
    code.clearButtonMode = UITextFieldViewModeWhileEditing;
    //code.text=@"mojun1992225";
    //密文样式
    code.keyboardType=UIKeyboardTypeNumberPad;
    code.delegate =self;
    
    
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
    
    
    yzButton=[[UIButton alloc]initWithFrame:CGRectMake(bgView.frame.size.width-100-15, 62, 100, 30)];
    yzButton.layer.cornerRadius=3.0f;
    yzButton.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [yzButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [yzButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    //    yzButton.font=[UIFont systemFontOfSize:13];
    yzButton.titleLabel.font = [UIFont systemFontOfSize: 13.0];
    [yzButton addTarget:self action:@selector(getValidCode_Forgot:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:yzButton];
    
    UIImageView *line1=[self createImageViewFrame:CGRectMake(20, 50, bgView.frame.size.width-40, 1) imageName:nil color:[UIColor colorWithRed:180/255.0f green:180/255.0f blue:180/255.0f alpha:.3]];
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"下一步" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick_NEW)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    
    [bgView addSubview:_phone];
    [bgView addSubview:code];
    
    [bgView addSubview:phonelabel];
    [bgView addSubview:codelabel];
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

- (void)getValidCode_Forgot:(UIButton *)sender
{
    if (NETWORKEROR) {
        
        [MBProgressHUD showError:@"当前无网络连接"];
        return;
    }
    if ([_phone.text isEqualToString:@""])
    {
        
        [MBProgressHUD showError:@"请输入手机号"];
        return;
    }
    //手机号格式
    BOOL isOk =[LoginModel checkInputMobile:_phone.text];
    if (!isOk)
    {
        
        [MBProgressHUD showError:@"手机号格式不正确"];
        return;
    }
    sender.userInteractionEnabled = NO;
    self.timeCount = 60;
    
    HUBClient *client = [HUBClient sharedClient];
    [client getLostPasswordAuthCode:_phone.text completion:^(BOOL success, NSError *error) {
        if (success) {

            self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(reduceTime:) userInfo:sender repeats:YES];
        }else{
            MYLOG(@"error%@",error);
           
        [MBProgressHUD showError:@"验证码请求失败,请稍后再试"];
        }
    }];
    
  
}


- (void)reduceTime:(NSTimer *)codeTimer {
    self.timeCount--;
    if (self.timeCount == 0) {
        [yzButton setTitle:@"重新获取验证码" forState:UIControlStateNormal];
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

//验证码
-(void)landClick_NEW
{
    
        if (NETWORKEROR) {
            
                    [MBProgressHUD showError:@"当前无网络连接"];
            return;
        }
        if ([_phone.text isEqualToString:@""])
        {
            
                    [MBProgressHUD showError:@"请输入手机号"];
            return;
        }
        //手机号格式
        BOOL isOk =[LoginModel checkInputMobile:_phone.text];
        if (!isOk)
        {

                    [MBProgressHUD showError:@"您输入的手机号码格式不正确"];
            return;
        }
        else if ([code.text isEqualToString:@""])
        {
            
                    [MBProgressHUD showError:@"请输入验证码"];
            return;
        }
        else if (code.text.length<6||code.text.length>6)
        {
            
                    [MBProgressHUD showError:@"验证码格式不正确"];
            return;
        }
    JDLNewPassWardViewController *new=[[JDLNewPassWardViewController alloc]init];
    //赋值
    new.userPhone=_phone.text;
    new.code = code.text;
    [self.navigationController pushViewController:new animated:YES];
    
    
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_phone resignFirstResponder];
    [code resignFirstResponder];
    
}

-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [_phone resignFirstResponder];
    [code resignFirstResponder];
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
