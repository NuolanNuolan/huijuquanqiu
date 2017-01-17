//
//  JDLHeadViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/25.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLHeadViewController.h"
#import "JDLLoggingViewController.h"
#import "JDLMeViewController.h"
#import "LoginModel.h"
#import "MainTabBarController.h"
#import "AppDelegate.h"
#import "User.h"


@interface JDLHeadViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,SZKImagePickerVCDelegate>
{
    OSSClient *client_oss;
    UIView *bgView;
    UITextField *username;   //昵称
    UIImage *_image;
    NSString *_image_string;
    OSSClient *ossClient;
    
}
@property(nonatomic,strong)MBProgressHUD *hud;
@property (nonatomic,strong) UIButton *head; //头像
@end

@implementation JDLHeadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    [self headimage_upload];
    [self createNavLeftItem];
//    dismiss_w;
    [self createUI];
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
    CGRect frame=[UIScreen mainScreen].bounds;
    bgView=[[UIView alloc]initWithFrame:CGRectMake(0, 270,frame.size.width, 50)];
    //bgView.layer.cornerRadius=3.0;
    bgView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgView];
    
    username=[self createTextFielfFrame:CGRectMake(10, 10, self.view.frame.size.width-20, 30) font:[UIFont systemFontOfSize:14] placeholder:@"请输入昵称"];
    username.textAlignment=NSTextAlignmentLeft;
    username.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    UIButton *landBtn=[self createButtonFrame:CGRectMake(10, bgView.frame.size.height+bgView.frame.origin.y+30,self.view.frame.size.width-20, 37) backImageName:nil title:@"完成" titleColor:[UIColor whiteColor]  font:[UIFont systemFontOfSize:17] target:self action:@selector(landClick)];
    landBtn.backgroundColor=[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    landBtn.layer.cornerRadius=5.0f;
    
    [bgView addSubview:username];
    
    [self.view addSubview:landBtn];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [username resignFirstResponder];
    
}

-(void)touchesEnded:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    [username resignFirstResponder];
    
}


//点击完成按钮
-(void)landClick
{
    if(NETWORKEROR){
        
        
        [MBProgressHUD showError:@"当前无网络连接"];
        return;
    }
    if (_image ==nil) {
        
        [MBProgressHUD showError:@"请您设置头像"];
        return;
    }
    if([username.text isEqualToString:@""])
    {
        [MBProgressHUD showError:@"昵称不能为空"];
        return;
    }
    NSCharacterSet *errorCharStr = [NSCharacterSet
                                    
                                    characterSetWithCharactersInString:@",.;{}[]|<>~!@#$%^&*+?/= "];
    
    NSRange range = (NSRange){65535,0};
    
    range = [username.text rangeOfCharacterFromSet:errorCharStr];
    
    if (range.length > 0) {
        [MBProgressHUD showError:@"昵称非法"];
        return ;
        
    }
//    [self createUploadName];
    //登录状态改变
    [LoginModel setLoginOk];
    
    
    [ self.navigationController popToRootViewControllerAnimated: YES ];
}

-(void)createUploadName{
    
    HUBClient *client = [HUBClient sharedClient];
    HUBUser *user = [client currentUser];
    [user.visibleByRegisteredUsers setObject:[NSString stringWithFormat:@"%@",username.text] forKey:@"nick"];
    [user updateWithCompletion:^(HUBUser *user, NSError *error) {
        if (error == nil) {
            MYLOG(@"user is %@", [user jsonString]);
            
        } else {
            MYLOG(@"error %@", error);
        }
    }];

}

-(void)createLongUp{
//
    [HUBUser loginWithUsername:_phone
                      password:_pwd
                    completion:^(BOOL success, NSError *error) {
            if (success) {
                
                //登录状态改变
                [LoginModel setLoginOk];
                [ self.navigationController popToRootViewControllerAnimated: YES ];
            } else {
                // show error
                MYLOG(@"user is error %@", error);
                //            [MBProgressHUD showError:@"用户名或密码不存在"];
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




-(void)createUI
{
    UIImageView *bg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250)];
    [bg setImage:[UIImage imageNamed:@"mycenter_bg.png"]];
    bg.backgroundColor=[UIColor grayColor];
    [self.view addSubview:bg];
    
    _head=[[UIButton alloc]initWithFrame:CGRectMake((self.view.frame.size.width-80)/2, 110, 80, 80)];
    [_head setImage:[UIImage imageNamed:@"head"] forState:UIControlStateNormal];
    _head.layer.cornerRadius=40;
    _head.layer.masksToBounds = YES;
    _head.backgroundColor=[UIColor whiteColor];
    [_head addTarget:self action:@selector(changeHeadView1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_head];
    
    UILabel *label=[[UILabel alloc]initWithFrame:CGRectMake((self.view.frame.size.width-80)/2, 180, 80, 80)];
    label.text=@"点击设置头像";
    label.textColor=[UIColor whiteColor];
    label.font=[UIFont systemFontOfSize:13];
    [self.view addSubview:label];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [username resignFirstResponder];
    return YES;
}

-(void)changeHeadView1:(UIButton *)tap
{
    [self.view  resignFirstResponder];
    //判断是否支持相机  模拟器去除相机功能
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"打开照相机",@"从相册上传" ,nil];
        [sheet showInView:self.view];
    }else{
        UIActionSheet *sheet=[[UIActionSheet alloc]initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"从相册上传" ,nil];
        [sheet showInView:self.view];
    }
    
}

#pragma mark-----UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //判断是否支持相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        switch (buttonIndex) {
            case 0:{
                [self presentViewController:ImagePickerStyleCamera];
            }
                break;
            case 1:{
                [self presentViewController:ImagePickerStylePhotoLibrary];
            }
                break;
            default:
                break;
        }
    }else{
        switch (buttonIndex) {
            case 0:{
                [self presentViewController:ImagePickerStylePhotoLibrary];
            }
                break;
            default:
                break;
        }
    }
}
#pragma mark----跳转到SZKImagePickerVC
-(void)presentViewController:(imagePickerStyle)style
{
    SZKImagePickerVC *picker=[[SZKImagePickerVC alloc]initWithImagePickerStyle:style];
    picker.SZKDelegate=self;
    [self presentViewController:picker animated:YES completion:nil];
}
#pragma mark----SZKImagePickerVCDelegate
-(void)imageChooseFinish:(UIImage *)image
{
//    [_head setBackgroundImage:image forState:UIControlStateNormal];
    _image =image;
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    
    put.bucketName = @"huijuquanqiu";
    NSString *objectID =[[NSUUID UUID] UUIDString ];
    put.objectKey = [objectID stringByAppendingString:@".png"];
    
    put.uploadingData = data; // 直接上传NSData
    
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
    };
    
    OSSTask * putTask = [client_oss putObject:put];
    
    [putTask continueWithBlock:^id(OSSTask *task) {
        [MBProgressHUD showMessage:@"上传中"];
        if (!task.error) {
            MYLOG(@"upload object success!");
            NSString *_head_url = @"http://huijuquanqiu.oss-cn-hangzhou.aliyuncs.com/";
            HUBClient *client = [HUBClient sharedClient];
            HUBUser *user = [client currentUser];
            [user.visibleByRegisteredUsers setObject:[_head_url stringByAppendingString:put.objectKey] forKey:@"head_url"];
            [user updateWithCompletion:^(HUBUser *user, NSError *error) {
                if (error == nil) {
                    MYLOG(@"user is %@", user);
                    [_head setBackgroundImage:image forState:UIControlStateNormal];
                    [[NSUserDefaults standardUserDefaults]setObject:[_head_url stringByAppendingString:put.objectKey] forKey:@"DATA_IMAGE"];
                    //                    [self loadSHUJU];
                }
                else {
                    
                    
                     [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                }
            }];
            
        } else {
            MYLOG(@"upload object failed, error: %@" , task.error);
        }
        return nil;
    }];

}
-(void)headimage_upload
{
    
    // DataHubDemo: Init OSS
    
    NSString *endpoint = @"http://oss-cn-hangzhou.aliyuncs.com";
    
    // 明文设置secret的方式建议只在测试时使用，更多鉴权模式请参考后面的`访问控制`章节
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:@"m1ytvMZjTNi6peMx"
                                                                                                            secretKey:@"B8BcBrhxlbaShuRYd4v99b7H886YvF"];
    
    client_oss = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
