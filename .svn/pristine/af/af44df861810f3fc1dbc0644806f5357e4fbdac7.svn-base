//
//  JDLRedViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/25.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLRedViewController.h"
#import "JDLRedOneTableViewCell.h"
#import "JDLRedTwoTableViewCell.h"
#import "JDLRedThereTableViewCell.h"
#import "JDLRedFourTableViewCell.h"
#import "JDLRedFiveTableViewCell.h"

@interface JDLRedViewController ()<UITableViewDelegate,UITableViewDataSource,Red_oneTableviewDelegate,Red_twoTableviewDelegate,Red_thereTableviewDelegate,UITextFieldDelegate,UIScrollViewDelegate>
{

    //背景图片
    UIImageView * _bgimageview;
    //表格
    UITableView *_tableview;
    //赞按钮
    UIButton *_zan;
    //评论和分享弹出键盘按钮
    UIButton *_pinglunAnd_share;
    //用户头像圆环
    UIImageView *Tx_imageview;
    //用户头像
    UIButton * Tx_btn;
    //评论textfeild
    UITextField *_pinglu_Text;
    //评论view
    UIView * view_pl;
    //键盘高度
    int JP_height;
    //键盘弹起的时候创建一个透明的view
    UIView * _view_JianPan_tanqi;
    
}

@end

@implementation JDLRedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Dismiss];
//    dismiss_w;
    //创建表格
    [self Createtableview];
    //键盘
    [self jianpan_tool];
       // Do any additional setup after loading the view.
}

-(void)Dismiss{
    self.title = @"红人圈";
    self.navigationController.navigationBar.barTintColor =[UIColor colorWithRed:255/255.0f green:153/255.0f blue:146/255.0f alpha:1];
    [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.view.backgroundColor =[UIColor colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectMake(0, 0, 47, 22);
    [leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_red_return"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"nav_red_return"] forState:UIControlStateHighlighted];
    [leftBtn addTarget:self action:@selector(createViewClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
    self.navigationItem.leftBarButtonItem = leftItem;
}
-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:247/255.0f green:247/255.0f blue:247/255.0f alpha:1];
    [self.navigationController.navigationBar  setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor blackColor]}];

    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)Createtableview
{
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //透出背景,设置表格无颜色
    _tableview.backgroundColor = [UIColor clearColor];
    _tableview.showsVerticalScrollIndicator =NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    
}

#pragma mark 实现协议方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    MYLOG(@" 表格点击事件");
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* One = @"JDLRedOneTableViewCell";
    static NSString* Two = @"JDLRedTwoTableViewCell";
    static NSString* There = @"JDLRedThereTableViewCell";
    static NSString* Four = @"JDLRedFourTableViewCell";
    static NSString* Five = @"JDLRedFiveTableViewCell";
    static NSString *identifer=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
    if (indexPath.section ==0) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userifo"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, 223)];
        view.backgroundColor = [UIColor  colorWithRed:245/255.0f green:245/255.0f blue:245/255.0f alpha:1];
        _bgimageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, 180)];
        _bgimageview.image = [UIImage imageNamed:@"pic_bg.png"];
        
        Tx_imageview = [[UIImageView alloc]initWithFrame:CGRectMake(screen_Width-40-65, 147, 65, 65)];
        Tx_imageview.image = [UIImage imageNamed:@"pic_annulus"];
        
        Tx_btn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 60, 60)];
        [Tx_btn setImage:[UIImage imageNamed:@"pic_HeadPortrait"] forState:UIControlStateNormal];
//        [Tx_btn addTarget:self action:@selector(My_Tx_Click) forControlEvents:UIControlEventTouchUpInside];
        
        [view addSubview:_bgimageview];
        [view addSubview:Tx_imageview];
        [Tx_imageview addSubview:Tx_btn];
        [cell.contentView addSubview:view];
    }
    else
    {
        if (indexPath.row == 0) {
            cell = [tableView dequeueReusableCellWithIdentifier:One];
            if (!cell) {
                UINib *nib = [UINib nibWithNibName:One bundle:nil];
                [tableView registerNib:nib forCellReuseIdentifier:One];
                cell = [tableView dequeueReusableCellWithIdentifier:One];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            UIButton* TX_btn = [cell viewWithTag:1];
//            [TX_btn setImage:[UIImage imageNamed:@"pic_HeadPortrait"] forState:UIControlStateNormal];
            TX_btn.layer.masksToBounds =YES;
            TX_btn.layer.cornerRadius = 22.0f;
            UILabel *Name_lab = [cell viewWithTag:2];
            Name_lab.text = @"小李莉莉周";
            
        }else if(indexPath.row==1){
            cell = [tableView dequeueReusableCellWithIdentifier:Two];
            UINib *nib = [UINib nibWithNibName:Two bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:Two];
            cell = [tableView dequeueReusableCellWithIdentifier:Two];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            
        }else if(indexPath.row==2){
            cell = [tableView dequeueReusableCellWithIdentifier:There];
            UINib *nib = [UINib nibWithNibName:There bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:There];
            cell = [tableView dequeueReusableCellWithIdentifier:There];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }else if(indexPath.row==3){
            cell = [tableView dequeueReusableCellWithIdentifier:Four];
            UINib *nib = [UINib nibWithNibName:Four bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:Four];
            cell = [tableView dequeueReusableCellWithIdentifier:Four];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        else if(indexPath.row==4){
            cell = [tableView dequeueReusableCellWithIdentifier:Five];
            UINib *nib = [UINib nibWithNibName:Five bundle:nil];
            [tableView registerNib:nib forCellReuseIdentifier:Five];
            cell = [tableView dequeueReusableCellWithIdentifier:Five];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
    }
    return cell;
    
}
//分组count
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(section==0)
    {
    
        return 1;
    }
   
    return 5;
}
////自己头像点击事件
//-(void)My_Tx_Click
//{
//
//    MYLOG(@"自己头像点击事件");
//}
//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        tabViewCellhigh( 223,223,223);
    }
    if (indexPath.row==0) {
        
        return 60;
    }else if (indexPath.row==1)
    {
    
        return 270;
    }else if (indexPath.row==2)
    {
        
        return 50;
    }else if (indexPath.row==3)
    {
        
        return 62;
    }else if (indexPath.row==4)
    {
        
        return 50;
    }
    
    return 60;
}
//尾
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section==0) {
        return 0.1;
    }
    return 52;
}
//头
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.1;
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    if (section==0) {
        return nil;
    }
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, 45)];
    view.backgroundColor = [UIColor clearColor];
    
    UIView * view_view = [[UIView alloc]initWithFrame:CGRectMake(7, 0, screen_Width-14, 45)];
    view_view.backgroundColor = [UIColor whiteColor];
    [view addSubview:view_view];
    
    _zan = [[UIButton alloc]initWithFrame:CGRectMake(13, 10, 40, 25)];
    [_zan setImage:[UIImage imageNamed:@"btn_RedCircle_praise"] forState:UIControlStateNormal];
    [_zan addTarget:self action:@selector(zan_click) forControlEvents:UIControlEventTouchUpInside];
    //接入后台数据后将根据传入的Tag做判断
    _zan.tag = 0;
    [view_view addSubview:_zan];
    
     NSArray *_DP_array = @[@"btn_RedCircle_comment",@"btn_RedCircle_share"];
     CGFloat with = 31+20;
    for (int i =0 ; i<[_DP_array count]; i++) {
        _pinglunAnd_share = [[UIButton alloc]init];
        _pinglunAnd_share.frame = CGRectMake(screen_Width-98+i*with, 10, 25, 25);
        [_pinglunAnd_share setImage:[UIImage imageNamed:_DP_array[i]] forState:UIControlStateNormal];
        [_pinglunAnd_share addTarget:self action:@selector(btn_click_all:) forControlEvents:UIControlEventTouchUpInside];
        _pinglunAnd_share.tag =300+i;
        [view_view addSubview:_pinglunAnd_share];
    }
    
    return view;
}
//赞点击事件
-(void)zan_click
{

    
    if(_zan.tag==0){
        [_zan setImage:[UIImage imageNamed:@"btn_RedCircle_praise_pre"] forState:UIControlStateNormal];
        _zan.tag=1;
    }
    else
    {
        [_zan setImage:[UIImage imageNamed:@"btn_RedCircle_praise"] forState:UIControlStateNormal];
        _zan.tag=0;
        
    }
    
}
-(void)btn_click_all:(UIButton *)btn
{
    
    if(btn.tag==300){
        
        [_pinglu_Text becomeFirstResponder];
        [UIView animateWithDuration:0.3f animations:^{
            
            view_pl.frame=CGRectMake(0,screen_Height-JP_height-45, screen_Width, 50);
        }];
        view_pl.hidden=NO;
        _view_JianPan_tanqi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height-JP_height-45)];
        _view_JianPan_tanqi.backgroundColor = [UIColor clearColor];
        _view_JianPan_tanqi.hidden=NO;
        [self.view addSubview:_view_JianPan_tanqi];

        
    }else if (btn.tag==301)
    {
        MYLOG(@"分享");
    }
}
-(void)Red_One:(NSInteger)index
{

    MYLOG(@"点击事件---------%ld",(long)index);
}
-(void)Red_Two:(NSInteger)index
{
    
 MYLOG(@"点击事件---------%ld",(long)index);
    
}
-(void)Red_There:(NSInteger)index
{

     MYLOG(@"点击事件---------%ld",(long)index);
}
//键盘
- (void)jianpan_tool{
    
    //黑底
    view_pl= [[UIView alloc]initWithFrame:CGRectMake(0, screen_Height, 0, 0)];
    view_pl.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:view_pl];
    
    //文本匡
    _pinglu_Text=[[UITextField alloc]initWithFrame:CGRectMake(20, 10, screen_Width-85, 30)];
    _pinglu_Text.borderStyle=UITextBorderStyleRoundedRect;
    _pinglu_Text.delegate=self;
    [view_pl addSubview:_pinglu_Text];
    
    UIButton *button_fb=[UIButton buttonWithType:UIButtonTypeRoundedRect];
    button_fb.frame=CGRectMake(screen_Width-60, 13, 45, 25);
    button_fb.layer.cornerRadius=5;
    button_fb.layer.masksToBounds=YES;
    button_fb.titleLabel.font=[UIFont systemFontOfSize:15];
    [button_fb setTitle:@"发表" forState:UIControlStateNormal];
    [button_fb setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [button_fb addTarget:self action:@selector(fabiao) forControlEvents:UIControlEventTouchUpInside];
    button_fb.backgroundColor=[UIColor lightGrayColor];
    [view_pl addSubview:button_fb];
    
    
    //增加监听，当键盘出现或改变时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    //增加监听，当键退出时收出消息
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}
- (void)keyboardWillShow:(NSNotification *)aNotification
{
    //获取键盘的高度
    NSDictionary *userInfo = [aNotification userInfo];
    NSValue *aValue = [userInfo objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGRect keyboardRect = [aValue CGRectValue];
    JP_height = keyboardRect.size.height;
    int width = keyboardRect.size.width;
    MYLOG(@"键盘高度是  %d",JP_height);
    MYLOG(@"键盘宽度是  %d",width);
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{


    [_pinglu_Text resignFirstResponder];
    
}
//当键退出时调用
- (void)keyboardWillHide:(NSNotification *)aNotification
{
    _view_JianPan_tanqi.hidden=YES;
    view_pl.hidden=YES;
}
-(void)fabiao
{

    MYLOG(@"发表评论");
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
