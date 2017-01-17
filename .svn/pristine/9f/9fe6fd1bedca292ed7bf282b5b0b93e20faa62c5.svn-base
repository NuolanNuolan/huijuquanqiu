//
//  JDLLogisticsViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/27.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLLogisticsViewController.h"
#import "JDLLogistTableViewCell.h"

@interface JDLLogisticsViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    //装物流title
    UIView *_view_title;
    //商品图片
    UIImageView *_image_SP;
    //三个lable
    UILabel *_lable_There;
    //是否签收lable
    UILabel *_lable_QianShou;
    //哪个快递
    UILabel *_lable_KuaiDi;
    //运单编号
    UILabel *_lable_DingdanHao;
    //物流表格
    UITableView *_tableview;
    
}

@end

@implementation JDLLogisticsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Dismiss];
//    dismiss_w;
    //创建物流状态表ti
    [self CreateTitle];
    //创建表格
    [self CreateTableview_wuliu];

   
    // Do any additional setup after loading the view.
}
-(void)Dismiss
{
    
    self.view.backgroundColor = [UIColor colorWithRed:234/255.0f green:234/255.0f blue:234/255.0f alpha:1];
    self.title = @"查看物流";
//    返回按钮
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    
}
-(void)createViewClick
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)CreateTitle
{
    _view_title = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screen_Height, 105)];
    _view_title.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    [self.view addSubview:_view_title];
    
    _image_SP = [[UIImageView alloc]initWithFrame:CGRectMake(28, 21, 90, 68)];
//    _image_SP.image = [UIImage imageNamed:@"pic(1)spspsppspspsps.png"];
    [_view_title addSubview:_image_SP];
    
    NSArray *_array = @[@"物流状态",@"承运来源",@"运单编号"];
    CGFloat with = 27;
    for(int i = 0; i < _array.count;i++){
    
        _lable_There = [[UILabel alloc]initWithFrame:CGRectMake(128, 21+i*with, 110, 14)];
        _lable_There.text = _array[i];
        _lable_There.font = [UIFont systemFontOfSize:13.0f];
        [_lable_There setTextColor:[UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1]];
        if (i == 0) {
             [_lable_There setTextColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1]];
            [_lable_There setFont:[UIFont fontWithName:@"Helvetica-Bold" size:13.0f]];
        }
        [_view_title addSubview:_lable_There];
    }
    //三个功能lable
    _lable_QianShou = [[UILabel alloc]initWithFrame:CGRectMake(191, 21, 158, 14)];
    _lable_QianShou.textColor = [UIColor colorWithRed:18/255.0f green:156/255.0f blue:5/255.0f alpha:1];
    _lable_QianShou.text = @"物流已签收";
     _lable_QianShou.font = [UIFont systemFontOfSize:13.0f];
    [_view_title addSubview:_lable_QianShou];
    
    _lable_KuaiDi = [[UILabel alloc]initWithFrame:CGRectMake(191, 48, 158, 14)];
    _lable_KuaiDi.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1];
    _lable_KuaiDi.text = @"申通快递";
    _lable_KuaiDi.font = [UIFont systemFontOfSize:12.0f];
    [_view_title addSubview:_lable_KuaiDi];
    
    
    _lable_DingdanHao = [[UILabel alloc]initWithFrame:CGRectMake(191, 75, 200, 14)];
    _lable_DingdanHao.textColor = [UIColor colorWithRed:102/255.0f green:102/255.0f blue:102/255.0f alpha:1];
    _lable_DingdanHao.text = @"3456765434567865";
    _lable_DingdanHao.font = [UIFont systemFontOfSize:12.0f];
    [_view_title addSubview:_lable_DingdanHao];
    
}
-(void)CreateTableview_wuliu
{

    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 114+64, screen_Width, screen_Height-114-64) style:UITableViewStyleGrouped];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    _tableview.showsVerticalScrollIndicator =NO;
//    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
}
//
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 5;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JDLLogistTableViewCell *cell1 = [[[NSBundle mainBundle]loadNibNamed:@"JDLLogistTableViewCell" owner:self options:nil]lastObject];
    cell1.lable_wuliu.text = @"浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省浙江省";
    //2.将UILabel设置为自动换行
    [cell1.lable_wuliu setNumberOfLines:0];
    cell1.imageView.image = [UIImage imageNamed:@"icon_tetragonum_pre"];
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell1;
    

    
}
//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 110;
}
//头视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 49;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    UIView *view =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Height, 49)];
    view.backgroundColor = [UIColor clearColor];
    
    UILabel * lable_ = [[UILabel alloc]initWithFrame:CGRectMake(20, 23, 110, 26)];
    lable_.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    lable_.text = @"物流信息";
    lable_.font = [UIFont systemFontOfSize:13.0f];
    
    [view addSubview:lable_];
    
    return view;
}

//尾视图高度
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.1;
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
