//
//  MainContainer_pubViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/7/13.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "MainContainer_publicViewController.h"
#import "CategoryLabel_pub.h"
#import "JDLpub_oneViewController.h"
#import "JDLPublicModel.h"
#import "JDLChinaDetileModel.h"
#import "JDLInternstionDetileModel.h"
#import "JDLDayTJModel.h"
#define ScreenWidth         [UIScreen mainScreen].bounds.size.width

@interface MainContainer_publicViewController ()<JDLTJshop_Scrllowdelegate>
{

    //model
    JDLDayTJModel *JDLTJmodel;
    //条件
    NSDictionary *_dic_Arr;
    //全部数据数组
    NSMutableArray *_Data_array;
    //筛选的name
    NSString *str_title;
    //介绍图片URL
    NSString *str_imageviewurl;
    //请求回来的所有标题数组
    NSMutableArray *_titleArray;
    //筛选过后的数组
    NSArray *_arr_title;
    //显示数据临时数组
    NSMutableArray *_TJ_arr;
}
//@property (strong, nonatomic) NSArray *categories;
@property (strong,nonatomic)JDLpub_oneViewController *NVC;

@end

@implementation MainContainer_publicViewController

#pragma mark Private Methods
//页面布局
#pragma mark -  页面基本属性
-(void)CreateController{
    
    self.view.backgroundColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
    self.navigationItem.title = _navTitle;
    //左边返回
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}
//按钮返回事件
-(void)createViewClick
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
//模拟数据
-(void)simulateData
{
    NSLog(@"%@",_city_id);
    // 汇聚精选
    if ([_prID isEqualToString:@"PR"]||[_prID isEqualToString:@"C1"]||[_prID isEqualToString:@"C2"]||[_prID isEqualToString:@"PR2"]||[_prID isEqualToString:@"CTRY"]||[_prID isEqualToString:@"PR1"]) {
        NSString *str = [NSString stringWithFormat:@"type='%@'",_prID];
        _dic_Arr = @{@"where":str};
        [MBProgressHUD showMessage:@"加载中" toView:self.view];
        [JDLPublicModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
            if (error == nil) {
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                if (objects) {
                    
                    _Data_array = [NSMutableArray arrayWithArray:objects];
                    for (JDLPublicModel *Puble_model in objects) {
                        if ([_prID isEqualToString:@"PR"]||[_prID isEqualToString:@"C1"]||[_prID isEqualToString:@"C2"]||[_prID isEqualToString:@"PR2"]) {
                            str_title = Puble_model.cname;
                            str_imageviewurl = Puble_model.cimg;
                            [_titleArray addObject:str_title];
                            
                        }else if ([_prID isEqualToString:@"CTRY"]||[_prID isEqualToString:@"PR1"])
                        {
                            
                            str_title = Puble_model.prname;
                            str_imageviewurl = Puble_model.cimg;
                            [_titleArray addObject:str_title];
                        }
                        
                    }
                    [_imageview_fengmian sd_setImageWithURL:[NSURL URLWithString:str_imageviewurl]placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(1)"]];
                    NSSet *set = [NSSet setWithArray:_titleArray];
                    _arr_title = [set allObjects];
                    
                    [self addChildViewController];
                    [self loadSubViews];
                    
                }else{
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showError:@"服务器繁忙"];
                    MYLOG(@"%@",error);
                }
            }
        }];
    }
    //    中国制造
    //    NSString *str = _cy_id;
    else if ([_city_id isEqualToString:@"0086"]){
        MYLOG(@"aaaaaaaa%@",_city_id);
        NSString *str = [NSString stringWithFormat:@"prid='%@'",_prID];
        _dic_Arr = @{@"where":str};
        [MBProgressHUD showMessage:@"加载中" toView:self.view];
        [JDLChinaDetileModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
            if (error == nil) {
                if (objects) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    _Data_array = [NSMutableArray arrayWithArray:objects];
                    for (JDLChinaDetileModel *chinaModel in objects) {
                        str_title = chinaModel.cname;
                        str_imageviewurl = chinaModel.img;
                        [_titleArray addObject:str_title];
                    }
                    [_imageview_fengmian sd_setImageWithURL:[NSURL URLWithString:str_imageviewurl]placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(1)"]];
                    NSSet *set = [NSSet setWithArray:_titleArray];
                    _arr_title = [set allObjects];
                    
                    [self addChildViewController];
                    [self loadSubViews];
                }
                else{
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showError:@"服务器繁忙"];
                    
                }
            }
            
        }];
    }
    //    国家馆
    else if ([_city_id isEqualToString:@"0087"]){
        MYLOG(@"aaaaaaaa%@",_city_id);
        NSString *str = [NSString stringWithFormat:@"cyid='%@'",_prID];
        _dic_Arr = @{@"where":str};
        [MBProgressHUD showMessage:@"加载中" toView:self.view];
        [JDLInternstionDetileModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
            if (error == nil) {
                if (objects) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    _Data_array = [NSMutableArray arrayWithArray:objects];
                    for (JDLInternstionDetileModel *internstionModel in objects) {
                        str_title = internstionModel.prname;
                        str_imageviewurl = internstionModel.img;
                        [_titleArray addObject:str_title];
                    }
                    [_imageview_fengmian sd_setImageWithURL:[NSURL URLWithString:str_imageviewurl]placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(1)"]];
                    NSSet *set = [NSSet setWithArray:_titleArray];
                    _arr_title = [set allObjects];
                    
                    [self addChildViewController];
                    [self loadSubViews];
                }
                else{
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showError:@"服务器繁忙"];
                    
                }
            }
            
        }];
    }
    
    else
    {
        //        品牌推荐
        NSString *str = [NSString stringWithFormat:@"bid='%@'or prid='65'",_prID];
        _dic_Arr = @{@"where":str};
        [MBProgressHUD showMessage:@"加载中" toView:self.view];
        [JDLDayTJModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
            if (error == nil) {
                
                if (objects) {
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    _Data_array = [NSMutableArray arrayWithArray:objects];
                    for (JDLDayTJModel *DayTJ_model in objects) {
                        str_title = DayTJ_model.cname;
                        str_imageviewurl = DayTJ_model.cimg;
                        [_titleArray addObject:str_title];
                    }
                    
                    //取出封面图片
                    [_imageview_fengmian sd_setImageWithURL:[NSURL URLWithString:str_imageviewurl]placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(1)"]];
                    
                    //去除数组相同元素
                    NSSet *set = [NSSet setWithArray:_titleArray];
                    _arr_title = [set allObjects];
                    [self addChildViewController];
                    [self loadSubViews];
                }

                else{
                    [MBProgressHUD hideHUDForView:self.view animated:YES];
                    [MBProgressHUD showError:@"服务器繁忙"];
                }
            }
         
        }];
    }
}

//添加子视图控制器
- (void)addChildViewController{
    
    for(int i=0 ; i<_arr_title.count; i++)
    {
        //循环创建子vc
        JDLpub_oneViewController *mvc = [[JDLpub_oneViewController alloc]init];
        //传给下面的子vc标识，根据该标示做请求，获取数据
//        mvc.delegate=self;
        _TJ_arr = [[NSMutableArray alloc]initWithCapacity:0];
        NSString *title_text = [_arr_title objectAtIndex:i];
        for(int j =0;j<_Data_array.count;j++)
        {
            JDLTJmodel =  [_Data_array objectAtIndex:j];
            if([title_text isEqualToString:JDLTJmodel.cname])
            {
                 [_TJ_arr addObject:JDLTJmodel];
            }
        }
        mvc.TJ_arr =_TJ_arr;
        [self addChildViewController:mvc];
    }
}

//添加上方标签
- (void)addNavigateLable{
    for (int i = 0; i < _arr_title.count; i++) {
        CGFloat lblW = screen_Width/5;
        CGFloat lblX = i * lblW ;
        CategoryLabel_pub *lbl1 = [[CategoryLabel_pub alloc]init];

        lbl1.content = [_arr_title objectAtIndex:i];;
        lbl1.frame = CGRectMake(lblX, 0 , lblW, self.smallScrollView.frame.size.height);
        lbl1.tag = i;
        [self.smallScrollView addSubview:lbl1];
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
        self.smallScrollView.contentSize = CGSizeMake(screen_Width/5 * (i+1) , 0);
    }
}

//标题栏label的点击事件
- (void)lblClick:(UITapGestureRecognizer *)recognizer{
    CategoryLabel_pub *titlelable = (CategoryLabel_pub *)recognizer.view;
    CGFloat offsetX = titlelable.tag * self.bigScrollView.frame.size.width;
    CGFloat offsetY = self.bigScrollView.contentOffset.y;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.bigScrollView setContentOffset:offset animated:YES];
}

//加载页面
- (void)loadSubViews{
    [self addNavigateLable];
    CGFloat contentX = self.childViewControllers.count * ScreenWidth;
    self.bigScrollView.contentSize = CGSizeMake(contentX, 0);
    //设置默认状态控制器
    JDLpub_oneViewController *mvc = [self.childViewControllers firstObject];
    mvc.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:mvc.view];
    CategoryLabel_pub *lable = [self.smallScrollView.subviews firstObject];
    lable.scale = 1.0;
}

#pragma mark UIView Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _titleArray = [[NSMutableArray alloc]init];
    [self simulateData];
    [self CreateController];
}

#pragma mark - UIScrollView Delegat Methods
//滚动结束后调用（setContentOffset代码导致）
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScrollView.frame.size.width;
    // 滚动标题栏
    CategoryLabel_pub *titleLable = (CategoryLabel_pub *)self.smallScrollView.subviews[index];
    CGFloat offsetx = titleLable.center.x - self.smallScrollView.frame.size.width * 0.5;
    CGFloat offsetMax = self.smallScrollView.contentSize.width - self.smallScrollView.frame.size.width;
    if (offsetx < 0) {
        offsetx = 0;
    }else if (offsetx > offsetMax){
        offsetx = offsetMax;
    }
    CGPoint offset = CGPointMake(offsetx, self.smallScrollView.contentOffset.y);
    [self.smallScrollView setContentOffset:offset animated:YES];
    // 添加控制器
    self.NVC = self.childViewControllers[index];
    //两页面所经过的标签setScale动画
    [self.smallScrollView.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if (idx != index) {
            CategoryLabel_pub *temlabel = self.smallScrollView.subviews[idx];
            temlabel.scale = 0.0;
        }
    }];
    //如果nvc已经存在了，不作处理
    if (self.NVC.view.superview) return;
    self.NVC.view.frame = scrollView.bounds;
    [self.bigScrollView addSubview:self.NVC.view];
}

//正在滚动
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    // 取出绝对值 避免最左边往右拉时形变超过1
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.frame.size.width);
    NSUInteger leftIndex = (int)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat scaleRight = value - leftIndex;
    CGFloat scaleLeft = 1 - scaleRight;
    CategoryLabel_pub *labelLeft = self.smallScrollView.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.smallScrollView.subviews.count) {
        CategoryLabel_pub *labelRight = self.smallScrollView.subviews[rightIndex];
        labelRight.scale = scaleRight;
    }
}

//滚动结束（手势导致）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
//协议方法
-(void)Scrow_delegate:(CGFloat)y
{

    [self.smallScrollView setFrame:CGRectMake(0, 200+64-y, screen_Width, 40)];
    [self.view addSubview:self.smallScrollView];
    [self.bigScrollView setFrame:CGRectMake(0, 200+64+40-y, screen_Width, screen_Height+y)];
     [self.view addSubview:self.bigScrollView];
    if(y>=200)
    {
    
        [self.smallScrollView setFrame:CGRectMake(0, 64, screen_Width, 40)];
       
    }
    if (y<=0) {
        
        [self.smallScrollView setFrame:CGRectMake(0, 264, screen_Width, 40)];
    }
}
@end
