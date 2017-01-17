//
//  JDLHotViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/30.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLHotViewController.h"
//#import "Masonry.h"
#import "JDLHotTablViewCell.h"
#import "JDLBuyViewController.h"
#import "JDLHotSecondModel.h"


@interface JDLHotViewController ()<UITableViewDelegate,UITableViewDataSource,UIGestureRecognizerDelegate,JDLHotQiangdelegate>
{

    JDLHotSecondModel *hotmodel;
    //传入ID；
    NSString *_hot_id;
    UITableView * _tableview;
    JDLHotSecondModel *_hotSecondModel;
//    装载数据的数组
    NSMutableArray *_hotSecondArr;
}
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation JDLHotViewController
- (id)initWith_Hot_ID:(NSString *)Hot_ID
{

    self = [super init];
    if (self) {
        _hot_id =Hot_ID;
    }
    return self;
    
}
- (void)viewDidLoad {
    MYLOG(@"%@",_hot_id);
    [super viewDidLoad];
    [self loadData];
//    dismiss_w;
    //页面基本属性
    [self CreateController];
    //表格
    [self CreateTable];
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;

    //上啦下拉
    [self creatRefresh];
}


-(void)viewWillAppear:(BOOL)animated{
    
//    //	[self.tabBarController.tabBar setHidden:YES];
}

#pragma mark -  页面基本属性
-(void)CreateController{
    
    self.view.backgroundColor=  [UIColor whiteColor];
    self.title = @"热卖单品";
    //左边返回
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}
-(void)createViewClick
{
//    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)loadData{
    NSString *str = [NSString stringWithFormat:@"hid='%@'",_hot_id];
     NSDictionary *  _dic_Arr = @{@"where":str};
    [JDLHotSecondModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
        
        if(error==nil){
            if(objects){
                _hotSecondArr =[NSMutableArray arrayWithArray:objects];
                [_tableview.header endRefreshing];
                [_tableview.footer endRefreshing];
                [_tableview reloadData];
                
            }
            else{
                [_tableview.header endRefreshing];
                [_tableview.footer endRefreshing];
                
            }
        }else
        {
        
            [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
        }
    }];
    
}



#pragma mark - 表格
-(void)CreateTable
{
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, screen_Height)];
    _tableview.backgroundColor=[UIColor clearColor];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.showsVerticalScrollIndicator = NO;
//    [_tableview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.view.mas_left).offset(0);//和父view的左边间距为0;
//        make.bottom.equalTo(self.view.mas_bottom).offset(0);//和父view的底部间距为0;
//        make.height.mas_equalTo(screen_Height);//高度为整个屏幕的高度
//    }];
    [self.view addSubview:_tableview];
}
#pragma mark - 布局

#pragma mark 实现协议方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    hotmodel =    _hotSecondArr[indexPath.row];
    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:hotmodel.pid];
    [self.navigationController pushViewController:buyVc animated:YES];
}
-(void)Qiang_btn:(NSString *)model
{

    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:model];
    [self.navigationController pushViewController:buyVc animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _hotSecondArr.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"Cell";
    JDLHotTablViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(cell == nil)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLHotTablViewCell" owner:self options:nil]lastObject];
    }
    cell.delegate =self;
    if (_hotSecondArr.count > 0) {
        cell.hotSecondModel = _hotSecondArr[indexPath.row];
    }
//    cell.button_MSQ.layer.masksToBounds=YES;
//    cell.button_MSQ.layer.cornerRadius = 6.0;
    //原价的删除线效果
    NSUInteger length = [cell.originalPriceLab.text length];
    NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:cell.originalPriceLab.text];
    [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
    [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, length)];
    [cell.originalPriceLab setAttributedText:attri];
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle=UITableViewCellAccessoryNone;
    //隐藏系统的分隔线
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;

    UIView *v = [[UIView alloc]init];
    v.frame = CGRectMake(115, 0, SCREEN_WIDTH, 1);
    v.backgroundColor = [UIColor lightGrayColor];
    [cell addSubview:v];
    return cell;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(screen_Width==iphone6_width)
    {
    
        return 115;
    }
    return screen_Height/5;
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
    if (_hotSecondArr.count > 0) {
        [_hotSecondArr removeAllObjects];
    }
    [self loadData];
}

//  上拉加载
-(void)footerRereshing{
    MYLOG(@"上拉加载事件");
    [self loadData];
}

@end
