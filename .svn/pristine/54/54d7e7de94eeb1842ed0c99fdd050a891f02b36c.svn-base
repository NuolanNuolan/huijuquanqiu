//
//  JDLMessageViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/4.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLMessageViewController.h"
#import "JDLMessageTableViewCell.h"
#import "JDLNotification_messageViewController.h"
#import "JDLActivityViewController.h"
#import "JDLLogistiViewController.h"

@interface JDLMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    //表格
    UITableView *_tableview;
    //图片数组
    NSArray *_array_image;
    //消息数组
    NSArray *_array_mess;
    
}

@end

@implementation JDLMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self Dismiss];
//   dismiss_w;
    [self Createtableview];
    // Do any additional setup after loading the view.
}
#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    self.title = @"消息";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}


-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)Createtableview
{

    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 69, screen_Width, screen_Height)style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //透出背景,设置表格无颜色
    _tableview.backgroundColor = [UIColor clearColor];
    _tableview.showsVerticalScrollIndicator =NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _array_mess = @[@"通知消息",@"物流助手",@"活动中心"];
    _array_image = @[@"icon_notificationmessage",@"icon_logisticsassistant",@"icon_activitycentre"];
    [self.view addSubview:_tableview];
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    return _array_mess.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

//    static NSString *ID = @"Cell";
//    JDLMessageTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
//    if(!cell)
//    {
//        cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLMessageTableViewCell" owner:self options:nil]lastObject];
//    }
//    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    if (indexPath.row==0) {
//        cell.mes_imageview.image = [UIImage imageNamed:@"icon_notificationmessage"];
//        cell.mes_title.text= @"通知消息";
//    } else if(indexPath.row==1) {
//        
//        cell.mes_imageview.image = [UIImage imageNamed:@"icon_logisticsassistant"];
//        cell.mes_title.text= @"物流助手";
//    }else if(indexPath.row==2) {
//        
//        cell.mes_imageview.image = [UIImage imageNamed:@"icon_activitycentre"];
//        cell.mes_title.text= @"活动中心";
//    }
    JDLMessageTableViewCell *cell1 = [[[NSBundle mainBundle]loadNibNamed:@"JDLMessageTableViewCell" owner:self options:nil]lastObject];
    cell1.selectionStyle = UITableViewCellSelectionStyleNone;
    cell1.mes_title.text =_array_mess[indexPath.row];
    cell1.mes_imageview.image = [UIImage imageNamed:_array_image[indexPath.row]];
    UIView *vi = [[UIView alloc]init];
    vi.frame = CGRectMake(0, 0, screen_Width, 1);
    vi.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    [cell1 addSubview:vi];
    return cell1;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (indexPath.row==0) {
        JDLNotification_messageViewController *not = [[JDLNotification_messageViewController alloc]initWith_title:_array_mess[indexPath.row]];
        [self.navigationController pushViewController:not animated:YES];
       
    }else if (indexPath.row==1)
    {
        JDLLogistiViewController *logisti = [[JDLLogistiViewController alloc]initWith_title:_array_mess[indexPath.row]];
        [self.navigationController pushViewController:logisti animated:YES];
        

    }
    else if (indexPath.row==2)
    {
        
        JDLActivityViewController *act = [[JDLActivityViewController alloc]initWith_title:_array_mess[indexPath.row]];
        [self.navigationController pushViewController:act animated:YES];
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 80;
}
@end
