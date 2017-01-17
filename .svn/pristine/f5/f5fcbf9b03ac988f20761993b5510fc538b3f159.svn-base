//
//  JDLMeViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLMeViewController.h"
#import "JDLSearchViewController.h"
#import "JDLLoggingViewController.h"
#import "LoginModel.h"
#import "JDLSheZIViewController.h"
#import "JDLMeOrderViewController.h"
#import "JDLFeedbackViewController.h"
#import "AddrListViewController.h"
#import "JDLCollectionViewController.h"
#import "WXApi.h"
#import "JDLAboutUsViewController.h"

@interface JDLMeViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_detaiTabView;
    NSArray *dataArr;
    //    NSArray *dataArr1;
    NSArray *dataArr2;
    NSArray *dataArr3;
    NSArray *Imagearray;
    NSArray *Imagearray1;
    UIImageView *imageView;
    UILabel *nameLab;
    UILabel *iphoneLab;
    //头像
    UIImageView *_image;
    //昵称
    NSString *_Name;
    //手机号码
    NSString *_Phone;
    //背景
    UIImageView * bgimage;
    //未登录lable
    UILabel *login_relal;
    //用户ID;
    NSString *_ID;
    //头像url
    NSString*imageData;
}
@end

@implementation JDLMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //加载数据
    [self JiaZaiShuJu];

    UIImageView *bg_ME = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
    [bg_ME setImage:[UIImage imageNamed:@"Login_BG"]];
    [self.view addSubview:bg_ME];
    self.title = @"我的全球";
    
    [self createTabView];
    self.automaticallyAdjustsScrollViewInsets =NO;
    //    [_detailTabView  registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellName"];
}
//刷新操作
-(void)viewDidAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden =NO;
    if([LoginModel isLogin]){
        
        login_relal.hidden =YES;
        imageView.hidden =NO;
        nameLab.hidden =NO;
        
        imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"DATA_IMAGE"];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageData]];
        
        //        UIImage *sandBoxImage=[SZKImagePickerVC loadImageFromSandbox:@"image"];
        //        imageView.image= sandBoxImage;
        //        if(imageData ==nil)
        //        {
        //            if (NETWORKEROR) {
        //                [MBProgressHUD showError:@"当前无网络连接"];
        //                return;
        //            }
        //            NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL_image]];
        //            imageView.image = [UIImage imageWithData:data];
        //            //存入默认头像
        //            [[NSUserDefaults standardUserDefaults]setObject:data forKey:@"DATA_IMAGE"];
        //        }
        _Name = [[NSUserDefaults standardUserDefaults]objectForKey:@"USERNAME"];
        nameLab.text = _Name;
        _Phone = [[NSUserDefaults standardUserDefaults]objectForKey:@"PHONE"];
        iphoneLab.text = _Phone;
        
        [_detaiTabView reloadData];
        
        
    }else
    {
        
        login_relal.hidden =NO;
        imageView.hidden =YES;
        nameLab.hidden =YES;
        
    }
    
    
}


-(void)createTabView{
    
    _detaiTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, screen_Height-107)];
    _detaiTabView.delegate = self;
    _detaiTabView.dataSource = self;
    //透出背景,设置表格无颜色
    _detaiTabView.backgroundColor = [UIColor clearColor];
    _detaiTabView.showsVerticalScrollIndicator =NO;
    //    _detaiTabView.bounces = NO;
    //    _detaiTabView.showsHorizontalScrollIndicator = NO;
    //    _detaiTabView.separatorStyle=UITableViewCellSeparatorStyleSingleLine;//分割线
    dataArr = @[@"我的收藏"];
    //    dataArr1 = @[@"买手申请"];
    dataArr2 = @[@"地址管理",@"意见反馈",@"客服电话"];
    dataArr3 = @[@"关于我们"];
    Imagearray=@[@"0",@"1",@"2"];
    Imagearray1 =@[@"Wode",@"icon_myfavorite"];
    [self.view addSubview:_detaiTabView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 4;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return 1;
    }else if (section == 1){
        
        return dataArr.count;
    }
    else if (section == 2){
        
        return dataArr2.count;
    }else{
        
        return dataArr3.count;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if(section == 0 )
    {
        
        return 13;
    }
    
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        
        tabViewCellhigh(150 ,150 ,150);
        
        //          tabViewCellhigh(40 ,60 ,50);
        
    }
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section ==0) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userifo"];
        bgimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, 150)];
        bgimage.image = [UIImage imageNamed:@"BG"];
        [cell.contentView addSubview:bgimage];
        login_relal = [[UILabel alloc]initWithFrame:CGRectMake(bgimage.center.x-75, bgimage.center.y-10, 150, 20)];
        login_relal.textColor = [UIColor whiteColor];
        login_relal.font = [UIFont boldSystemFontOfSize:15.0f];
        login_relal.text=@"登录 / 注册";
        login_relal.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:login_relal];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 45, 60, 60)];
        imageView.layer.cornerRadius=30;
        imageView.layer.masksToBounds = YES;
        imageView.backgroundColor=[UIColor whiteColor];
        [imageView sd_setImageWithURL:[NSURL URLWithString:imageData]];
        [cell.contentView addSubview:imageView];
        
        nameLab = [[UILabel alloc]initWithFrame:CGRectMake(90, 68, 200, 20)];
        nameLab.text = _Name;
        nameLab.textColor = [UIColor whiteColor];
        nameLab.font = [UIFont boldSystemFontOfSize:15.0f];
        [cell.contentView addSubview:nameLab];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if(![LoginModel isLogin]){
            
            imageView.hidden =YES;
            nameLab.hidden =YES;
        }
        else
        {
            
            login_relal.hidden=YES;
            
        }
        
    }
    else if (indexPath.section == 1){
        cell.imageView.image = [UIImage imageNamed:[Imagearray1 objectAtIndex:indexPath.row]];
        cell.textLabel.text = [dataArr objectAtIndex:indexPath.row];
        UIFont *newFont = [UIFont fontWithName:@"Arial" size:14.0];
        //创建完字体格式之后就告诉cell
        cell.textLabel.font = newFont;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    else if (indexPath.section == 2){
        
        cell.imageView.image = [UIImage imageNamed:[Imagearray objectAtIndex:indexPath.row]];
        cell.textLabel.text = [dataArr2 objectAtIndex:indexPath.row];
        
        UIFont *newFont = [UIFont fontWithName:@"Arial" size:14.0];
        //创建完字体格式之后就告诉cell
        cell.textLabel.font = newFont;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        //隐藏系统的分隔线
        //tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    else if (indexPath.section == 3){
        
        cell.imageView.image = [UIImage imageNamed:@"About"];
        cell.textLabel.text = [dataArr3 objectAtIndex:indexPath.row];
        UIFont *newFont = [UIFont fontWithName:@"Arial" size:14.0];
        //创建完字体格式之后就告诉cell
        cell.textLabel.font = newFont;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        if  (![LoginModel isLogin]) {
            JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
            //	[self.tabBarController.tabBar setHidden:YES];
            [self.navigationController pushViewController:logVc animated:YES];
        }
        else
        {
            
            JDLSheZIViewController *MeShezi = [[JDLSheZIViewController alloc]init];
            //	[self.tabBarController.tabBar setHidden:YES];
            [self.navigationController pushViewController:MeShezi animated:YES];
            
        }
        
    }
    else if (indexPath.section == 1){
        //        if (![LoginModel isLogin]) {
        //            JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
        //            //	[self.tabBarController.tabBar setHidden:YES];
        //            [self.navigationController pushViewController:logVc animated:YES];
        //        }
        //        MYLOG(@"我的订单");
        if (indexPath.row==1) {
            
            
            if (![LoginModel isLogin]) {
                
                JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
                 //	[self.tabBarController.tabBar setHidden:YES];
                [self.navigationController pushViewController:logVc animated:YES];
            }
            else{
            
                JDLCollectionViewController *collect = [[JDLCollectionViewController alloc]init];
                //	[self.tabBarController.tabBar setHidden:YES];
                [self.navigationController pushViewController:collect animated:YES];
            }
            
            
        }
        else
        {
        
            if (![LoginModel isLogin]) {
                
                JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
                 //	[self.tabBarController.tabBar setHidden:YES];
                [self.navigationController pushViewController:logVc animated:YES];
            }
            else
            {
            
//                JDLMeOrderViewController *Order = [[JDLMeOrderViewController alloc]init];
//                //	[self.tabBarController.tabBar setHidden:YES];
//                [self.navigationController pushViewController:Order animated:YES];
                JDLCollectionViewController *collect = [[JDLCollectionViewController alloc]init];
                //	[self.tabBarController.tabBar setHidden:YES];
                [self.navigationController pushViewController:collect animated:YES];
                
            }
            
        }
       
        
    }
    else if (indexPath.section == 3)
    {
        MYLOG(@"关于我们");
        JDLAboutUsViewController *aboutus = [[JDLAboutUsViewController alloc]init];
        
        [self.navigationController pushViewController:aboutus animated:YES];
    }
    else if (indexPath.row == 0){
        
        //        if (![LoginModel isLogin]) {
        //            JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
        //            //	[self.tabBarController.tabBar setHidden:YES];
        //            [self.navigationController pushViewController:logVc animated:YES];
        //        }
        if (![LoginModel isLogin]) {
            
            JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
             //	[self.tabBarController.tabBar setHidden:YES];
            [self.navigationController pushViewController:logVc animated:YES];
        }
        else
        {
        
            //将我们的storyBoard实例化，“Main”为StoryBoard的名称
            UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            //将第二个控制器实例化，"SecondViewController"为我们设置的控制器的ID
            AddrListViewController *secondViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"Addlist"];
            	[self.tabBarController.tabBar setHidden:YES];
            //跳转事件
            [self.navigationController pushViewController:secondViewController animated:YES];
        }
        
        
    }
    else if (indexPath.row == 1){
        //        if (![LoginModel isLogin]) {
        //            JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
        //            //	[self.tabBarController.tabBar setHidden:YES];
        //            [self.navigationController pushViewController:logVc animated:YES];
        //        }
        if (![LoginModel isLogin]) {
            
            JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
             //	[self.tabBarController.tabBar setHidden:YES];
            [self.navigationController pushViewController:logVc animated:YES];
        }
        else
        {
            JDLFeedbackViewController *Feed = [[JDLFeedbackViewController alloc]init];
            //	[self.tabBarController.tabBar setHidden:YES];
            [self.navigationController pushViewController:Feed animated:YES];
        }
        
    }
    else if (indexPath.row == 2){
        
        NSString *phoneNumber = @"057186221580";
        NSString *cleanedString =[[phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789-+()"] invertedSet]] componentsJoinedByString:@""];
        NSString *escapedPhoneNumber = [cleanedString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *telURL = [NSURL URLWithString:[NSString stringWithFormat:@"tel://%@", escapedPhoneNumber]];
        UIWebView *mCallWebview = [[UIWebView alloc] init] ;
        [self.view addSubview:mCallWebview];
        [mCallWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
    }
}
#pragma mark  加载数据
-(void)JiaZaiShuJu
{
    if ([LoginModel isLogin]) {
        imageData = [[NSUserDefaults standardUserDefaults]objectForKey:@"DATA_IMAGE"];
        //        UIImage *sandBoxImage=[SZKImagePickerVC loadImageFromSandbox:@"image"];
//        _image= sandBoxImage;
        _Name = [[NSUserDefaults standardUserDefaults]objectForKey:@"USERNAME"];
        _Phone = [[NSUserDefaults standardUserDefaults]objectForKey:@"PHONE"];
    }
    
    
    
}

@end
