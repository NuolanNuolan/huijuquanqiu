//
//  MainContainerViewController.m
//  SlideNavigate
//
//  Created by 牛严 on 15/9/21.
//  Copyright (c) 2015年 牛严. All rights reserved.
//

#import "MainContainerViewController.h"
#import "CategoryLabel.h"
#import "JDLAllShopDetileModel.h"
#import "JDLAllTwoViewController.h"
#import "JDLBuyViewController.h"
#define ScreenWidth         [UIScreen mainScreen].bounds.size.width

@interface MainContainerViewController ()
{

    //    热卖数组
    NSMutableArray *_allShop_hot;
    //新品
    NSMutableArray *_allshop_new;
    //特惠
    NSMutableArray*_allshop_te;
    NSString *_str;
}
@property (strong, nonatomic) NSArray *categories;
@property (strong,nonatomic)JDLAllTwoViewController *NVC;

@end

@implementation MainContainerViewController
//页面布局
#pragma mark -  页面基本属性
-(void)CreateController{
    
    self.view.backgroundColor = [UIColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1];
    self.navigationItem.title = _navTitle_AllShop;
    //左边返回
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];}
//按钮返回事件
-(void)createViewClick
{
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark Private Methods
//模拟数据
- (void)simulateData{
    self.categories = [[NSArray alloc]initWithObjects:@"热卖",@"新品",@"特惠", nil];
    //加载网络数据
    [self loadData];
}
-(void)loadData{
    [MBProgressHUD showMessage:@"加载中" toView:self.view];
    NSString *str = [NSString stringWithFormat:@"c1_name='%@'",_navTitle_AllShop];
    NSDictionary *dic = @{@"where":str};
    [JDLAllShopDetileModel getObjectsWithParams:dic completion:^(NSArray *objects, NSError *error) {
        if (error == nil) {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            if (objects) {
                _allShop_hot = [[NSMutableArray alloc]initWithCapacity:0];
                _allshop_new = [[NSMutableArray alloc]initWithCapacity:0];
                _allshop_te = [[NSMutableArray alloc]initWithCapacity:0];
                for (JDLAllShopDetileModel *Puble_model in objects) {
                    _str = Puble_model.type;
                    if ([_str isEqualToString:@"H"]) {
                        
                        [_allShop_hot addObject:Puble_model];
                        
                    }else if ([_str isEqualToString:@"N"])
                    {
                        
                        [_allshop_new addObject:Puble_model];
                        
                    }
                    else if ([_str isEqualToString:@"T"])
                    {
                        
                        [_allshop_te addObject:Puble_model];
                    }
                    
                }

                [self addChildViewController];
                [self loadSubViews];
                
            }else{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                [MBProgressHUD showError:@"服务器繁忙"];
            }
        }
    }];
    
}
//添加子视图控制器
- (void)addChildViewController{
    for(int i=0 ; i<self.categories.count; i++)
    {
        //循环创建子vc
        JDLAllTwoViewController *mvc = [[JDLAllTwoViewController alloc]init];
        mvc.delegate =self;
        //传给下面的子vc标识，根据该标示做请求，获取数据
        if (i==0) {
            mvc.shop_arr =_allShop_hot;
        }else if (i==1)
        {
        
             mvc.shop_arr =_allshop_new;
        }
        else if (i==2)
        {
        
            mvc.shop_arr =_allshop_te;
            
        }
        [self addChildViewController:mvc];
    }
}

//添加上方标签
- (void)addNavigateLable{
    for (int i = 0; i < self.categories.count; i++) {
        CGFloat lblW = [UIScreen mainScreen].bounds.size.width/3;
        CGFloat lblX = i * [UIScreen mainScreen].bounds.size.width/3 ;
        CategoryLabel *lbl1 = [[CategoryLabel alloc]init];
        lbl1.content = [self.categories objectAtIndex:i];
        lbl1.frame = CGRectMake(lblX, 0 , lblW, self.smallScrollView.frame.size.height);
        lbl1.tag = i;
        [self.smallScrollView addSubview:lbl1];
        [lbl1 addGestureRecognizer:[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(lblClick:)]];
        self.smallScrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width/3 * (i+1) , 0);
    }
}

//标题栏label的点击事件
- (void)lblClick:(UITapGestureRecognizer *)recognizer{
    CategoryLabel *titlelable = (CategoryLabel *)recognizer.view;
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
    JDLAllTwoViewController *mvc = [self.childViewControllers firstObject];
    mvc.view.frame = self.bigScrollView.bounds;
    [self.bigScrollView addSubview:mvc.view];
    CategoryLabel *lable = [self.smallScrollView.subviews firstObject];
    lable.scale = 1.0;
}

#pragma mark UIView Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self simulateData];
    [self CreateController];
    
}

#pragma mark - UIScrollView Delegat Methods
//滚动结束后调用（setContentOffset代码导致）
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    // 获得索引
    NSUInteger index = scrollView.contentOffset.x / self.bigScrollView.frame.size.width;
    // 滚动标题栏
    CategoryLabel *titleLable = (CategoryLabel *)self.smallScrollView.subviews[index];
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
            CategoryLabel *temlabel = self.smallScrollView.subviews[idx];
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
    CategoryLabel *labelLeft = self.smallScrollView.subviews[leftIndex];
    labelLeft.scale = scaleLeft;
    // 考虑到最后一个板块，如果右边已经没有板块了 就不在下面赋值scale了
    if (rightIndex < self.smallScrollView.subviews.count) {
        CategoryLabel *labelRight = self.smallScrollView.subviews[rightIndex];
        labelRight.scale = scaleRight;
    }
}
- (void)pushbuyview:(NSString *)allmodel_pid
{

    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:allmodel_pid];
    [self.navigationController pushViewController:buyVc animated:YES];
    
}
//滚动结束（手势导致）
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}

@end
