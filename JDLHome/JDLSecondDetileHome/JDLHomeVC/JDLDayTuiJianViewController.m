//
//  JDLDayTuiJianViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/31.
//  Copyright © 2016年 JDL. All rights reserved.
//
#define IMAGE_HEIGHT  screen_Height*0.248307
#import "JDLDayTuiJianViewController.h"
#import "JDLDayTuiJianTableViewCell.h"
#import "JDLBuyViewController.h"
#import "JDLDayDetileModel.h"

@interface JDLDayTuiJianViewController ()<UITableViewDelegate,UITableViewDataSource,JDLDayTuiJianCellDelegate>
{
    //传入ID；
    NSString * _Day_id;
    UIImageView * _imageview;
    UITableView * _tableview;
    NSMutableArray *_dayDetileArr;
    JDLDayDetileModel *_Daydetilmodel;
}

@end

@implementation JDLDayTuiJianViewController
- (id)initWith_Day_ID:(NSString *)Day_ID{

    self = [super init];
    if (self) {
        _Day_id = Day_ID;
    }
    return self;
}



- (void)viewDidLoad {
    [super viewDidLoad];
//    dismiss_w;
    [self loadData];
    //页面基本属性
    [self CreateController];
    //创建图片+tableview
    [self CreateImageANDTableview];
    //上拉下拉
    [self creatRefresh];
    // Do any additional setup after loading the view.
}
#pragma mark -  页面基本属性
-(void)CreateController{
    self.title=@"每日推荐";
    self.view.backgroundColor = [UIColor whiteColor];
    //左边返回
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}
//按钮返回事件
-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark 添加上拉，下拉加载
-(void)creatRefresh{
    
    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
    _tableview.header = refreshHeader;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
    _tableview.footer = refreshFooter;
}


//  下拉刷新
-(void)headerRefreshing{
    
    MYLOG(@"下拉刷新事件");
    if (_dayDetileArr.count > 0) {
//        [_dayDetileArr removeAllObjects];
    }
    [self loadData];
}

//  上拉加载
-(void)footerRereshing{
    MYLOG(@"上拉加载事件");
    [self loadData];
}

-(void)loadData{
    NSString *str = [NSString stringWithFormat:@"rid= '%@'",_Day_id];
    NSDictionary *dic = @{@"where":str};
    MYLOG(@"aaaa%@",dic);
    [JDLDayDetileModel getObjectsWithParams:dic completion:^(NSArray *objects, NSError *error) {
            [MBProgressHUD showMessage:@"加载中" toView:self.view];
        if (error == nil) {
            
            if (objects) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                //绑定图片
                _Daydetilmodel =[objects objectAtIndex:0];
                [_imageview sd_setImageWithURL: [NSURL URLWithString:_Daydetilmodel.cimg]  placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(1)"]];
                
                _dayDetileArr = [NSMutableArray arrayWithArray:objects];
                
                [_tableview.header endRefreshing];
                [_tableview.footer endRefreshing];
                [_tableview reloadData];
            
                }
            else{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [_tableview.header endRefreshing];
                [_tableview.footer endRefreshing];
                [MBProgressHUD showError:@"服务器繁忙"];
            }
        }
        else
        {
             [MBProgressHUD hideHUDForView:self.view animated:YES];
             [MBProgressHUD showError:@"服务器繁忙"];
        }
    }];
    
}





-(void)CreateImageANDTableview{

    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, NAVI_HEIGHT, SCREEN_WIDTH, IMAGE_HEIGHT)];

    [self.view addSubview:_imageview];
    _tableview  = [[UITableView alloc]initWithFrame:CGRectMake(0, IMAGE_HEIGHT+64, SCREEN_WIDTH, screen_Height-IMAGE_HEIGHT-64)];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.showsVerticalScrollIndicator= NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
}
#pragma mark 实现协议方法
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (_dayDetileArr.count%3 == 0) {
        return _dayDetileArr.count/3;
    }else{
    
        return _dayDetileArr.count/3+1;
    }
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    JDLDayTuiJianTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLDayTuiJianTableViewCell" owner:self options:nil]lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.delegate =self;
    if (_dayDetileArr.count>0) {
        cell.model1 = _dayDetileArr[indexPath.row*3];
        if (indexPath.row*3+1 <_dayDetileArr.count) {
            cell.model2 = _dayDetileArr[indexPath.row * 3+1];
        }
        else{
            
            cell.model2 = nil;
        }
        if (indexPath.row*3+2 < _dayDetileArr.count) {
            cell.model3 = _dayDetileArr[indexPath.row *3 +2];
        }
        else{
            
            cell.model3 = nil;
        }
    }
    
    cell.selectionStyle=UITableViewCellAccessoryNone;
    //隐藏系统的分隔线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
//    UIView *v = [[UIView alloc]init];
//    v.frame = CGRectMake(0, 0, SCREEN_WIDTH, 1);
//    v.backgroundColor = [UIColor lightGrayColor];
//    [cell addSubview:v];
    return cell;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tabViewCellhigh(165, 165, 165);
}
//实现协议方法
-(void)sendDayDetileModel:(NSString *)model
{

    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:model];
    [self.navigationController pushViewController:buyVc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
