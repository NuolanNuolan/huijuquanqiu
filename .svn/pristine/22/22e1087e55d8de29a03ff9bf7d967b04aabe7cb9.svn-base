//
//  JDLFeedbackViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/20.
//  Copyright © 2016年 JDL. All rights reserved.
//

//
//  JDLFeedbackViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/20.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLFeedbackViewController.h"
#import "HUBClient.h"
#import "Feedback.h"
#import <AliyunOSSiOS/OSSService.h>


@interface JDLFeedbackViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UIActionSheetDelegate,UITextFieldDelegate,SZKImagePickerVCDelegate>
{
    
    //主滚动视图
    UIScrollView * Scro_view;
    //感谢lable
    UILabel *_lab_thank;
    //4个textfild
    UITextField *_name;
    UITextField *_email;
    UITextField *_phone;
    UITextField *_other;
    //提交按钮
    UIButton *_btn_comit;
    //添加图片按钮;
    UIButton *_btn_image;
    //装整个图片
    //    UIImageView        *add_img_view;
    //图片数组
    NSMutableArray     *_imgs;
    NSMutableArray *_imgsToUpload;
    Feedback  *_feedback;
    OSSClient *client;
    
    //    int j;
    int tag;
    NSUInteger _isTuchImageValue;
    
    UIView *_myView;
    //view
    UIView *_view_SC;
}
@property (nonatomic, retain) UITextView *textView;
@end

@implementation JDLFeedbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //返回
    [self Dismiss];
    //创建Scollview
    tag=1;
    _isTuchImageValue=0;
    [self CrateScollew];
    // Do any additional setup after loading the view.
    
    
    // DataHubDemo: Init OSS
    
    NSString *endpoint = @"http://oss-cn-hangzhou.aliyuncs.com";
    
    // 明文设置secret的方式建议只在测试时使用，更多鉴权模式请参考后面的`访问控制`章节
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:@"JR1xELgBWrNYDzLI"
                                                                                                            secretKey:@"2ybKSKdjwRkV4ApanrDUBDHd8BHzM6"];
    
    client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    
}
-(void)Dismiss
{
    
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0f green:232/255.0f blue:232/255.0f alpha:1];
    self.title = @"意见反馈";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    
}
-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)CrateScollew
{
    
    
    //
    Scro_view = [[UIScrollView alloc]initWithFrame:CGRectMake(10, 10, screen_Width-20, screen_Height)];
    Scro_view.contentSize = CGSizeMake(screen_Width-20, screen_Height+10);
    //    Scro_view.pagingEnabled = YES;
    //    Scro_view.scrollEnabled = NO;
    Scro_view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:Scro_view];
    
    //给整个Scrollew添加单机事件
    UITapGestureRecognizer *dianji=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yc)];
    [Scro_view addGestureRecognizer:dianji];
    
    
    self.textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 0, Scro_view.frame.size.width, 170)]; //初始化大小并自动释放
    //self.textView.textAlignment = NSTextAlignmentLeft; // 设置字体对其方式
    self.textView.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];//设置textview里面的字体颜色
    self.textView.font = [UIFont fontWithName:@"Arial" size:13.0];//设置字体名字和字体大小
    self.textView.delegate = self;//设置它的委托方法
    self.textView.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    self.textView.returnKeyType = UIReturnKeyDefault;//返回键的类型
    self.textView.keyboardType = UIKeyboardTypeDefault;//键盘类型
    self.textView.scrollEnabled = YES;//是否可以拖动
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    self.textView.layer.masksToBounds=YES;
    self.textView.layer.cornerRadius=4.0f;
    [Scro_view addSubview:self.textView];
    
    _btn_image = [[UIButton alloc]initWithFrame:CGRectMake(Scro_view.frame.size.width-30, 140, 30, 30)];
    [_btn_image setImage:[UIImage imageNamed:@"btn_uploadPic"] forState:UIControlStateNormal];
    [_btn_image addTarget:self action:@selector(btn_image) forControlEvents:UIControlEventTouchUpInside];
    [Scro_view addSubview:_btn_image];
    
    //view
    _view_SC = [[UIView alloc]initWithFrame:CGRectMake(0, 180, Scro_view.frame.size.width, 630)];
    _view_SC.backgroundColor = [UIColor clearColor];
    [Scro_view addSubview:_view_SC];
    
    _lab_thank = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, Scro_view.frame.size.width, 40)];
    _lab_thank.text = @"感谢您提出的意见或者建议,您留下的任何信息都将用来改善我们的软件.";
    _lab_thank.font = [UIFont systemFontOfSize:13.0f];
    _lab_thank.numberOfLines = 2;
    _lab_thank.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
    [_view_SC addSubview:_lab_thank];
    
    _name=[self createTextFielfFrame:CGRectMake(0, 45, Scro_view.frame.size.width, 50) font:[UIFont systemFontOfSize:14.0f] placeholder:@"姓名"];
    _name.clearButtonMode = UITextFieldViewModeWhileEditing;
    _name.backgroundColor = [UIColor whiteColor];
    _name.delegate =self;
    [_view_SC addSubview:_name];
    
    _email=[self createTextFielfFrame:CGRectMake(0, 100, Scro_view.frame.size.width, 50) font:[UIFont systemFontOfSize:14.0f] placeholder:@"邮箱"];
    _email.clearButtonMode = UITextFieldViewModeWhileEditing;
    _email.backgroundColor = [UIColor whiteColor];
    _email.delegate =self;
    [_view_SC addSubview:_email];
    
    _phone=[self createTextFielfFrame:CGRectMake(0, 155, Scro_view.frame.size.width, 50) font:[UIFont systemFontOfSize:14.0f] placeholder:@"电话"];
    _phone.clearButtonMode = UITextFieldViewModeWhileEditing;
    _phone.backgroundColor = [UIColor whiteColor];
    _phone.delegate =self;
    [_view_SC addSubview:_phone];
    
    _other=[self createTextFielfFrame:CGRectMake(0, 210, Scro_view.frame.size.width, 50) font:[UIFont systemFontOfSize:14.0f] placeholder:@"其他联系方式,如QQ,微信等"];
    _other.clearButtonMode = UITextFieldViewModeWhileEditing;
    _other.backgroundColor = [UIColor whiteColor];
    _other.delegate =self;
    [_view_SC addSubview:_other];
    
    _btn_comit = [[UIButton alloc]initWithFrame:CGRectMake(0, 280, Scro_view.frame.size.width, 50)];
    [_btn_comit setBackgroundImage: [UIImage imageNamed:@"btn_Submit_pre"] forState:UIControlStateNormal];
    [_btn_comit setTitle:@"提  交" forState:UIControlStateNormal];
    _btn_comit.layer.masksToBounds=YES;
    _btn_comit.layer.cornerRadius =4.0f;
    [_btn_comit addTarget:self action:@selector(Comit) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_view_SC addSubview:_btn_comit];
}
//添加图片
-(void)btn_image
{
    
    [Scro_view  resignFirstResponder];
    [self.textView resignFirstResponder];
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
    [self Add_SP_img:image];
}
//加载图片到滚动试图
-(void)Add_SP_img:(UIImage *)addimg{
    if (!_imgs) {
        _imgs = [[NSMutableArray alloc] initWithCapacity:0];
    }
    
    //添加图片进数组
    if(addimg){
        
        [_imgs addObject:addimg];
        
    }
    //加载图片,当有图片的时候下面所有坐标改变
    if ([_imgs count]>0) {
        
        _view_SC.frame = CGRectMake(0, 300, Scro_view.width, 630);
        if(screen_Width ==iphone4_width)
        {
            
            Scro_view.contentSize = CGSizeMake(screen_Width-20, screen_Height+200);
        }
    }
    //    这个UIView 用来存放 选中的图片
    if(!_myView){
        
        _myView=[[UIView alloc]initWithFrame:CGRectMake(0,180,Scro_view.width, 110)];
        
        _myView.backgroundColor=[UIColor clearColor];
        
        [Scro_view addSubview:_myView];
    }else{
        //        移除_myView 上得所有子视图(图片)
        [_myView removeAllSubviews];
    }
    //    是否可以添加图片
    if ([_imgs count]==3) {
        _btn_image.userInteractionEnabled=NO;
    }else{
        _btn_image.userInteractionEnabled=YES;
    }
    //加载imageView图片
    for (int i=0; i<[_imgs count]; i++) {
        UIImageView *itempImage = [[UIImageView alloc]initWithImage:[_imgs objectAtIndex:i]];
        itempImage.userInteractionEnabled=YES;
        itempImage.backgroundColor = [UIColor redColor];
        UITapGestureRecognizer * longtap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(longTap:)];
        [itempImage addGestureRecognizer:longtap];
        itempImage.frame = CGRectMake(_myView.width/3*i+5, 0,_myView.width/3-10, 110);
        itempImage.tag=i+1;
        [_myView addSubview:itempImage];
    }
    
    if ([_imgs count]==0) {
        //       没有选中图片的时候 从父视图中移除_myview
        [_myView removeFromSuperview];
        _myView=nil;
        _view_SC.frame = CGRectMake(0, 180, Scro_view.width, 630);
        if(screen_Width ==iphone4_width)
        {
            Scro_view.contentSize = CGSizeMake(screen_Width-20, screen_Height);
        }
    }
}
//删除图片事件
- (void)longTap:(UITapGestureRecognizer *)tap2{
    
    UIView *im=[tap2 view];
    _isTuchImageValue=im.tag;
    //初始化AlertView
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"温馨提示"
                                                   message:@"删除您添加的图片吗?"
                                                  delegate:self
                                         cancelButtonTitle:@"确认"
                                         otherButtonTitles:@"取消",nil];
    alert.tag = 1;
    [alert show];
    
}
//根据被点击按钮的索引处理点击事件
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (alertView.tag == 1) {
        if (buttonIndex ==0) {
            if(_isTuchImageValue!=0){
                [_imgs removeObjectAtIndex:_isTuchImageValue-1];
                [self Add_SP_img:nil];
                
            }
            
        }
    }
}
-(void)Comit
{
    HUBClient *client = [HUBClient sharedClient];
    if(client.currentUser==nil){
        MYLOG(@"请先登录");
        return;
    }
    //    对键盘的隐藏
    //    [self yc];
    if(NETWORKEROR){
        
        
        [MBProgressHUD showError:@"当前无网络连接"];
        return;
    }
    if ([self.textView.text isEqualToString:@""]) {
        
        [MBProgressHUD showError:@"请输入你的建议或问题，以便我们及时进行处理"];
        return;
    }
    if([_name.text isEqualToString:@""])
    {
        
        
        [MBProgressHUD showError:@"昵称不能为空"];
        return;
    }
    if([_email.text isEqualToString:@""])
    {
        
        
        [MBProgressHUD showError:@"请输入你的邮箱以便我们对您反馈"];
        return;
    }
    if ([_phone.text isEqualToString:@""])
    {
        
        [MBProgressHUD showError:@"亲,请输入手机号"];
        return;
    }
    
    BOOL isOk =[LoginModel checkInputMobile:_phone.text];
    if (!isOk) {
        
        
        [MBProgressHUD showError:@"亲,手机号格式不正确"];
        return;
    }
    [MBProgressHUD showMessage:@"提交中" toView:self.view];
    _feedback = [[Feedback alloc] init];
    if(_imgs && _imgs.count>0){
        // upload images first
        if(_imgsToUpload){
            [_imgsToUpload removeAllObjects];
        }else{
            _imgsToUpload = [[NSMutableArray alloc] init];
        }
        [_imgsToUpload addObjectsFromArray:_imgs];
        [self uploadFiles];
        
        
    }else{
        [self saveFeedback];
    }
}


-(void)uploadFiles{
    if(_imgsToUpload.count==0){
        [self saveFeedback];
        return;
    }
    
    UIImage *image = [_imgsToUpload objectAtIndex:0];
    [_imgsToUpload removeObjectAtIndex:0];
    NSData *data = UIImageJPEGRepresentation(image, 0.5);
    
    
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    
    put.bucketName = @"huijuquanqiu";
    NSString *objectID =[[NSUUID UUID] UUIDString];
    put.objectKey = objectID;
    
    put.uploadingData = data; // 直接上传NSData
    
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
        MYLOG(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
    };
    
    OSSTask * putTask = [client putObject:put];
    
    [putTask continueWithBlock:^id(OSSTask *task) {
        if (!task.error) {
            MYLOG(@"upload object success!");
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            if(_feedback==nil){
                _feedback = [[Feedback alloc] init];
            }
            if(_feedback.imgArray==nil){
                _feedback.imgArray = [[NSMutableArray alloc] init];
            }
            
            [_feedback.imgArray addObject:objectID];
            [self uploadFiles];
            
        } else {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            MYLOG(@"upload object failed, error: %@" , task.error);
        }
        return nil;
    }];
    
}

-(void)saveFeedback{
    if(_feedback==nil){
        _feedback = [[Feedback alloc] init];
    }
    
    _feedback.name = _name.text;
    _feedback.email = _email.text;
    _feedback.tel = _phone.text;
    _feedback.other = _other.text;
    _feedback.feedback= self.textView.text;
    
    [_feedback saveObjectWithCompletion:^(Feedback *feedback, NSError *error) {
        if (error == nil) {
            MYLOG(@"saveFeedback is %@", feedback);
            [MBProgressHUD hideHUDForView:self.view animated:YES];

            [MBProgressHUD showSuccess:@"您的问题已提交,我们将会及时处理您的问题并反馈给您"];
            [self createViewClick];
            
        } else {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            // deal with error
            MYLOG(@"save book error= %@", error);
            
        }
    }];
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
    
    textField.layer.masksToBounds =YES;
    textField.layer.cornerRadius =4.0f;
    
    textField.placeholder=placeholder;
    
    textField.returnKeyType = UIReturnKeyDefault;
    return textField;
}

//影藏键盘
- (void)yc{
    [self.textView resignFirstResponder];
    [_name resignFirstResponder];
    [_email resignFirstResponder];
    [_phone resignFirstResponder];
    [_other resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, 0, screen_Width, screen_Height) ;
        
    }];
    Scro_view.frame = CGRectMake(10, 10, screen_Width-20, screen_Height);
}
//TEXT开始编辑
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [UIView animateWithDuration:0.3 animations:^{
        
        if (iphone4_width==screen_Width) {
            
            self.view.frame = CGRectMake(0, -230, screen_Width, screen_Height+230) ;
        }
        else
        {
            self.view.frame = CGRectMake(0, -200, screen_Width, screen_Height+200) ;
        }
        
    }];
    return YES;
}
#pragma mark - 实现textfield的代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, 0, screen_Width, screen_Height) ;
        
    }];
    Scro_view.frame = CGRectMake(10, 10, screen_Width-20, screen_Height);
    return TRUE;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    MYLOG(@"dad");
}
//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, 0, screen_Width, screen_Height) ;
        
    }];
    Scro_view.frame = CGRectMake(10, 10, screen_Width-20, screen_Height);
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
