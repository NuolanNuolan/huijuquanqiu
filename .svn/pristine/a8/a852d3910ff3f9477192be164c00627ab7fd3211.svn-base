//
//  JDLMeOrderViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/19.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLMeOrderViewController.h"
#import "JDLMeOrderTableViewCell.h"
#import "JDLLogisticsViewController.h"
#import "JDLOrderDeatilViewController.h"
#import "JDLISChargeTableViewCell.h"
#import "JDLAFTERSERVICETableViewCell.h"
#import "JDLTuikuanViewController.h"
#import "JDLOrderinfoModel.h"
#import "JDLPayModel.h"
#import "JDLBuyView.h"
#import "JDLStoreViewController.h"

@interface JDLMeOrderViewController ()<UITableViewDelegate,UITableViewDataSource,LookLogisticsDelegate>
{

    //5个按钮
    UIButton *_btn_title;
    //按钮下滑线
    UIView *_xianView;
    //表格
    UITableView *_Tableview_all;
    //店铺imageview
    UIImageView *_DPimageview;
    //店铺按钮
    UIButton *_DPbtn;
    //卖家发货lable
    UILabel *_DPlab;
    //商品合计lable
    UILabel *_DP_All;
    //三个按钮
    UIButton *_btn_Three;
    //    订单的model
    JDLPayModel *_payModel;
    //    订单的客户信息
    JDLOrderinfoModel *_orderinfoModel;
    //订单商品数组
    NSMutableArray *_Order_goods;
    //订单全部order数组
    NSMutableArray *_Order_info;
    //没有相关订单显示imageview
    UIImageView *_imageview_Order;
}
//当前被选中按钮
@property(nonatomic,strong)UIButton *selectdBtn;
@end

@implementation JDLMeOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //左右上角按钮背景色
    [self Dismiss];
    //按钮
    [self CreateBtu];
    //表格
    [self CreateTableview];
    [self LoadData];
    // Do any additional setup after loading the view.
}
#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    self.title = @"我的订单";
//    返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    //右上角搜索
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(screen_Width-20, 0, 20, 20);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"nav_search(1)"] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(RightItem:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right_btn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =right_btn;
    //订单没数据时显示imageview
    _imageview_Order = [[UIImageView alloc]initWithFrame:CGRectMake(screen_Width/2-85, screen_Height/2-110, 170, 110)];
    _imageview_Order.image = [UIImage imageNamed:@"pic_No_order"];
    [self.view addSubview:_imageview_Order];
}


-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)RightItem:(UIButton *)btn
{
    
    MYLOG(@"搜索!");
    
}
-(void)LoadData
{
    _payModel = [[JDLPayModel alloc]init];
    _orderinfoModel = [[JDLOrderinfoModel alloc]init];
     [MBProgressHUD showMessage:@"加载中" toView:self.view];
    [JDLOrderinfoModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        if (error==nil) {
            if (objects.count>0) {
                 _Order_info = [NSMutableArray arrayWithArray:objects];
                _imageview_Order.hidden =YES;
                MYLOG(@"%@",_Order_info);
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    [_Tableview_all reloadData];
//                    
//                });
                [self Loaddata_goods];
            }
            else
            {
                _imageview_Order.hidden =NO;
                [MBProgressHUD hideHUDForView:self.view animated:YES];
               
            }
            
        }else
        {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showError:@"服务器繁忙"];
            
        }
    }];

    
}
-(void)Loaddata_goods
{

    [JDLPayModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        if (error==nil) {
            if (objects.count>0) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                _Order_goods = [NSMutableArray arrayWithArray:objects];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_Tableview_all reloadData];
                });
                 MYLOG(@"%@",_Order_goods);
                //进行数据操作
                [self EditData];
            }
            else
            {
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
            
        }else
        {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showError:@"服务器繁忙"];
            
        }
    } ];
    
}
#pragma mark 创建按钮
-(void)CreateBtu
{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, 40)];
    bgview.backgroundColor = [UIColor clearColor];
    [self.view addSubview:bgview];
    NSArray *titleArray = @[@"全部",@"待付款",@"待收货",@"待评价",@"售后"];
    CGFloat with = screen_Width/5;
    for(int i = 0; i < titleArray.count;i++){
        _btn_title = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _btn_title.frame = CGRectMake(i*with, 0, with, 40-2);
        [_btn_title setTitle:titleArray[i] forState:UIControlStateNormal];
        [_btn_title setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1] forState:UIControlStateNormal];
        [_btn_title addTarget:self action:@selector(btn_click:) forControlEvents:UIControlEventTouchUpInside];
         _btn_title.tag = 200+i;
        if (i == 0) {
            [_btn_title setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
            [self btn_click:_btn_title];
        }
        _btn_title.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        [bgview addSubview:_btn_title];
    }
    _xianView = [[UIView alloc] initWithFrame:CGRectMake(0, 40-2, with, 2)];
    _xianView.backgroundColor = [UIColor orangeColor];
    [bgview addSubview:_xianView];
}
-(void)btn_click:(UIButton *)btn
{
    //改变选中按钮颜色
    [self changedBtnColor:btn];
    [UIView animateWithDuration:0.05f animations:^{
        CGRect rc = _xianView.frame;
        _xianView.frame = CGRectMake(rc.size.width*(btn.tag-200), rc.origin.y, rc.size.width, rc.size.height);
    }];
    
}
-(void)changedBtnColor:(UIButton *)btn{
    [self.selectdBtn setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
    self.selectdBtn = btn;
    //根据but.tag值加载不同界面刷新表格
    [_Tableview_all reloadData];
    if (self.selectdBtn.tag==200) {
        if (_Order_info.count>0) {
            _imageview_Order.hidden =YES;
        }else
        {
            _imageview_Order.hidden =NO;
        }
    }
}
#pragma mark 创建表格
-(void)CreateTableview
{

    _Tableview_all = [[UITableView alloc]initWithFrame:CGRectMake(0, 40+64, screen_Width, screen_Height-40-64) style:UITableViewStyleGrouped];
    _Tableview_all.delegate = self;
    _Tableview_all.dataSource = self;
    _Tableview_all.backgroundColor = [UIColor clearColor];
    _Tableview_all.showsVerticalScrollIndicator =NO;
    _Tableview_all.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_Tableview_all];
}
#pragma mark 处理数据
-(void)EditData
{
    //商品全部订单 _Order_info
    //全部商品   _Order_goods
    
    
   
    
}
#pragma mark 实现协议方法
//几个分组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    if (_selectdBtn.tag==200) {
        return _Order_goods.count;
    }
    else if(_selectdBtn.tag==201) {
        return 1;
    }
    else if(_selectdBtn.tag==202) {
        return 1;
    }
    else
    {
        return 1;
    }
}
//分组有几个cell
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_selectdBtn.tag==200) {
        return 3;
    }
    else if(_selectdBtn.tag==202)
    {
     return 2;
    }else
    {
    
        return 1;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_selectdBtn.tag==200) {
        
        static NSString *ID = @"Cell";
        JDLMeOrderTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!cell){
            
            cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLMeOrderTableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
    }
    else if(_selectdBtn.tag==202)
    {
        
        static NSString *ID = @"Cell";
        JDLISChargeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!cell){
            
            cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLISChargeTableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        ((JDLISChargeTableViewCell*)cell).index_section = indexPath.section;
        ((JDLISChargeTableViewCell*)cell).index_path = indexPath.row;
        ((JDLISChargeTableViewCell*)cell).delegate = self;
        
        return cell;
    }
    else
    {
    
        
        static NSString *ID = @"Cell";
        JDLAFTERSERVICETableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
        if(!cell){
            
            cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLAFTERSERVICETableViewCell" owner:self options:nil]lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
//        ((JDLISChargeTableViewCell*)cell).index_section = indexPath.section;
//        ((JDLISChargeTableViewCell*)cell).index_path = indexPath.row;
//        ((JDLISChargeTableViewCell*)cell).delegate = self;
        
        return cell;
        
    }
    
    
    
}

//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (_selectdBtn.tag==200) {
        return 110;
    }
    else if(_selectdBtn.tag==202) {
            return 140;
        }
    else
    {
        
        return 140;
    }
}
//头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 49;
}
//尾视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (_selectdBtn.tag==200) {
        return 96;
    }
    else if (_selectdBtn.tag==202)
    {
    
        return 40;
    }
    else
    {
    
        return 1;
    }
    
}
//头
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 49)];
    view.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
    
    _DPimageview = [[UIImageView alloc]initWithFrame:CGRectMake(19.5, 17, 15, 15)];
    _DPimageview.image = [UIImage imageNamed:@"pic_store"];
    [view addSubview:_DPimageview];
    
    _DPbtn = [[UIButton alloc]initWithFrame:CGRectMake(44.5, 18, 170, 13)];
    [_DPbtn setTitle:@"和源家居用品专营店" forState:UIControlStateNormal];
    _DPbtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    [_DPbtn setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1]  forState:UIControlStateNormal];
    _DPbtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [_DPbtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:_DPbtn];
    
    UIImageView *_image_JT =[[UIImageView alloc]initWithFrame:CGRectMake(_DPbtn.frame.size.width+10, 18, 6, 11)];
    _image_JT.image = [UIImage imageNamed:@"pic_right_JT"];
    [view addSubview:_image_JT];
    
    _DPlab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width-20-70, 18, 70, 13)];
    _DPlab.textColor = [UIColor colorWithRed:255/255.0f green:59/255.0f blue:48/255.0f alpha:1];
    _DPlab.font = [UIFont systemFontOfSize:13.0f];
    _DPlab.text =@"卖家已发货";
    [view addSubview:_DPlab];
    return view;
}
//尾
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{

    if (_selectdBtn.tag==200) {
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 96)];
        view.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
        
        _DP_All = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width-140-30, 13, 150, 13)];
        _DP_All.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1];
        _DP_All.font = [UIFont boldSystemFontOfSize:12.0f];
        _DP_All.text =@"共2两件商品 合计:¥ 29.80";
        [view addSubview:_DP_All];
        
        UIView *view_Xian = [[UIView alloc] initWithFrame:CGRectMake(0, 40, screen_Width, 1)];
        view_Xian.backgroundColor = [UIColor colorWithRed:204/255.0f green:204/255.0f blue:204/255.0f alpha:1];
        [view addSubview:view_Xian];
        
        NSArray *_DP_array = @[@"申请售后",@"查看物流",@"确认收货"];
        CGFloat with = 225/3;
        for(int i = 0; i < _DP_array.count;i++){
            _btn_Three = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            _btn_Three.frame = CGRectMake(screen_Width-13-225+i*with, 53.5, with, 13);
            [_btn_Three setTitle:_DP_array[i] forState:UIControlStateNormal];
            [_btn_Three setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1] forState:UIControlStateNormal];
            [_btn_Three addTarget:self action:@selector(btn_click_all:) forControlEvents:UIControlEventTouchUpInside];
            if (i == 2) {
                [_btn_Three setTitleColor:[UIColor colorWithRed:255/255.0f green:59/255.0f blue:48/255.0f alpha:1] forState:UIControlStateNormal];
            }
            
            _btn_Three.titleLabel.font = [UIFont systemFontOfSize:13.0f];
            _btn_Three.tag = 300+i;
            [view addSubview:_btn_Three];
        }
        
        for (int i=1; i<3; i++) {
            
            UIView *view_Shu = [[UIView alloc]initWithFrame:CGRectMake(screen_Width-13-225+i*with, 51, 1, 20)];
            view_Shu.backgroundColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
            [view addSubview:view_Shu];
        }
        
        
        UIView *view_JianGe = [[UIView alloc]initWithFrame:CGRectMake(0, 81, screen_Width, 15)];
        view_JianGe.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
        [view addSubview:view_JianGe];
        return view;
    }
    else if(_selectdBtn.tag==202)
    {
    
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 96)];
        view.backgroundColor = [UIColor colorWithRed:240/255.0f green:240/255.0f blue:240/255.0f alpha:1];
        
        _DP_All = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width-140-30, 13, 150, 13)];
        _DP_All.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1];
        _DP_All.font = [UIFont boldSystemFontOfSize:12.0f];
        _DP_All.text =@"共2两件商品 合计:¥ 29.80";
        [view addSubview:_DP_All];
        
        return view;
        
    }
    else
    {
    
        return nil;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDLOrderDeatilViewController *detail = [[JDLOrderDeatilViewController alloc]init];
     [self.navigationController pushViewController:detail animated:YES];
}
-(void)btnClick
{

    MYLOG(@"跳转到店铺");
}
-(void)btn_click_all:(UIButton *)btn
{

    if(btn.tag==300){
        MYLOG(@"申请售后");
    }else if (btn.tag==301)
    {
        JDLLogisticsViewController *log = [[JDLLogisticsViewController alloc]init];
        [self.navigationController pushViewController:log animated:YES];
    }
    else if (btn.tag==302)
    {
        MYLOG(@"确认收货");
    }
}
//实现协议方法查看物流
-(void)LookLogistics_section_indexpath:(NSInteger)index_section Andindex_path:(NSInteger)index_path
{

    JDLLogisticsViewController *log = [[JDLLogisticsViewController alloc]init];
    [self.navigationController pushViewController:log animated:YES];
    
}
//实现协议方法退款
-(void)LookLogistics_TuiKuan:(NSInteger)index_section Andindex_path:(NSInteger)index_path
{

    JDLTuikuanViewController *TuiKuan = [[JDLTuikuanViewController alloc]initWith_SPid:1];
    [self.navigationController pushViewController:TuiKuan animated:YES];
}


@end
