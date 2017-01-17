//
//  JDLSheZIViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/12.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLSheZIViewController.h"
#import "LoginModel.h"

@interface JDLSheZIViewController ()<UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate,UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,SZKImagePickerVCDelegate>
{

    OSSClient *client_oss;
    //背景图片view
    UIImageView *bg_SheZi;
    //背景
    UIImageView *_imageview_BG;
    UIImage *_image_BG;
    //头像
    UIButton *_head;
    UIImage *_image_TX;
    //圆弧
    UIImageView *_imageview_YuanHu;
    //tableview
    UITableView * _tableview;
    //ArrayData
    NSArray *_arrayData;
    //imagedataarray
    NSArray *_Imagearray;
    //name
    NSString *_Name;
    //Phone
    NSString *_Phone;
    UIAlertView *_alertview;
    UILabel *_lab_name;
    //头想url;
    NSString*imageData;
    UILabel *namelab;
    //当前所在位置
    NSString *address_nsd;
}

@end

@implementation JDLSheZIViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self DangqianWeizi];
    //加载数据
    [self loadSHUJU];
    [self headimage_upload];
    //界面布局设置
    [self Createimage_Shezhi];
    // 返回按钮
    [self Dismiss];
//    dismiss_w;
    //创建Tableview
    [self CreateTableview];
    
}
#pragma mark 加载数据
-(void)loadSHUJU
{

    //从沙盒中读取照片  imageName应当与保存时的name相同
    imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"DATA_IMAGE"];
    _Name = [[NSUserDefaults standardUserDefaults]objectForKey:@"USERNAME"];

    if (_lab_name) {
        CGSize size_name_top= [LoginModel viewHeight:(CGSize)CGSizeMake(500, 50) :(float)15.0f :(NSString*)_Name] ;
        _lab_name.frame =CGRectMake((screen_Width-size_name_top.width)/2, 106, size_name_top.width, 20);
         _lab_name.text = _Name;
    }
    _Phone = [[NSUserDefaults standardUserDefaults]objectForKey:@"PHONE"];
    


}
-(void)loadSHUJU_frame
{

    _Name = [[NSUserDefaults standardUserDefaults]objectForKey:@"USERNAME"];
    CGSize size_name= [LoginModel viewHeight:(CGSize)CGSizeMake(200, 50) :(float)13.0f :(NSString*)_Name] ;
    
    namelab.frame =CGRectMake(screen_Width-size_name.width-40, (50-size_name.height)/2, size_name.width, size_name.height);
    namelab.text =_Name;
}
-(void)Dismiss
{
    
    ////左边返回
    UIButton  *back_btn = [[UIButton alloc]initWithFrame:CGRectMake(25, 31, 30, 30)];
    [back_btn setBackgroundImage:[UIImage imageNamed:@"Back"] forState:UIControlStateNormal];
    [back_btn addTarget:self action:@selector(createViewClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back_btn];
}

-(void)createViewClick{

    [self.navigationController popViewControllerAnimated:NO];
}
//- (UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//    
//}
-(void)Createimage_Shezhi
{
    //整体布局设置
    self.navigationController.navigationBar.hidden =YES;
    bg_SheZi = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
    [bg_SheZi setImage:[UIImage imageNamed:@"Login_BG"]];
    [self.view addSubview:bg_SheZi];
    //背景图片设置
    _imageview_BG = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, 215)];
    _imageview_BG.image = [UIImage imageNamed:@"BG_shezi"];
    [self.view addSubview:_imageview_BG];
    //头像
    _head=[[UIButton alloc]initWithFrame:CGRectMake(screen_Width*0.4187, 39, 60, 60)];
    [_head setImage:[UIImage imageNamed:@"head"] forState:UIControlStateNormal];
    _head.layer.cornerRadius=30;
    _head.layer.masksToBounds = YES;
    [_head sd_setBackgroundImageWithURL:[NSURL URLWithString:imageData] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"bg_myworld_headportrait"]];
    
    _head.backgroundColor=[UIColor whiteColor];
    [_head addTarget:self action:@selector(changeHeadView1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_head];
    //名字
    CGSize size_name_top= [LoginModel viewHeight:(CGSize)CGSizeMake(500, 50) :(float)15.0f :(NSString*)_Name] ;
    _lab_name = [[UILabel alloc]initWithFrame:CGRectMake((screen_Width-size_name_top.width)/2, 106, size_name_top.width, 20)];
    _lab_name.text = _Name;
    _lab_name.textColor = [UIColor whiteColor];
    _lab_name.textAlignment = NSTextAlignmentCenter;
    _lab_name.font = [UIFont boldSystemFontOfSize:15.0f];
    [self.view addSubview:_lab_name];
    //圆弧
    _imageview_YuanHu = [[UIImageView alloc]initWithFrame:CGRectMake(0, 188, screen_Width, 27)];
    _imageview_YuanHu.image = [UIImage imageNamed:@"YuanHu"];
    [self.view addSubview:_imageview_YuanHu];
    //获取通知中心单例对象
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(dangqianweizi_notification:) name:@"234" object:nil];
}
-(void)dangqianweizi_notification:(NSNotification *)sender
{
    NSDictionary *address = sender.userInfo;
    //判断直辖市
    if([[address objectForKey:@"State"] isEqualToString:[address objectForKey:@"City"]])
    {
        address_nsd = [address objectForKey:@"City"];
    }
    else
    {
    
        address_nsd = [[address objectForKey:@"State"]stringByAppendingString:[address objectForKey:@"City"]];
        
    }
    [_tableview reloadData];
    
   
}
#pragma mark 创建表格
-(void)CreateTableview
{

    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 218, screen_Width, screen_Height-218)style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //取消滑动条
    _tableview.showsVerticalScrollIndicator =NO;
    //透出背景,设置表格无颜色
    _tableview.backgroundColor = [UIColor colorWithRed:242/255.0 green:242/255.0 blue:242/255.0 alpha:1];
    _arrayData = @[@"昵称",@"手机号",@"所在地",@"清理缓存"];
    _Imagearray=@[@"Shezi_1",@"Shezi_7",@"Shezi_9",@"icon_CacheCleaner"];
    [self.view addSubview:_tableview];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _arrayData.count;
}
//加载表格
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
//    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.imageView.image = [UIImage imageNamed:[_Imagearray objectAtIndex:indexPath.row]];
        cell.textLabel.text = [_arrayData objectAtIndex:indexPath.row];
        UIFont *newFont = [UIFont fontWithName:@"Arial" size:14.0];
        cell.textLabel.font = newFont;
        cell.backgroundColor = [UIColor clearColor];
//        
//    }
    if (indexPath.row==0) {
        CGSize size_name= [LoginModel viewHeight:(CGSize)CGSizeMake(200, 50) :(float)13.0f :(NSString*)_Name] ;
        namelab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width-size_name.width-40, (50-size_name.height)/2, size_name.width, size_name.height)];
        namelab.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        namelab.font = [UIFont fontWithName:@"Arial" size:13];
        namelab.text = _Name;
        [cell.contentView addSubview:namelab];
    }else if(indexPath.row==1)
    {
        CGSize size_name= [LoginModel viewHeight:(CGSize)CGSizeMake(200, 50) :(float)13.0f :(NSString*)_Phone] ;
        UILabel *phonelab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width-size_name.width-40, (50-size_name.height)/2, size_name.width, size_name.height)];
        phonelab.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
        phonelab.font = [UIFont fontWithName:@"Arial" size:13];
        phonelab.text = _Phone;
        [cell.contentView addSubview:phonelab];
        
    }
    else if (indexPath.row==2)
    {
        if (address_nsd) {
            
            CGSize size_name= [LoginModel viewHeight:(CGSize)CGSizeMake(200, 50) :(float)13.0f :(NSString*)address_nsd] ;
            UILabel *addlab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width-size_name.width-40, (50-size_name.height)/2, size_name.width, size_name.height)];
            addlab.textColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1];
            addlab.font = [UIFont fontWithName:@"Arial" size:13];
            addlab.text = address_nsd;
            [cell.contentView addSubview:addlab];
        }
        
    }

//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    //隐藏系统的分隔线
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIView *v = [[UIView alloc]init];
    v.frame = CGRectMake(20, 0, SCREEN_WIDTH-40, 1);
    v.backgroundColor = [UIColor whiteColor];
    [cell addSubview:v];

    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
    
}
//尾
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 130, screen_Width, 130)];
    view.backgroundColor = [UIColor clearColor];
    
    UIButton *view_image = [[UIButton alloc]initWithFrame:CGRectMake(20,50 , screen_Width-40, 50)];
        view_image.layer.borderWidth = 1.0f;
    
    [view_image.layer setBorderColor:[UIColor redColor].CGColor];
    [view_image setTitle:@"退出登录" forState:UIControlStateNormal];
    [view_image setTitleColor:[UIColor redColor]forState:UIControlStateNormal];
    [view_image addTarget:self action:@selector(tapClick_image) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:view_image];
    

    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

        tabViewCellhigh(50 ,50 ,50);

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row==0) {
        _alertview = [[UIAlertView alloc]initWithTitle:@"修改昵称" message:@"键入您的新昵称" delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
        _alertview.alertViewStyle = UIAlertViewStylePlainTextInput;
        _alertview.tag =1;
        UITextField * txt = [[UITextField alloc] init];
        txt.backgroundColor = [UIColor whiteColor];
        txt.frame = CGRectMake(_alertview.center.x+65,_alertview.center.y+48, 150,23);
        [_alertview addSubview:txt];
        
        [_alertview show];
    }
    else if(indexPath.row==1)
    {
        MYLOG(@"手机号");
    }
    else if(indexPath.row==2)
    {
        MYLOG(@"所在地");
       
    }
    else if (indexPath.row == 3){
        [self clearCache];
        
    }
}



-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag==1) {
        if (buttonIndex==1) {
            
            UITextField *tf = [alertView textFieldAtIndex:0];
            if (tf.text.length!=0) {
                HUBClient *client = [HUBClient sharedClient];
                HUBUser *user = [client currentUser];
                [user.visibleByRegisteredUsers setObject:[NSString stringWithFormat:@"%@",tf.text] forKey:@"nick"];
                [user updateWithCompletion:^(HUBUser *user, NSError *error) {
                    if (error == nil) {
                        [[NSUserDefaults standardUserDefaults]setObject:tf.text forKey:@"USERNAME"];
                        [self loadSHUJU];
                        [self loadSHUJU_frame];
                    }
                    else {
                        [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                    }
                }];
            }
            else
            {
                
                [MBProgressHUD showError:@"昵称不能为空"];
            }
        }

    }
    else if (alertView.tag == 2000){
        if (buttonIndex == 1) {
            //清空缓存
            NSString *cachPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
            NSArray *files = [[NSFileManager defaultManager] subpathsAtPath:cachPath];
            
            [MBProgressHUD showMessage:@"正在清理" toView:self.view];
            //    NSLog(@"文件数量%lu",(unsigned long)files.count);
            [[SDImageCache sharedImageCache]clearMemory];
            [[SDImageCache sharedImageCache]cleanDisk];
            for(NSString *temp in files)
            {
                NSError *error;
                NSString *path = [cachPath stringByAppendingPathComponent:temp];
                if ([[NSFileManager defaultManager] fileExistsAtPath:path])
                {
                    [[NSFileManager defaultManager] removeItemAtPath:path error:&error];
                    
                }
            }
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                // 提醒
                [MBProgressHUD showSuccess:@"清除完成"];
            });
        }
    }
    else{
    
        
    }
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

        NSData *data = UIImageJPEGRepresentation(image, 0.5);
        
        OSSPutObjectRequest * put = [OSSPutObjectRequest new];
        
        put.bucketName = @"huijuquanqiu";
        NSString *objectID =[[NSUUID UUID] UUIDString ];
        put.objectKey = [objectID stringByAppendingString:@".png"];
        
        put.uploadingData = data; // 直接上传NSData
        
        put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
        };
        
        OSSTask * putTask = [client_oss putObject:put];
    [MBProgressHUD showMessage:@"上传中" toView:self.view];
    [putTask continueWithBlock:^id(OSSTask *task) {
        if (!task.error) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            MYLOG(@"upload object success!");
            NSString *_head_url = @"http://huijuquanqiu.oss-cn-hangzhou.aliyuncs.com/";
            HUBClient *client = [HUBClient sharedClient];
            HUBUser *user = [client currentUser];
            [user.visibleByRegisteredUsers setObject:[_head_url stringByAppendingString:put.objectKey] forKey:@"head_url"];
            [user updateWithCompletion:^(HUBUser *user, NSError *error) {
                if (error == nil) {
                    MYLOG(@"user is %@", user);
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [_head setBackgroundImage:image forState:UIControlStateNormal];
//                    [SZKImagePickerVC saveImageToSandbox:image andImageNage:@"image" andResultBlock:^(BOOL success) {
//                        
                        [[NSUserDefaults standardUserDefaults]setObject:[_head_url stringByAppendingString:put.objectKey] forKey:@"DATA_IMAGE"];
//                    }];
                    
                }
                else {
                    
                     [MBProgressHUD hideHUDForView:self.view animated:YES];
                     [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                }
            }];
            
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
            MYLOG(@"upload object failed, error: %@" , task.error);
        }
        return nil;
    }];
    

        
        
        
    
    
}



-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 130;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 1;
}
- (void)tapClick_image{
    
    
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"ISLOGIN"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"head_url"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"nick"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"PWD"];
    [[NSUserDefaults standardUserDefaults]removeObjectForKey:@"PHONE"];
    HUBClient *client = [HUBClient sharedClient];
    if(client.currentUser){
        [HUBUser logoutWithCompletion:^(BOOL success, NSError *error) {
            
            if (success) {
                MYLOG(@"logout");
            } else {
                // error logging out
                MYLOG(@"logout error=%@",error);
                
            }
        }];
    }
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.navigationBar.hidden =NO;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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



-(void)clearCache
{
    
    UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"你要清理缓存吗" message:[NSString stringWithFormat:@""] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    alert.tag = 2000;
    [alert show];
    
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
