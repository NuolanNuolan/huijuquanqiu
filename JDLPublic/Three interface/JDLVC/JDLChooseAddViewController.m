//
//  JDLChooseAddViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/5.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLChooseAddViewController.h"
#import "AddrListViewController.h"
#import "Address.h"
#import "JDLBuyDetileViewController.h"

@interface JDLChooseAddViewController ()<UITableViewDelegate,UITableViewDataSource>
{

    NSMutableArray *_addrDataArr;
    Address *_tenModel;
    
    //用户ID
    NSString *_ID;
    //显示未收货地址imageview
    UIImageView *_imageview;
    //表格
    UITableView *_tableview;
    
    
    NSDictionary *addDic;
    NSArray *addArr;
}
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation JDLChooseAddViewController
-(void)viewWillAppear:(BOOL)animated{
    
    //	[self.tabBarController.tabBar setHidden:YES];
    [self loaddata];
    
  

}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.automaticallyAdjustsScrollViewInsets = NO;
    [self Dismiss];
    [self Createtableview];
    [self loaddata];
}
#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    self.title = @"选择收货地址";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];    
    
    UIBarButtonItem *rightitem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(Address)];
    [rightitem setTintColor:[UIColor blackColor]];
    self.navigationItem.rightBarButtonItem =rightitem;
}

-(void)Address
{
    //将我们的storyBoard实例化，“Main”为StoryBoard的名称
    UIStoryboard *mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    //将第二个控制器实例化，"SecondViewController"为我们设置的控制器的ID
    AddrListViewController *secondViewController = [mainStoryBoard instantiateViewControllerWithIdentifier:@"Addlist"];
    //跳转事件
    [self.navigationController pushViewController:secondViewController animated:YES];
    
}
-(void)createViewClick
{
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark 创建表格
-(void)Createtableview
{
    
    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, screen_Height-64)style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //透出背景,设置表格无颜色
    _tableview.backgroundColor = [UIColor clearColor];
    _tableview.showsVerticalScrollIndicator =NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return _addrDataArr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    UITableViewCell* cell = nil;
    static NSString* addrInfoStr = @"AddrListTableViewCell";
    cell = [tableView dequeueReusableCellWithIdentifier:addrInfoStr];
    if (!cell) {
        UINib *nib = [UINib nibWithNibName:addrInfoStr bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:addrInfoStr];
        cell = [tableView dequeueReusableCellWithIdentifier:addrInfoStr];
        
    }
    _tenModel = [_addrDataArr objectAtIndex:indexPath.row];
    UILabel* nameLbl = [cell viewWithTag:1];
    nameLbl.text = _tenModel.name;
    UILabel* telphoneLbl = [cell viewWithTag:2];
    telphoneLbl.text = _tenModel.tel;
    UILabel* detailAddrLbl = [cell viewWithTag:3];
    detailAddrLbl.text =  [_tenModel.area stringByAppendingString: _tenModel.address];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
            return 70;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   

    _tenModel = [_addrDataArr objectAtIndex:indexPath.row];
//
//    NSDictionary *dic =[[NSDictionary alloc]init];
//    NSArray *arr = [[NSArray alloc]init];
//    for (NSDictionary *dicr in _tenModel) {
//        
//    }
//
     NSDictionary *dic_add = [[NSDictionary alloc]initWithObjectsAndKeys:_tenModel.name,@"name",
                              _tenModel.tel,@"tel",
                              _tenModel.area,@"area",
                              _tenModel.address,@"address", nil];
    
    
    [[NSUserDefaults standardUserDefaults]setObject:dic_add forKey:@"ADDRESS"];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
//load data
-(void)loaddata
{
    
    [Address getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        [MBProgressHUD  showMessage:@"加载中"];
        if(error==nil){
            [MBProgressHUD  hideHUD];
            if(objects.count!=0){
                   _imageview.hidden=YES;
                [_imageview removeFromSuperview];
                _addrDataArr = [NSMutableArray arrayWithArray:objects];
                
                
              
                dispatch_async(dispatch_get_main_queue(), ^{
                    [_tableview reloadData];
                });
               
            }
            else
            {
                [MBProgressHUD  hideHUD];
                _addrDataArr=nil;
                if (_imageview) {
                    
                     [_imageview removeFromSuperview];
                }
                _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(screen_Width/2-100, screen_Height/2-75, 200, 75)];
                _imageview.image = [UIImage imageNamed:@"pic_noting"];
                [self.view addSubview:_imageview];
            }
            dispatch_async(dispatch_get_main_queue(), ^{
                [_tableview reloadData];
            });
        }
        
        else{
             [MBProgressHUD showError:@"服务器繁忙,请稍后再试哦"];
        }
        
    } ];

}
@end
