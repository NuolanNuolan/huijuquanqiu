//
//  JDLTuikuanViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/17.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLTuikuanViewController.h"
#import "AJPickerTextField.h"

@interface JDLTuikuanViewController ()<UITextViewDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate,UINavigationControllerDelegate,UIPreviewActionItem,AJPickerTextFieldDelegate,UITextFieldDelegate>
{

    //商品ID
    NSInteger _SP_ID;
    //滚动视图
    UIScrollView  * Scro_view;
    //文本输入框
    AJPickerTextField * _textfild;
    //退款金额输入框
    UITextField *_text_price;
    //多行文本输入框
    UITextView * _textview;
    //photo按钮
    UIButton *_btn_image;
    //三个nsarray装选项
    NSArray *array_TK_type;
    NSArray *array_SH_type;
    NSArray *array_TK_why;
    //申请退款按钮
    UIButton *_btn_tuikuan;
    //图片数组
    NSMutableArray     *_imgs;
    UIView *_myView;
    NSUInteger _isTuchImageValue;
}

@end

@implementation JDLTuikuanViewController
//初始化方法传入店铺ID
- (id)initWith_SPid:(NSInteger)Sp_ID
{
    
    self = [super init];
    if (self) {
        _SP_ID =Sp_ID;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self Dismiss];
    [self CreateUI];
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];

    
}
#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:232/255.0f green:232/255.0f blue:232/255.0f alpha:1];
    self.title = @"申请退款";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}
-(void)CreateUI
{

    //
    Scro_view = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
    Scro_view.contentSize = CGSizeMake(screen_Width-20, screen_Height+10);
    //    Scro_view.pagingEnabled = YES;
    //    Scro_view.scrollEnabled = NO;
    Scro_view.backgroundColor = [UIColor clearColor];
    Scro_view.showsVerticalScrollIndicator = NO;
    [self.view addSubview:Scro_view];
    
    //给整个Scrollew添加单机事件
    UITapGestureRecognizer *dianji=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(yc)];
    [Scro_view addGestureRecognizer:dianji];
    
    NSArray *Arr_lab = @[@"退款类型*",@"收货类型*",@"退款原因*",@"退款金额*",@"退款说明"];
    NSArray *Arr_text_pl = @[@"  我要退款(无需退货)",@"  未收到货",@"  不想要了",@"  请输入退款金额",@"  请输入退款说明"];
    array_TK_type = @[@"选项一",@"选项二",@"选项三"];
    array_SH_type =@[@"选项一",@"选项二",@"选项三"];
    array_TK_why = @[@"选项一",@"选项二",@"选项三"];
    for (int i=0; i<=4; i++) {
        UILabel *lab_a = [[UILabel alloc]initWithFrame:CGRectMake(20, 17+i*77, 130, 13)];
        lab_a.text = Arr_lab[i];
        lab_a.font = [UIFont boldSystemFontOfSize:13.0f];
        lab_a.textColor = [UIColor blackColor];
        if (i<3) {
            _textfild = [[AJPickerTextField alloc]initWithFrame:CGRectMake(16, 37+i*77, Scro_view.bounds.size.width-32, 45)];
            _textfild.placeholder = Arr_text_pl[i];
            _textfild.font = [UIFont systemFontOfSize:13.0f];
            _textfild.clearButtonMode = UITextFieldViewModeWhileEditing;
            _textfild.backgroundColor = [UIColor whiteColor];
            _textfild.layer.masksToBounds =YES;
            _textfild.layer.cornerRadius = 2.0f;
            _textfild.tag = 1000+i;
            _textfild.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
            UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 30, 30)];
            UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 10, 15, 10)];
            image.image = [UIImage imageNamed:@"icon_right_arrow"];
            [view addSubview:image];
             _textfild.rightView=view;
            _textfild.rightViewMode = UITextFieldViewModeAlways;
        }
        if (i==0) {
            _textfild.selectionArray =array_TK_type;
            _textfild.privateDelegate =self;
        }else if (i==1)
        {
        
            _textfild.selectionArray =array_SH_type;
            _textfild.privateDelegate =self;
        }else if (i==2)
        {
        
            _textfild.selectionArray =array_TK_why;
            _textfild.privateDelegate =self;
        }
        
        
                
        
        [Scro_view addSubview:lab_a];
        [Scro_view addSubview:_textfild];
       
        
    }
    _textview = [[UITextView alloc] initWithFrame:CGRectMake(16, 345, Scro_view.width-32, 90)]; //初始化大小并自动释放
    //self.textView.textAlignment = NSTextAlignmentLeft; // 设置字体对其方式
    _textview.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];//设置textview里面的字体颜色
    _textview.font = [UIFont fontWithName:@"Arial" size:13.0];//设置字体名字和字体大小
    _textview.delegate = self;//设置它的委托方法
    _textview.backgroundColor = [UIColor whiteColor];//设置它的背景颜色
    _textview.returnKeyType = UIReturnKeyDefault;//返回键的类型
    _textview.keyboardType = UIKeyboardTypeDefault;//键盘类型
    _textview.scrollEnabled = YES;//是否可以拖动
    _textview.autoresizingMask = UIViewAutoresizingFlexibleHeight;//自适应高度
    _textview.layer.masksToBounds=YES;
    _textview.layer.cornerRadius=2.0f;
    _textview.delegate =self;
    [Scro_view addSubview:_textview];
    
    
    _text_price = [[UITextField alloc]initWithFrame:CGRectMake(16, 268, Scro_view.bounds.size.width-32, 45)];
    _text_price.placeholder =@"请输入退款金额";
    _text_price.font = [UIFont systemFontOfSize:13.0f];
    _text_price.clearButtonMode = UITextFieldViewModeWhileEditing;
    _text_price.backgroundColor = [UIColor whiteColor];
    _text_price.layer.masksToBounds =YES;
    _text_price.layer.cornerRadius = 2.0f;
    _text_price.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
    _text_price.delegate =self;
    [Scro_view addSubview:_text_price];
    
    _btn_image = [[UIButton alloc]initWithFrame:CGRectMake(Scro_view.width-46, 405, 30, 30)];
    [_btn_image setImage:[UIImage imageNamed:@"btn_uploadPic"] forState:UIControlStateNormal];
    [_btn_image addTarget:self action:@selector(btn_image) forControlEvents:UIControlEventTouchUpInside];
    [Scro_view addSubview:_btn_image];
    
    _btn_tuikuan = [[UIButton alloc]initWithFrame:CGRectMake(20, 465, screen_Width-40, 50)];
    _btn_tuikuan.backgroundColor = [UIColor redColor];
    [_btn_tuikuan setTintColor:[UIColor whiteColor]];

    [_btn_tuikuan setTitle:@"申请退款" forState:UIControlStateNormal];
    _btn_tuikuan.layer.masksToBounds =YES;
    _btn_tuikuan.layer.cornerRadius = 2.0f;
    [_btn_tuikuan addTarget:self action:@selector(Tuikuan) forControlEvents:UIControlEventTouchUpInside];
    [Scro_view addSubview:_btn_tuikuan];
    
}

-(void)createViewClick
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
//键盘收起
-(void)yc
{
    [_text_price resignFirstResponder];
    [_textview resignFirstResponder];
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, 0, screen_Width, screen_Height) ;
        
    }];
    
}

//退款按钮点击事件
-(void)Tuikuan
{

    
}
//实现弹出pichview协议方法
- (void)pickerTextField:(AJPickerTextField *)pickerTextField didSelectRow:(NSInteger)row
{
   
}
//选择图片
//添加图片
-(void)btn_image
{
    
    [Scro_view  resignFirstResponder];
    [_text_price resignFirstResponder];
    [_textview resignFirstResponder];
    UIActionSheet *menu = [[UIActionSheet alloc] initWithTitle:@"上传图像" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:nil otherButtonTitles:@"拍照", @"从相册上传", nil];
    menu.delegate=self;
    menu.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    [menu showInView:self.view];
    
}
#pragma mark - 代理
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //MYLOG(@"index:%zd",buttonIndex);
    //0->拍照，1->相册
    
    if (buttonIndex == 0) {
        [self snapImage];
    } else if (buttonIndex == 1) {
        [self localPhoto];
    }
}
//拍照
- (void) snapImage
{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        __block UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        ipc.delegate = self;
        ipc.allowsEditing = YES;
        ipc.navigationBar.barTintColor =[UIColor whiteColor];
        ipc.navigationBar.tintColor = [UIColor whiteColor];
        ipc.navigationBar.titleTextAttributes = @{UITextAttributeTextColor:[UIColor whiteColor]};
        [self presentViewController:ipc animated:YES completion:^{
            ipc = nil;
        }];
    } else {
        MYLOG(@"模拟器无法打开照相机");
    }
}
#define CommonThimeColor HEXCOLOR(0x11a0ee)
-(void)localPhoto
{
    __block UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    picker.delegate = self;
    //设置选择后的图片可被编辑
    picker.allowsEditing = YES;
    picker.navigationBar.barTintColor =[UIColor whiteColor];
    picker.navigationBar.tintColor = [UIColor blackColor];
    picker.navigationBar.titleTextAttributes = @{UITextAttributeTextColor:[UIColor blackColor]};
    [self presentViewController:picker animated:YES completion:^{
        picker = nil;
    }];
}
-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    //完成选择
    NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
    if ([type isEqualToString:@"public.image"]) {
        //关闭相册界面
        [picker dismissViewControllerAnimated:YES completion:^{
            [self Add_SP_img:[info objectForKey:UIImagePickerControllerOriginalImage]];
        }];
    }
    
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
        
        _btn_tuikuan.frame = CGRectMake(20, 585, screen_Width-40, 50);
        if(screen_Width ==iphone4_width)
        {
            
            Scro_view.contentSize = CGSizeMake(screen_Width, screen_Height+200);
        }
    }
    //    这个UIView 用来存放 选中的图片
    if(!_myView){
        
        _myView=[[UIView alloc]initWithFrame:CGRectMake(10,450,Scro_view.width-20, 110)];
        
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
        _btn_tuikuan.frame = CGRectMake(20, 465, screen_Width-40, 50);
        if(screen_Width ==iphone4_width)
        {
            Scro_view.contentSize = CGSizeMake(screen_Width, screen_Height);
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
//TEXT开始编辑
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if ([_imgs count]>0) {
//        if (screen_Width ==iphone4_width) {
//            Scro_view.frame =CGRectMake(0, 0, screen_Width, screen_Height+100);
//        }
        [UIView animateWithDuration:0.3 animations:^{
            
            self.view.frame = CGRectMake(0, -200, screen_Width, screen_Height+200) ;
            
        }];
        return YES;
        
    }
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, -200, screen_Width, screen_Height+200) ;
        
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
    Scro_view.frame = CGRectMake(0, 0, screen_Width, screen_Height);
    return TRUE;
}
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{

    if(screen_Width==iphone4_width)
    {
    
        [UIView animateWithDuration:0.3 animations:^{
            
            self.view.frame = CGRectMake(0, -250, screen_Width, screen_Height+250) ;
            
        }];
        return YES;
    }
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, -200, screen_Width, screen_Height+200) ;
        
    }];
    return YES;
    
}
//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    [UIView animateWithDuration:0.3 animations:^{
        
        self.view.frame = CGRectMake(0, 0, screen_Width, screen_Height) ;
        
    }];
    Scro_view.frame = CGRectMake(0, 0, screen_Width, screen_Height);
}
@end
