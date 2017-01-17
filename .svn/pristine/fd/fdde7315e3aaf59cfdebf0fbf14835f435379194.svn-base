//
//  JDLSearchDetileViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/28.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLSearchDetileViewController.h"
#import "JDLHomeViewController.h"
#import "JDLBuyViewController.h"
#import "JDLDetileSearchTableViewCell.h"
#import "JDLSearchDetileTableViewCell.h"
@interface JDLSearchDetileViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
{

    //标题下的横线
    UIView *_xianView;
    UIButton *_titlebtn;
    UIView *_view_button;
    UIButton *_btn_Hot;
    UIButton *_btn_New;
    UIButton *_btn_TeHui;
    
    //创建滚动视图
    UIScrollView  * _Scrollview_Search;
    
    UITableView * _Tableview_Search;
}
@property(nonatomic,strong)UIButton *selectdBtn;
@end

@implementation JDLSearchDetileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = NO;
    [self createNavLeftItem];
//    dismiss_w;
    [self CreateButton];
    [self CreareScrollView];
}
#pragma mark - 设置左边返回按钮
-(void)createNavLeftItem{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    
}

-(void)createViewClick{
    self.navigationController.navigationBarHidden = YES;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark -  创建3个按钮热卖单品特惠
-(void)CreateButton
{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, VIEW_HEIGHT)];
    [self.view addSubview:bgview];
    
    NSArray *titleArray = @[@"综合排序",@"销量优先",@"信用排序"];
    CGFloat with = screen_Width/3;
    
    for(int i = 0; i < titleArray.count;i++){
        
        _titlebtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _titlebtn.frame = CGRectMake(i*with, 0, with, VIEW_HEIGHT-2);
        [_titlebtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [_titlebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_titlebtn addTarget:self action:@selector(butVlick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [_titlebtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            [self butVlick:_titlebtn];
        }
        
        _titlebtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        _titlebtn.tag = 200+i;
        [bgview addSubview:_titlebtn];
    }
    _xianView = [[UIView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT-2, with, 2)];
    _xianView.backgroundColor = [UIColor orangeColor];
    [bgview addSubview:_xianView];
}


- (void)butVlick:(UIButton *)btn{
    [self changedBtnColor:btn];
    NSInteger i = btn.tag;
    CGFloat x = i *screen_Width;
    _Scrollview_Search.contentOffset = CGPointMake(x, 0);
    
    [UIView animateWithDuration:0.05f animations:^{
        CGRect rc = _xianView.frame;
        _xianView.frame = CGRectMake(rc.size.width*(btn.tag-200), rc.origin.y, rc.size.width, rc.size.height);
        [_Scrollview_Search setContentOffset:CGPointMake(SCREEN_WIDTH*(btn.tag-200), 0)];
        //    [_titleScrollView setContentOffset:CGPointMake((_btnTitle.tag-100)*_titleScrollView.bounds.size.width, 0)animated:NO];
    }];
    
}

-(void)changedBtnColor:(UIButton *)btn{
    [self.selectdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.selectdBtn = btn;
}


#pragma mark - 创建scrollView
-(void)CreareScrollView
{
    _Scrollview_Search = [[UIScrollView alloc]initWithFrame:CGRectMake(0, VIEW_HEIGHT+64, SCREEN_WIDTH, screen_Height-VIEW_HEIGHT)];
    _Scrollview_Search.contentSize =  CGSizeMake(SCREEN_WIDTH*3, 0);
    _Scrollview_Search.pagingEnabled = YES;
    _Scrollview_Search.delegate = self;
    _Scrollview_Search.bounces = NO;
    _Scrollview_Search.tag=3000;
    _Scrollview_Search.showsHorizontalScrollIndicator = NO;
    _Scrollview_Search.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_Scrollview_Search];
    
    //在滚动上添加tableview
    [self Createtableview];
    
}

#pragma mark - ScrollView的代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag==3000) {
        CGRect rc = _xianView.frame;
        _xianView.frame = CGRectMake(rc.size.width*_Scrollview_Search.contentOffset.x/SCREEN_WIDTH, rc.origin.y, rc.size.width, rc.size.height);
        [UIView animateWithDuration:0.2 animations:^{
            NSInteger count = scrollView.contentOffset.x/scrollView.frame.size.width;
            UIButton *btn = (UIButton *)[self.view viewWithTag:count+200];
            
            [self changedBtnColor:btn];
        }];
        
    }
}


-(void)Createtableview
{
    
    for (int i=0; i<3; i++) {
        _Tableview_Search = [[UITableView alloc]initWithFrame:CGRectMake(screen_Width*i, 0, screen_Width, screen_Height-VIEW_HEIGHT-64)style:UITableViewStylePlain];
        _Tableview_Search.backgroundColor = [UIColor clearColor];
//        _Tableview_Search.separatorStyle = UITableViewCellSeparatorStyleNone;
        _Tableview_Search.delegate = self;
        _Tableview_Search.dataSource = self;
        _Tableview_Search.showsVerticalScrollIndicator= NO;
        [_Scrollview_Search addSubview:_Tableview_Search];
    }
}
#pragma mark 实现协议方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]init];
    [self.navigationController pushViewController:buyVc animated:YES];
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"CellName";
    JDLDetileSearchTableViewCell *searchCell =  [tableView dequeueReusableCellWithIdentifier:ID];
    
    if(searchCell == nil)
    {
        searchCell = [[[NSBundle mainBundle]loadNibNamed:@"JDLDetileSearchTableViewCell" owner:self options:nil]lastObject];
    }
    
    searchCell.selectionStyle=UITableViewCellAccessoryNone;
    //隐藏系统的分隔线
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    return searchCell;
    
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (SCREEN_WIDTH==iphone4_width) {
        return  110.0f;
    }
    else if (SCREEN_WIDTH==iphone6_width)
    {
        return 110.0f;
    }
    else{
        
        return 110;
        
    }
    
    
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
