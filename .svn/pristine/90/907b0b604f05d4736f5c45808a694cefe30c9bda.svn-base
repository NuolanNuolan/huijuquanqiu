//
//  JDLStoreViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/7.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLStoreViewController.h"
#import "JDLSPShouCangTableViewCell.h"
#import "JDLStoredeatail.h"
#import "JDLStore_new.h"
#import "JDLStore_home.h"
#import "JDLStore_allshop.h"
#import "JDLStore_activity.h"
#import "JDLBuyViewController.h"
#import "JDLCollectModel.h"
#import "JDLFav_shop.h"

@interface JDLStoreViewController ()<UISearchBarDelegate,UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{
    JDLStoredeatail *_storemodel;
    JDLStore_home *_store_homemodel;
    JDLStore_allshop *_store_allshopmodel;
    JDLStore_activity *_store_activitymodel;
    JDLStore_new *_store_newmodel;
    JDLFav_shop *_collectModel;
    //定义一个数组数字来判断是否被收藏
    int g;
    //收藏按钮
    UIButton *btn_sc;
    //店铺ID
    NSString * _Store_ID;
    //装数据的数组
    NSMutableArray *_data_arr;
    //装店铺基本数据的字典
    NSDictionary *_dic_store;
    //首页数据数组
    NSMutableArray *_data_homearr;
    //全部商品数组
    NSMutableArray *_data_allshoparr;
    //new
    NSMutableArray *_data_newarr;
    //活动
    NSMutableArray *_data_activityarr;
    
    //装按钮的VIEW;
    UIView *view_title;
    //4个按钮
    UIButton *btn_Four;
    //4个小按钮
    UIButton *btn_Four_All;
    //线条
    UIView *_xianView;
    //滚动视图
    UIScrollView *_Scrollview_SC;
    //表格
    UITableView *_tableview;
    //首页商品图片
    UIImageView *_bgimage;
}
@property(nonatomic,strong)UIButton *selectdBtn;
@property(nonatomic,strong)UIButton *selectdBtn_all;
@end

@implementation JDLStoreViewController
//初始化方法传入店铺ID
- (id)initWith_StoreID:(NSString *)Store_ID
{
    
    self = [super init];
    if (self) {
        _Store_ID =Store_ID;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //加载数据
    [self store_sc_load];
    [self Dismiss];
    
    //创建标题4按钮
    [self CreateBtn];
    //创建滚动视图
    //    [self CreateScrllow];
}

#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 225, 35)];//allocate titleView
    titleView.backgroundColor = [UIColor colorWithRed:244/255.0f green:244/255.0f blue:244/255.0f alpha:1];
    
    [self.navigationItem.titleView sizeToFit];
    
    self.navigationItem.titleView = titleView;
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    
    searchBar.delegate = self;
    searchBar.frame = CGRectMake(0, 0, 225, 35);
    searchBar.backgroundColor = [UIColor colorWithRed:224/255.0f green:224/255.0f blue:224/255.0f alpha:1];
    searchBar.layer.cornerRadius = 5;
    searchBar.layer.masksToBounds = YES;
    [searchBar.layer setBorderWidth:8];
    [searchBar.layer setBorderColor:[UIColor whiteColor].CGColor];  //设置边框为白色
    
    searchBar.placeholder = @"搜索店铺内商品/查看分类";
    [titleView addSubview:searchBar];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}
//判断是否被收藏
-(void)store_sc_load{

    _collectModel = [[JDLFav_shop alloc] init];
    NSString *str = [NSString stringWithFormat:@"pid='%@'",_Store_ID];
     NSDictionary *  _dic_Arr = @{@"where":str};
    [JDLFav_shop getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
        [MBProgressHUD showMessage:@"加载中" toView:self.view];
        if (error==nil) {
            if (objects.count>0) {
                 _collectModel = [objects objectAtIndex:0];
                [self loaddata];
                g=1;
                
            }
            else
            {
                [self loaddata];
                g=0;
            }
        }
    }];
}
-(void)loaddata
{
    
    //店铺基本信息
    [JDLStoredeatail getObjectWithId:_Store_ID completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                
                _data_arr = [NSMutableArray arrayWithObject:object];
                if (_data_arr.count>0) {
                    
                    _storemodel = [_data_arr objectAtIndex:0];
                    [self loaddata_all];
                    //数据请求成功后创建
                    [self CreateView];
                    if (g==1) {
                    [btn_sc setTitle:@"已收藏" forState:UIControlStateNormal];
                    btn_sc.tag=1;
                        
                    }
                }
                
                
            }
        }else
        {
            
            MYLOG(@"get list error=%@",error);
            
        }
    } ];
    
    
}
//店铺所有信息加载数据
-(void)loaddata_all
{
    //首页
    [ JDLStore_home getObjectWithId:_storemodel.home_id completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                _data_homearr = [NSMutableArray arrayWithObject:object];
                if (_data_homearr.count>0) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    _store_homemodel = [_data_homearr objectAtIndex:0];
                    if (_Scrollview_SC) {
                        [_Scrollview_SC removeAllSubviews];
                    }
                    [self CreateScrllow];
                }
            }
        }
        else
        {
            
            MYLOG(@"get list error=%@",error);
            
        }
    }];
    //全部
    [ JDLStore_allshop getObjectWithId:_storemodel.products_id completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                _data_allshoparr = [NSMutableArray arrayWithObject:object];
                if (_data_allshoparr.count>0) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    _store_allshopmodel = [_data_allshoparr objectAtIndex:0];
                    if (_Scrollview_SC) {
                        [_Scrollview_SC removeAllSubviews];
                    }
                    [self CreateScrllow];
                }
            }
        }
        else
        {
            
            MYLOG(@"get list error=%@",error);
            
        }
    }];
    //new
    [ JDLStore_new getObjectWithId:_storemodel.newshop_id completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                _data_newarr = [NSMutableArray arrayWithObject:object];
                if (_data_newarr.count>0) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    _store_newmodel = [_data_newarr objectAtIndex:0];
                    //                     [_tableview reloadData];
                    if (_Scrollview_SC) {
                        [_Scrollview_SC removeAllSubviews];
                    }
                    [self CreateScrllow];
                }
            }
        }
        else
        {
            
            MYLOG(@"get list error=%@",error);
            
        }
    }];
    //活动
    [ JDLStore_activity getObjectWithId:_storemodel.activity_id completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                _data_activityarr = [NSMutableArray arrayWithObject:object];
                if (_data_activityarr.count>0) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    _store_activitymodel = [_data_activityarr objectAtIndex:0];
                    if (_Scrollview_SC) {
                        [_Scrollview_SC removeAllSubviews];
                    }
                    [self CreateScrllow];
                }
            }
        }
        else
        {
            
            MYLOG(@"get list error=%@",error);
            
        }
    }];
    
    
}
-(void)createViewClick
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
//搜索事件
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    MYLOG(@"212121");
}

-(void)CreateView
{
    _dic_store = [[NSDictionary alloc]init];
    _dic_store = _storemodel.shop;
    
    float h = 114;
    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, screen_Width, h)];
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, headView.frame.size.width, headView.frame.size.height)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:[_dic_store objectForKey:@"bgimg"]] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(1)"]];
    
    UIImageView *imageView_dp = [[UIImageView alloc]initWithFrame:CGRectMake(55, 32, 50, 50)];
    imageView_dp.layer.masksToBounds=YES;
    imageView_dp.layer.cornerRadius=25.0f;
    [imageView_dp sd_setImageWithURL:[NSURL URLWithString:[_dic_store objectForKey:@"img"]] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
    
    UILabel *lab_tltle = [[UILabel alloc]initWithFrame:CGRectMake(110, 41, 200, 15)];
    lab_tltle.text =[_dic_store objectForKey:@"name"];
    lab_tltle.font = [UIFont boldSystemFontOfSize:15];
    lab_tltle.textColor = [UIColor whiteColor];
    
    UILabel *lab_other = [[UILabel alloc]initWithFrame:CGRectMake(110, 61, 200, 15)];
    lab_other.textColor = [UIColor whiteColor];
    lab_other.font = [UIFont systemFontOfSize:11];
    lab_other.text = [NSString stringWithFormat:@"销量%@  |  收藏%@",[_dic_store objectForKey:@"sellnum"],[_dic_store objectForKey:@"collect"]];
    
    
    btn_sc = [[UIButton alloc]initWithFrame:CGRectMake(screen_Width-20-61, 64, 61, 26)];
    btn_sc.layer.masksToBounds =YES;
    btn_sc.layer.cornerRadius =3.0f;
    btn_sc.layer.borderWidth = 1.0f;
    [btn_sc.layer setBorderColor:[UIColor whiteColor].CGColor];
    btn_sc.titleLabel.font = [UIFont systemFontOfSize:15];
    [btn_sc setTitle:@"收藏" forState:UIControlStateNormal];
    [btn_sc addTarget:self action:@selector(btn_SC:) forControlEvents:UIControlEventTouchUpInside];
    
    [headView addSubview:imageView];
    [headView addSubview:lab_tltle];
    [headView addSubview:lab_other];
    [headView addSubview:btn_sc];
    [headView addSubview:imageView_dp];
    [self.view addSubview:headView];
}

//创建4个title按钮
-(void)CreateBtn
{
    float h = 114;
    view_title = [[UIView alloc]initWithFrame:CGRectMake(0, h+64, screen_Width, 50)];
    view_title.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    [self.view addSubview:view_title];
    NSArray *titleArray = @[@"首页",@"全部商品",@"上新",@"店铺活动"];
    CGFloat with = screen_Width/4;
    for(int i = 0; i < titleArray.count;i++){
        
        btn_Four = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        btn_Four.frame = CGRectMake(i*with, 0, with, 50-2);
        [btn_Four setTitle:titleArray[i] forState:UIControlStateNormal];
        [btn_Four setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1] forState:UIControlStateNormal];
        [btn_Four addTarget:self action:@selector(butVlick_sc_all:) forControlEvents:UIControlEventTouchUpInside];
        btn_Four.tag = 50+i;
        if (i == 0) {
            [btn_Four setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
            [self butVlick_sc_all:btn_Four];
        }
        
        btn_Four.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        
        [view_title addSubview:btn_Four];
    }
    _xianView = [[UIView alloc] initWithFrame:CGRectMake(0, 50-2, with, 2)];
    _xianView.backgroundColor = [UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [view_title addSubview:_xianView];
    
}

-(void)CreateScrllow
{
    float h = 114;
    _Scrollview_SC = [[UIScrollView alloc]initWithFrame:CGRectMake(0, h+64+50, SCREEN_WIDTH, screen_Height-169)];
    _Scrollview_SC.contentSize =  CGSizeMake(SCREEN_WIDTH*4, 0);
    _Scrollview_SC.pagingEnabled = YES;
    _Scrollview_SC.delegate = self;
    _Scrollview_SC.bounces = NO;
    _Scrollview_SC.tag=3000;
    _Scrollview_SC.showsHorizontalScrollIndicator = NO;
    _Scrollview_SC.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    //    _Scrollview_SC.backgroundColor = [UIColor redColor];
    [self.view addSubview:_Scrollview_SC];
    //在滚动上添加tableview
    [self Createtableview];
}
-(void)Createtableview
{
    for (int i=0; i<4; i++) {
        _tableview = [[UITableView alloc]initWithFrame:CGRectMake(screen_Width*i, 0, screen_Width, screen_Height-114)style:UITableViewStylePlain];
        _tableview.backgroundColor = [UIColor clearColor];
        _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableview.delegate = self;
        _tableview.dataSource = self;
        _tableview.showsVerticalScrollIndicator= NO;
        _tableview.tag=1000+i;
        [_Scrollview_SC addSubview:_tableview];
    }
}
//表格协议方法

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(tableView.tag==1000)
    {
        static NSString *identifer=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userifo"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        _bgimage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, screen_Width-20, 150)];
        if (_store_homemodel) {
            for (int i = 0; i<_store_homemodel.home_arr.count; i++) {
                [_bgimage sd_setImageWithURL:[NSURL URLWithString:[[_store_homemodel.home_arr objectAtIndex:i]objectForKey:@"img" ]] placeholderImage:[UIImage imageNamed:@"bg_home_banner"]];
            }
        }
        
        
        
        
        
        [cell.contentView addSubview:_bgimage];
        
        return cell;
    }
    else if (tableView.tag==1001)
        
    {
        
        
        static NSString *ID = @"Cell";
        JDLSPShouCangTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLSPShouCangTableViewCell" owner:self options:nil]lastObject];
        }
        else
        {
            
            //删除cell的所有子视图
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        if (_store_allshopmodel) {
            
            [cell setallshopmodel:_store_allshopmodel.allshoparr[indexPath.row]];
        }
        
        cell.selectionStyle=UITableViewCellAccessoryNone;
        //隐藏系统的分隔线
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
    else if (tableView.tag==1002)
    {
        static NSString *ID = @"Cell";
        JDLSPShouCangTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLSPShouCangTableViewCell" owner:self options:nil]lastObject];
        }
        else
        {
            
            //删除cell的所有子视图
            while ([cell.contentView.subviews lastObject] != nil) {
                [(UIView *)[cell.contentView.subviews lastObject] removeFromSuperview];
            }
        }
        if (_store_newmodel) {
            
            [cell setallnewmodel:_store_newmodel.newshoparr[indexPath.section]];
        }
        cell.selectionStyle=UITableViewCellAccessoryNone;
        //隐藏系统的分隔线
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
    else
    {
        
        static NSString *identifer=@"cell";
        UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:identifer];
        if (cell==nil) {
            cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifer];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            
        }
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"userifo"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.backgroundColor = [UIColor clearColor];
        _bgimage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, screen_Width-20, 150)];
        //        _bgimage.image = [UIImage imageNamed:@"img(1)@2x.png"];
        _bgimage.layer.masksToBounds=YES;
        _bgimage.layer.cornerRadius =5.0f;
        
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 110, screen_Width, 40)];
        view.backgroundColor = [UIColor blackColor];
        view.alpha= 0.5;
        
        UILabel * lab =[[ UILabel alloc]initWithFrame:CGRectMake(10, 123, 200, 17)];
        lab.textColor = [UIColor whiteColor];
        //        lab.text = @"轻松夏日";
        lab.font = [UIFont boldSystemFontOfSize:14.0f];
        
        UILabel * lab1 =[[ UILabel alloc]initWithFrame:CGRectMake(screen_Width-20-70, 126, 70, 13)];
        lab1.textColor = [UIColor whiteColor];
        //        lab1.text = @"2016-06-06";
        lab1.font = [UIFont systemFontOfSize:10.0f];
        
        if (_store_activitymodel) {
            for (int i = 0; i<_store_activitymodel.activityarr.count; i++) {
                [_bgimage sd_setImageWithURL:[NSURL URLWithString:[[_store_activitymodel.activityarr objectAtIndex:i]objectForKey:@"img" ]] placeholderImage:[UIImage imageNamed:@"bg_home_banner"]];
                lab.text =[[_store_activitymodel.activityarr objectAtIndex:i]objectForKey:@"title"];
                lab1.text =[[_store_activitymodel.activityarr objectAtIndex:i]objectForKey:@"content"];
            }
        }
        
        [_bgimage addSubview:view];
        
        [_bgimage addSubview:lab];
        [_bgimage addSubview:lab1];
        
        
        [cell.contentView addSubview:_bgimage];
        
        return cell;
    }
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (self.selectdBtn.tag ==51) {
        JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:[_store_allshopmodel.allshoparr[indexPath.row]objectForKey:@"pid"]];
        [self.navigationController pushViewController:buyVc animated:YES];
    }
    else if (self.selectdBtn.tag ==52)
    {
        
        JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:[_store_newmodel.newshoparr[indexPath.section]objectForKey:@"pid"]];
        [self.navigationController pushViewController:buyVc animated:YES];
        
    }
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==1000) {
        
        return _store_homemodel.home_arr.count;
    }
    else if(tableView.tag==1001)
    {
        return _store_allshopmodel.allshoparr.count;
    }
    else if(tableView.tag==1002)
    {
        
        return 1;
    }
    else
    {
        
        return _store_activitymodel.activityarr.count;
    }
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag==1000) {
        return 1;
    }
    else if(tableView.tag==1001)
    {
        return 1;
        
    }
    else if(tableView.tag==1002)
    {
        
        
        return _store_newmodel.newshoparr.count;
    }
    else
    {
        
        return  1;
    }
    
    
    
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(tableView.tag == 1000 )
    {
        return 1;
    }else if(tableView.tag==1001)
    {
        
        return 40;
    }
    else if(tableView.tag==1002)
    {
        
        return 41;
    }
    else
    {
        
        return 1;
    }
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    
    return 1;
}
//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag==1000){
        
        return 155;
        
    }
    else if(tableView.tag==1001)
    {
        
        return 110;
    }
    else if(tableView.tag==1002)
    {
        
        return 110;
    }
    else
    {
        
        return 155;
    }
    
    
    
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    
    if (tableView.tag==1001) {
        UIView *view_head = [[UIView alloc]init];
        view_head.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
        
        NSArray *titleArray = @[@"综合",@"销量",@"上新",@"价格"];
        CGFloat with = screen_Width/4;
        for(int i = 0; i < titleArray.count;i++){
            
            btn_Four_All = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            btn_Four_All.frame = CGRectMake(i*with, 0, with, 40-2);
            [btn_Four_All setTitle:titleArray[i] forState:UIControlStateNormal];
            [btn_Four_All setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1] forState:UIControlStateNormal];
            [btn_Four_All addTarget:self action:@selector(butVlick_sc_all:) forControlEvents:UIControlEventTouchUpInside];
            btn_Four_All.tag = 40+i;
            if (i == 0) {
                
                [btn_Four_All setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
                [self butVlick_sc_all:btn_Four_All];
            }
            
            btn_Four_All.titleLabel.font = [UIFont systemFontOfSize:14.0f];
            
            [view_head addSubview:btn_Four_All];
        }
        
        return  view_head;
    }
    if (tableView.tag==1002) {
        UIView *view =[[UIView alloc]init];
        view.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
        UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(20, 13, 200, 15)];
        lab.text = @"5月1日";
        lab.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
        lab.font = [UIFont systemFontOfSize:12.0f];
        
        [view addSubview:lab];
        
        return view;
    }
    else
    {
        return nil;
    }
    
    
}
//按钮点击
- (void)butVlick_sc_all:(UIButton *)btn{
    if(btn.tag>=50)
    {
        [_tableview reloadData];
        [self changedBtnColor:btn];
        NSInteger i = btn.tag;
        CGFloat x = i *screen_Width;
        _Scrollview_SC.contentOffset = CGPointMake(x, 0);
        [UIView animateWithDuration:0.05 animations:^{
            CGRect rc = _xianView.frame;
            _xianView.frame = CGRectMake(rc.size.width*(btn.tag-50), rc.origin.y, rc.size.width, rc.size.height);
            [_Scrollview_SC setContentOffset:CGPointMake(SCREEN_WIDTH*(btn.tag-50), 0)];
        }];
        
    }
    else
    {
        
        [self changedBtnColor:btn];
        
    }
    
    
}
-(void)changedBtnColor:(UIButton *)btn{
    if(btn.tag>=50)
    {
        
        [self.selectdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
        self.selectdBtn = btn;
        
    }
    else if(btn.tag>=40)
    {
        
        [self.selectdBtn_all setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
        self.selectdBtn_all = btn;
        
    }
    
}
//收藏按钮点击
-(void)btn_SC:(UIButton *)souBtn
{
    if (![LoginModel isLogin]) {
        
        JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
        [self.navigationController pushViewController:logVc animated:YES];
    }
    else
    {
        
        if(souBtn.tag==0){
            _collectModel = [[JDLFav_shop alloc] init];
            _collectModel.name = [_storemodel.shop objectForKey:@"name"];
            _collectModel.pid =_Store_ID;
            _collectModel.url = [_storemodel.shop objectForKey:@"img"];
            [_collectModel saveObjectWithCompletion:^(JDLFav_shop *collectModel, NSError *error) {
                if (error == nil) {
                    MYLOG(@"seccecc");
                    _collectModel = collectModel;
                    [souBtn setTitle:@"已收藏" forState:UIControlStateNormal];
                    souBtn.tag=1;
                } else {
                    // deal with error
                    
                    [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                    
                }
            }];
            
            
            
            
        }
        else
        {
            [_collectModel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
                
                if (error == nil) {
                    MYLOG(@"seccecc");
                    [souBtn setTitle:@"收藏" forState:UIControlStateNormal];
                    souBtn.tag=0;
                } else {
                    // deal with error
                    
                    [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                    
                }
            }];
            
            
        }
        
        
    }
    
    
    
    
}
#pragma mark - ScrollView的代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if (scrollView.tag==3000) {
        CGRect rc = _xianView.frame;
        _xianView.frame = CGRectMake(rc.size.width*_Scrollview_SC.contentOffset.x/SCREEN_WIDTH, rc.origin.y, rc.size.width, rc.size.height);
        [UIView animateWithDuration:0.2 animations:^{
            NSInteger count = scrollView.contentOffset.x/scrollView.frame.size.width;
            UIButton *btn = (UIButton *)[self.view viewWithTag:count+50];
            [self changedBtnColor:btn];
        }];
        
    }else
    {
        float h = 114;
        CGPoint point=scrollView.contentOffset;
        [view_title setFrame:CGRectMake(0, h+nav_Height-point.y, screen_Width, 50)];
        [self.view addSubview:view_title];
        [_Scrollview_SC setFrame:CGRectMake(0, h+50+nav_Height-point.y, SCREEN_WIDTH, screen_Height)];
        [self.view addSubview:_Scrollview_SC];
        
        //        for (int i=0; i<4; i++){
        //            _tableview.frame = CGRectMake(screen_Width*i, 0, screen_Width, screen_Height-114);
        //            [_Scrollview_SC addSubview:_tableview];
        //        }
        if(h+64-point.y<=64){
            [view_title setFrame:CGRectMake(0, 64, screen_Width, 50)];
            [self.view addSubview:view_title];
            [_Scrollview_SC setFrame:CGRectMake(0, nav_Height+50, SCREEN_WIDTH, screen_Height)];
            [self.view addSubview:_Scrollview_SC];
            //            for (int i=0; i<4; i++){
            //                _tableview.frame = CGRectMake(screen_Width*i, 0 , screen_Width, screen_Height-114);
            //                [_Scrollview_SC addSubview:_tableview];
            //
            //            }
            
        }
        else if (h+64-point.y>=h+64)
        {
            [view_title setFrame:CGRectMake(0, h+64, screen_Width, 50)];
            [self.view addSubview:view_title];
            [_Scrollview_SC setFrame:CGRectMake(0, h+50+64-point.y, SCREEN_WIDTH, screen_Height - NAVI_HEIGHT - TABBAR_HEIGHT - 50)];
            [self.view addSubview:_Scrollview_SC];
            //            for (int i=0; i<4; i++){
            //
            //                [_Scrollview_SC addSubview:_tableview];
            //
            //            }
        }
    }
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    
}


@end
