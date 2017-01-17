//
//  JDLActivityViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/5.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLActivityViewController.h"
#import "JDLActivityTableViewCell.h"

@interface JDLActivityViewController ()<UITableViewDataSource,UITableViewDelegate>
{

    NSString * _title;
    UITableView *_tableview;
}

@end

@implementation JDLActivityViewController
//初始化方法传入title
- (id)initWith_title:(NSString *)title
{
    
    self = [super init];
    if (self) {
        
        _title =title;
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    dismiss_w;
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self Dismiss];
    [self Createtableview];
}
#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    self.title = _title;
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}


-(void)createViewClick
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
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
    
    
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    static NSString *ID = @"Cell";
    JDLActivityTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
    if(!cell)
    {
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLActivityTableViewCell" owner:self options:nil]lastObject];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.Act_view.layer.masksToBounds =YES;
    cell.Act_view.layer.cornerRadius =5.0f;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 314;
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
