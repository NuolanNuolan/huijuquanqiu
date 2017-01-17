//
//  JDLBuyViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLBuyViewController.h"
#import "JDLpopupView.h"
#import "JDLTypeView.h"
#import "JDLBuyView.h"
#import "MJRefresh.h"
#import "UIView+Extension.h"
#import "JDLBuyOneTableViewCell.h"
#import "JDLBuyDetileViewController.h"
#import "JDLStoreViewController.h"
#import "JDLBuyModel.h"
#import "JDLCollectModel.h"
#import "JDLSureDetileModel.h"
#import "JDLSureCartModel.h"
#import "JDLDetileTwoTableViewCell.h"
#import "JDLDetileTwoModel.h"
#import "JDLDetileCollectionCell.h"
#import "JDLDetileColltionModel.h"
#import "JDLStoredeatail.h"
#import "JDLShoppingViewController.h"

@interface JDLBuyViewController ()<UITableViewDelegate,UITableViewDataSource,ZYBannerViewDataSource, ZYBannerViewDelegate,UICollectionViewDelegate,UICollectionViewDataSource,JDLTypeViewDelegete>
{
    //    轮播图
    UIScrollView *_topScrollView;
    JDLCollectModel *_collectModel;
    //颜色尺码
    NSString *color ;
    NSString *size ;
//    图片URL
    NSString *imageUrl;
    JDLBuyModel * buyModel;
//    购物车Model
    JDLSureCartModel *_cartModel;
    //店铺model
    JDLStoredeatail *_storemodel;
    //筛选条件;
    NSDictionary *_dic_Arr;
    //商品ID
    NSString * _sp_ID;
    UIView *_xianView;
    UIButton *_titlebtn;
    //表格text数组
    NSArray *dataArr;
    //是否收藏默认为0;
    NSInteger Sou_Tag ;
    //收藏按钮
    UIButton *souBtn;
    CGPoint center;
    //    弹出视图
    JDLpopupView *popView;
    //滚动视图
    UIImageView *_imageView_gun;
    //    商品详情BuyOne的数组
    NSMutableArray *_buyOne_Array;
    NSMutableArray *sizearr1;//未筛选型号数组
    //筛选后型号数组
    NSArray *sizearr;
    NSMutableArray *colorarr;//分类数组
    /**********/
    //最大字典
    //    NSMutableDictionary *dic_all_color_Ceshi;
    NSMutableDictionary *dic_all_allcolor_Ceshi;
    NSArray *arr_Ceshi1;
    //   NSMutableDictionary *dic_Ceshi1
    /**********/
    //商品URL数组
    NSMutableDictionary *sp_url;
    NSString *Kucun;//加入购物车库存量
    
//    商品详情商品推荐的数组
    NSMutableArray *_detile_ColltionArr;
    JDLDetileColltionModel *_DetileColltionmodel;
    NSDictionary *_TJshop_dic;
    //推荐商品数组
    NSMutableArray *_TJshop_arr;
    
//    商品详情的图文详情的数组
    NSMutableArray *tw_DetileArr;
    //图文详情图片数组
    NSMutableArray *tw_imageurl;
}
@property(nonatomic,strong)UIView *detileView;
@property(strong,nonatomic)UIScrollView *detileScrollView;
@property(strong,nonatomic)UITableView *detileTableView;
@property(nonatomic,strong)UITableView *detileTwoTab;
@property(nonatomic,strong)UIButton *selectdBtn;
@property(nonatomic,strong)UIWebView *TwoWebView;
@property(nonatomic,strong)UICollectionView *TwoColltionView;


//滑动相关
@property (nonatomic, strong) ZYBannerView *banner;
@property (nonatomic, strong) NSMutableArray *dataArray;
@property(nonatomic)NSUInteger length;
@end

@implementation JDLBuyViewController
//初始化方法传入title
- (id)initWith_SP_ID:(NSString *)sp_ID
{
    
    self = [super init];
    if (self) {
        _sp_ID =sp_ID;
    }
    return self;
}
-(void)viewWillAppear:(BOOL)animated{
    
    //	[self.tabBarController.tabBar setHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //	[self.tabBarController.tabBar setHidden:YES];
    //    ***********************************
    //    self.view.backgroundColor = [UIColor clearColor];
    
    [self loaddatago];
    
    dataArr = @[@"请选择颜色分类",@"商品评价"];
    
    [self addsubUIView];
    [self CreateBut];
    
    // 配置滑动图片
    
}
-(void)loaddatago
{
    
    _collectModel = [[JDLCollectModel alloc] init];
    NSString *str = [NSString stringWithFormat:@"pid='%@'",_sp_ID];
    MYLOG(@"%@",_sp_ID);
    _dic_Arr = @{@"where":str};
    [JDLCollectModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error) {
        if (error==nil) {
            if (objects.count>0) {
                
                _collectModel = [objects objectAtIndex:0];
                [self createNavbar];
                [souBtn setImage:[UIImage imageNamed:@"btn_collect_pre-1"] forState:UIControlStateNormal];
                souBtn.tag=0;
                [self loadData];
            }
            else
            {
                [self createNavbar];
                [souBtn setImage:[UIImage imageNamed:@"btn_collect"] forState:UIControlStateNormal];
                souBtn.tag=1;
                [self loadData];
            }
        }else
        {
            
            MYLOG(@"%@",error);
        }
        
        
    }];

    
}
-(void)loadData{
    
    
    
//    [MBProgressHUD showMessage:@"加载中" toView:self.view];
    [MBProgressHUD showMessage:@"加载中" toView:self.view];
    [JDLBuyModel getObjectWithId:_sp_ID completion:^(JDLBuyModel *object, NSError *error) {
        if(error==nil){
            if(object){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                buyModel = object;
                //数据请求成功后操作
                [self createArr];
                [self setupBanner];
                [self crateFefreshView];
                [self initChoseView];
                [_detileTableView reloadData];
                
            }
            else
            {
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
            }
        }
        else{
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            MYLOG(@"get list error=%@",error);
        }
    
    }];
    
}



-(void)createArr{
    
    //    sizearr = [[NSMutableArray alloc]initWithObjects:@"s",@"m",@"l", nil];
    //    colorarr = [[NSMutableArray alloc]initWithObjects:@"蓝色",@"红色",@"黑色", nil];
    //    if (!_dataArray) {
    //        _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    //        NSDictionary *dic_imageurl = [[NSDictionary alloc]init];
    //        //解析滚动图片
    //        for (int i =0; i<buyModel.product_imgsArr.count; i++) {
    //            dic_imageurl = buyModel.product_imgsArr[i];
    //            NSString *str_imageurl =  [dic_imageurl objectForKey:@"url"];
    //            [_dataArray addObject:str_imageurl];
    //        }
    //    }
    
    if (!sizearr1&&!colorarr)
    {
        
        sizearr1 = [[NSMutableArray alloc]initWithCapacity:0];
        colorarr  = [[NSMutableArray alloc]initWithCapacity:0];
        sp_url  = [[NSMutableDictionary alloc]initWithCapacity:0];
        
        dic_all_allcolor_Ceshi=[[NSMutableDictionary alloc]init];
        NSDictionary *dic_color = [[NSDictionary alloc]init];
        for (int i =0; i<buyModel.product_prop_imgsArr.count; i++) {
            //这是颜色
            dic_color = buyModel.product_prop_imgsArr[i];
            if (dic_color) {
                NSString *str_imageurl =  [dic_color objectForKey:@"props"];
                [colorarr addObject:str_imageurl];
                //颜色所对应的商品图片
               [ sp_url setValue:[dic_color objectForKey:@"url"] forKey:str_imageurl];
                
            }
            
            //这是尺码
            if (dic_color) {
                NSString *   str_imageurl =  [dic_color objectForKey:@"size"];
                NSArray *arr_ceshi =  [str_imageurl componentsSeparatedByString:@";"];
                NSMutableArray *arr_arr_arr = [NSMutableArray arrayWithArray:arr_ceshi];
                [arr_arr_arr removeLastObject];
                ///好像是这个参数的作用域的问题，不能声明成全局的变量，局部的就没问题
                NSMutableDictionary *dic_Ceshi1 = [[NSMutableDictionary alloc]init];
                if (i<=arr_arr_arr.count) {
                    for (int j=0; j<arr_arr_arr.count; j++) {
                        arr_Ceshi1 =   [[arr_arr_arr objectAtIndex:j]componentsSeparatedByString:@":"];
                        [dic_Ceshi1 setValue:[arr_Ceshi1 objectAtIndex:1] forKey:[arr_Ceshi1 objectAtIndex:0]];
                        [sizearr1 addObject:[arr_Ceshi1 objectAtIndex:0]];

                    }
                    
                    [dic_all_allcolor_Ceshi setObject:dic_Ceshi1 forKey:[colorarr objectAtIndex:i]];
                    for (int i=0; i<1; i++)
                    {
                        NSMutableDictionary*dic=[dic_all_allcolor_Ceshi objectForKey:[colorarr objectAtIndex:i]];
                        
                        for (int j=0; j<dic.allKeys.count; j++)
                        {
                            NSMutableDictionary*SizeDic=[NSMutableDictionary dictionaryWithCapacity:0];
                            NSString*Size=[dic.allKeys objectAtIndex:j];
                            for (int z=0; z<colorarr.count; z++)
                            {
                                [SizeDic setObject:[[dic_all_allcolor_Ceshi objectForKey:[colorarr objectAtIndex:z]] objectForKey:Size] forKey:[colorarr objectAtIndex:z]];
                            }
                            [dic_all_allcolor_Ceshi setObject:SizeDic forKey:[dic.allKeys objectAtIndex:j]];
                        }
                    }
                   
                }
                
            }

        }
        NSSet *set = [NSSet setWithArray:sizearr1];
        sizearr = [set allObjects];
        
    }
}
#pragma mark 图文详情请求
-(void)createTwoLoadData{
//商品详情的图文详情
    
// 商品详情的商品推荐及图文详情
    _detile_ColltionArr = [[NSMutableArray alloc]init];
    NSString *str = [NSString stringWithFormat:@"pid='%@'",_sp_ID];
    _dic_Arr = @{@"where":str};
    [JDLDetileColltionModel getObjectsWithParams:_dic_Arr completion:^(NSArray *objects, NSError *error){
        if(error==nil){
            if(objects>0){
                _detile_ColltionArr = [NSMutableArray arrayWithArray:objects];
                 _DetileColltionmodel = [_detile_ColltionArr objectAtIndex:0];
                [_detileTwoTab reloadData];
                [_TwoColltionView reloadData];
                //图文详情绑定
                if (_detile_ColltionArr) {
                    tw_imageurl = [[NSMutableArray alloc]initWithCapacity:0];
                    tw_imageurl =   _DetileColltionmodel.images_text;
                }
                NSString *imageurl = [[tw_imageurl objectAtIndex:0]objectForKey:@"img"];
                [self.TwoWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:imageurl]]];
                
            }
            else{
                
                [MBProgressHUD showError:@"网络错误" toView:self.view];
            }
        }
        else{
           [MBProgressHUD showError:@"网络错误" toView:self.view];
        }
    }];

}


-(void)CreateBut
{
    self.title = @"商品详情";
    //返回按钮
   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    //右上角购物车按钮
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(screen_Width-25, 0, 25, 25);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"btn_ShoppingCart"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"btn_ShoppingCart"] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(RightItem:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *right_btn = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem =right_btn;
    
    
}

-(void)createViewClick
{
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
-(void)RightItem:(UIButton *)btn
{
    
    MYLOG(@"进入自己购物车页面");
    
    JDLShoppingViewController *shopVc = [[JDLShoppingViewController alloc]initWith_title:@"购物车" andFootH:49 andBarHidden:YES];
  
    [self.navigationController pushViewController:shopVc animated:YES];
}


//整体界面
- (UIScrollView *)detileScrollView {
    if (!_detileScrollView) {
        _detileScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
        _detileScrollView.contentSize = CGSizeMake(screen_Width, (screen_Height) * 2);
        _detileScrollView.pagingEnabled = YES;
        _detileScrollView.scrollEnabled = NO;
    }
    return _detileScrollView;
}

//第一页
- (UITableView *)detileTableView {
    if (!_detileTableView) {
        _detileTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, screen_Width, screen_Height-98) style:UITableViewStyleGrouped];
        _detileTableView.delegate = self;
        _detileTableView.dataSource = self;
        _detileTableView.tag = 2000;
        _detileTableView.showsVerticalScrollIndicator =NO;
        self.automaticallyAdjustsScrollViewInsets = NO;
        //        [_detileTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewReuseIdentifier];
    }
    return _detileTableView;
}

//第二页
- (UIView *)detileView{
    if (!_detileView) {
        _detileView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.detileTableView.frame)+VIEW_HEIGHT+3, self.detileTableView.width, self.detileTableView.height)];
        _detileView.backgroundColor = [UIColor whiteColor];
    }
    return _detileView;
}

-(UIWebView *)TwoWebView{
    
    if (!_TwoWebView) {
        _TwoWebView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 128+VIEW_HEIGHT-64, self.detileTableView.width, self.detileTableView.height-58)];
        _TwoWebView.backgroundColor = [UIColor whiteColor];
    }
    return _TwoWebView;
}


-(UITableView *)detileTwoTab{
    
    if (!_detileTwoTab) {
        _detileTwoTab = [[UITableView alloc]initWithFrame:CGRectMake(0, 128+VIEW_HEIGHT-64, self.detileTableView.width, self.detileTableView.height-75)];
        _detileTwoTab.backgroundColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1];
        _detileTwoTab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _detileTwoTab.delegate = self;
        _detileTwoTab.dataSource = self;
        _detileView.tag = 1005;
        _detileTwoTab.showsVerticalScrollIndicator= NO;
        
    }
    return _detileTwoTab;
}

-(UICollectionView *)TwoColltionView{
    
    if (!_TwoColltionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(screen_Width/2 - 1.5, screen_Width/2 - 2);
        layout.minimumInteritemSpacing = 1.5;
        layout.minimumLineSpacing = 2;
        _TwoColltionView = [[UICollectionView alloc] initWithFrame:self.TwoWebView.frame collectionViewLayout:layout];
        _TwoColltionView.frame = CGRectMake(0, 128+VIEW_HEIGHT-64, self.detileTableView.width, self.detileTableView.height-58);
        _TwoColltionView.contentInset = UIEdgeInsetsMake(10, 0, 0, 0);
        _TwoColltionView.backgroundColor = [UIColor colorWithRed:242/255.0f green:242/255.0f blue:242/255.0f alpha:1];
        _TwoColltionView.delegate = self;
        _TwoColltionView.dataSource = self;
        
        UINib *cellNib = [UINib nibWithNibName:@"JDLDetileCollectionCell" bundle:nil];
        [_TwoColltionView registerNib:cellNib forCellWithReuseIdentifier:@"CellID"];
        
    }
    return _TwoColltionView;
}



//创建navBar
-(void)createNavbar{
    
    UIView *navView = [[UIView alloc]initWithFrame:CGRectMake(0, screen_Height - 60, screen_Width, 60)];
    navView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:navView];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(screen_Width-screen_Width/3, 0, screen_Width/3, 60)];
    btn.backgroundColor = [UIColor redColor];
    [btn setTitle:@"立即购买" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.tag = 1000;//立即购买
    [btn addTarget:self action:@selector(gwcBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [navView addSubview:btn];
    
    
    UIButton *gouBtn = [[UIButton alloc]initWithFrame:CGRectMake(screen_Width-screen_Width/3*2, 0, screen_Width/3, 60)];
    gouBtn.backgroundColor = [UIColor orangeColor];
    [gouBtn setTitle:@"加入购物车" forState:UIControlStateNormal];
    [gouBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    gouBtn.tag = 1001;
    [gouBtn addTarget:self action:@selector(gwcBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    gouBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    [navView addSubview:gouBtn];
    
    souBtn = [[UIButton alloc]initWithFrame:CGRectMake(screen_Width-screen_Width/3*2-screen_Width/3/2, 0, screen_Width/3/2, 60)];
    souBtn.backgroundColor = [UIColor whiteColor];
    
    [souBtn addTarget:self action:@selector(Sou_touch) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:souBtn];
    
    
    UIButton *maoBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, screen_Width/3/2, 60)];
    maoBtn.backgroundColor = [UIColor whiteColor];
    [maoBtn setImage:[UIImage imageNamed:@"btn_store"] forState:UIControlStateNormal];
    [maoBtn addTarget:self action:@selector(Store) forControlEvents:UIControlEventTouchUpInside];
    [navView addSubview:maoBtn];
    
    UIImageView *iamgeView = [[UIImageView alloc]initWithFrame:CGRectMake(screen_Width/3/2, 2, 1, 60)];
    iamgeView.image = [UIImage imageNamed:@"pic_partition"];
    [navView addSubview:iamgeView];
    
}
#pragma mark 收藏点击事件
-(void)Sou_touch
{
    if (![LoginModel isLogin]) {
        
        JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
        [self.navigationController pushViewController:logVc animated:YES];
    }
    else
    {
        
        if(souBtn.tag!=0){
            _collectModel = [[JDLCollectModel alloc] init];
            _collectModel.name = buyModel.name;
            _collectModel.pid =_sp_ID;
            _collectModel.cname =buyModel.city;
            _collectModel.price = buyModel.price;
            _collectModel.url = buyModel.img;
            [_collectModel saveObjectWithCompletion:^(JDLCollectModel *collectModel, NSError *error) {
                if (error == nil) {
                    MYLOG(@"seccecc");
                    _collectModel = collectModel;
                    souBtn.tag=0;
                    [souBtn setImage:[UIImage imageNamed:@"btn_collect_pre-1"] forState:UIControlStateNormal];
                } else {
                    // deal with error
                   [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                    
                }
            }];
            
        }
        else if(souBtn.tag==0)
        {
            [_collectModel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
                
                if (error == nil) {
                    MYLOG(@"seccecc");
                    souBtn.tag=1;
                    [souBtn setImage:[UIImage imageNamed:@"btn_collect"] forState:UIControlStateNormal];
                } else {
                    // deal with error
                   [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                    
                }
            }];
            
        }
    }
    
    
}
-(void)Store
{
    
    
    JDLStoreViewController *store = [[JDLStoreViewController alloc]initWith_StoreID:buyModel.sid];
    [self.navigationController pushViewController:store animated:YES];
}

-(void)initChoseView
{
    //选择尺码颜色的视图
    popView = [[JDLpopupView alloc] initWithFrame:CGRectMake(0, screen_Height+124, screen_Width, screen_Height)];
    [self.view addSubview:popView];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [popView.alphaiView addGestureRecognizer:tap];
    
    //尺码
    popView.sizeView = [[JDLTypeView alloc] initWithFrame:CGRectMake(0, 0, popView.frame.size.width, 50) andDatasource:sizearr :@"尺码"];
    popView.sizeView.delegate = self;
    [popView.mainscrollview addSubview:popView.sizeView];
    popView.sizeView.frame = CGRectMake(0, 0, popView.frame.size.width, popView.sizeView.height);
    //颜色分类
    popView.colorView = [[JDLTypeView alloc] initWithFrame:CGRectMake(0, popView.sizeView.frame.size.height, popView.frame.size.width, 50) andDatasource:colorarr :@"颜色分类"];
    popView.colorView.delegate = self;
    [popView.mainscrollview addSubview:popView.colorView];
    popView.colorView.frame = CGRectMake(0, popView.sizeView.frame.size.height, popView.frame.size.width, popView.colorView.height);
    //购买数量
    popView.countView.frame = CGRectMake(0, popView.colorView.frame.size.height+popView.colorView.frame.origin.y, popView.frame.size.width, 50);
    popView.mainscrollview.contentSize = CGSizeMake(self.view.frame.size.width, popView.countView.frame.size.height+popView.countView.frame.origin.y);
    [popView.image sd_setImageWithURL:[NSURL URLWithString:[sp_url objectForKey:colorarr[0]]]placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
    popView.priceLab.text =  [NSString stringWithFormat:@"¥%@",buyModel.price] ;
    popView.stockLab.text = [NSString stringWithFormat:@"库存%@件",buyModel.stock];
    popView.detailLab.text = @"请选择 尺码 颜色分类";
    [popView.deletBtn addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    
    
    [popView.sureBtn addTarget:self action:@selector(dismiss:) forControlEvents:UIControlEventTouchUpInside];
    
    //点击黑色透明视图choseView会消失
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismiss)];
    [popView.alphaiView addGestureRecognizer:tap2];
    
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap1Click_Ten:)];
    popView.image.userInteractionEnabled =YES;
    [popView.image addGestureRecognizer:tap1];
}


-(void)dismiss{
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    [UIView animateWithDuration: 0.35 animations: ^{
        popView.frame =CGRectMake(0, screen_Height, screen_Width, screen_Height);
    } completion: nil];
}


-(void)dismiss:(UIButton *)btn{
    
    if (popView.sizeView.seletIndex ==-1&&popView.colorView.seletIndex == -1) {
        [MBProgressHUD showError:@"请选择尺码和颜色"];
        return;
    }
    else if (popView.sizeView.seletIndex ==-1&&popView.colorView.seletIndex >= 0){
        [MBProgressHUD showError:@"请选择尺码"];
        
        return;
    }
    else if (popView.sizeView.seletIndex >= 0&&popView.colorView.seletIndex == -1)
    {
        [MBProgressHUD showError:@"请选择颜色"];
        
        return;
    }

    [popView.countView.countText resignFirstResponder];
    //查询店铺基本信息
    [JDLStoredeatail getObjectWithId:buyModel.sid completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                
                NSMutableArray *  _data_arr = [NSMutableArray arrayWithObject:object];
                if (_data_arr.count>0) {
                    _storemodel = [_data_arr objectAtIndex:0];
                    
                    if (popView.sureBtn.tag ==1000) {
                        MYLOG(@"立即购买"); 
                        [self.navigationController setNavigationBarHidden:NO animated:YES];
                        [UIView animateWithDuration: 0.3 animations: ^{
                            popView.frame =CGRectMake(0, screen_Height, screen_Width, screen_Height);
                        } completion: nil];
                        [UIView animateWithDuration: 0.9 animations: ^{
                            JDLSureCartModel *sureModel = [[JDLSureCartModel alloc]init];
                            sureModel.size = size;
                            sureModel.color = color;
                            sureModel.ID = _sp_ID;
                            sureModel.buy_amount =popView.countView.countText.text;
                            sureModel.pname = buyModel.name;
                            sureModel.price = buyModel.price;
                            sureModel.pimg = imageUrl;
                            sureModel.shop_price = buyModel.shop_price;
                            sureModel.sid = buyModel.sid;
                            sureModel.store_name =[_storemodel.shop objectForKey:@"name"];
                            JDLBuyDetileViewController *buyDetileVc = [[JDLBuyDetileViewController alloc]init];
                            buyDetileVc.detileModel = sureModel;
                            [self.navigationController pushViewController:buyDetileVc animated:YES];
                        } completion: nil];
                        
                    }
                    else if (popView.sureBtn.tag == 1001){
                        MYLOG(@"加入购物车");
                        
                        //  [self.navigationController setNavigationBarHidden:NO animated:YES];
                        [self addshopcart];
                        [UIView animateWithDuration: 0.35 animations: ^{
                            popView.frame =CGRectMake(0, screen_Height, screen_Width, screen_Height);
                            //            self.view.frame= CGRectMake(0, 0, screen_Width, screen_Height);
                            
                        } completion: nil];
                    }
                
                }
                
                
            }
        }else
        {
            
            MYLOG(@"get list error=%@",error);
            [MBProgressHUD showError:@"服务器繁忙"];
            
        }
    } ];

    
    
}
-(void)addshopcart
{

    _cartModel = [[JDLSureCartModel alloc] init];
    _cartModel.pname = buyModel.name;
    _cartModel.buy_amount = popView.countView.countText.text;
    _cartModel.price = buyModel.price;
    _cartModel.pimg = [NSString stringWithFormat:@"%@",imageUrl];
    _cartModel.color = color;
    _cartModel.size = size;
    _cartModel.ID = _sp_ID;
    _cartModel.KuCun = Kucun;
    _cartModel.sid = buyModel.sid;
    _cartModel.store_name =[_storemodel.shop objectForKey:@"name"];
    
    [_cartModel saveObjectWithCompletion:^(JDLSureCartModel *cartModel, NSError *error) {
        if (error == nil) {
            MYLOG(@"saveFeedback is %@", cartModel);
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            [MBProgressHUD showSuccess:@"加入购物车成功"];
            
        } else {
            // deal with error
            MYLOG(@"save book error= %@", error);
            [MBProgressHUD showError:@"服务器繁忙"];
        }
    }];
}



-(void)gwcBtnClick:(UIButton *)btn{
    if (![LoginModel isLogin]) {
        
        JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
        [self.navigationController pushViewController:logVc animated:YES];
    }
    else
    {
        if (btn.tag == 1000) {
            //        立即购买
            popView.sureBtn.tag =1000;
            
        }else if (btn.tag == 1001){
            //        加入购物车
            popView.sureBtn.tag =1001;
            
        }
        [UIView animateWithDuration: 0.35 animations: ^{
            popView.frame =CGRectMake(0, 0, screen_Width, screen_Height);
            //        _detileScrollView.center = center;
            //        _detileScrollView.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.8,0.8);
            
        } completion: nil];
    }
}



-(void)CreateButton
{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 128-64, screen_Width, VIEW_HEIGHT)];
    
    [self.detileView addSubview:bgview];
    
    NSArray *titleArray = @[@"图文详情",@"产品参数",@"店铺推荐"];
    CGFloat with = screen_Width/3;
    
    for(int i = 0; i < titleArray.count;i++){
        
        _titlebtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _titlebtn.frame = CGRectMake(i*with, 0, with, VIEW_HEIGHT-2);
        [_titlebtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [_titlebtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_titlebtn addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [_titlebtn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
            self.TwoColltionView.hidden = YES;
            self.detileTwoTab.hidden = YES;
            [self butClick:_titlebtn];
        }
        
        _titlebtn.titleLabel.font = [UIFont systemFontOfSize:15.0f];
        _titlebtn.tag = 200+i;
        [bgview addSubview:_titlebtn];
    }
    _xianView = [[UIView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT-2, with, 2)];
    _xianView.backgroundColor = [UIColor orangeColor];
    [bgview addSubview:_xianView];
}


- (void)butClick:(UIButton *)btn{
    [self changedBtnColor:btn];
    
    [UIView animateWithDuration:0.05f animations:^{
        CGRect rc = _xianView.frame;
        _xianView.frame = CGRectMake(rc.size.width*(btn.tag-200), rc.origin.y, rc.size.width, rc.size.height);
    }];
    
    if (btn.tag == 200) {
        self.TwoWebView.hidden = NO;
        self.detileTwoTab.hidden = YES;
        self.TwoColltionView.hidden = YES;
        [self.detileView addSubview:self.TwoWebView];
    }
    
    else if (btn.tag == 202){
        self.TwoWebView.hidden = YES;
        self.detileTwoTab.hidden = YES;
        self.TwoColltionView.hidden = NO;
        [self.detileView addSubview:self.TwoColltionView];
    }
    
    else if (btn.tag == 201){
        self.TwoWebView.hidden = YES;
        self.detileTwoTab.hidden = NO;
        self.TwoColltionView.hidden = YES;
        [self.detileView addSubview:self.detileTwoTab];
    }
}

-(void)changedBtnColor:(UIButton *)btn{
    [self.selectdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.selectdBtn = btn;
//    [_detileTwoTab reloadData];
}


-(void)addsubUIView{
    [self.view addSubview:self.detileScrollView];
    [self.detileScrollView  addSubview:self.detileTableView];
    [self.detileScrollView addSubview:self.detileView];
    [self.detileView addSubview:self.TwoWebView];
    [self.detileView addSubview:self.detileTwoTab];
    [self.detileView addSubview:self.TwoColltionView];
    [self CreateButton];

}


-(void)crateFefreshView
{
    MJRefreshBackGifFooter *footer = [MJRefreshBackGifFooter footerWithRefreshingBlock:^{
        [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.detileScrollView.contentOffset = CGPointMake(0, self.detileScrollView.height);
        } completion:^(BOOL finished) {
            [self.detileTableView.footer endRefreshing];
            //    请求数据
            [self createTwoLoadData];
        }];
    }];
    footer.automaticallyHidden = NO; // 关闭自动隐藏(若为YES，cell无数据时，不会执行上拉操作)
    footer.stateLabel.backgroundColor = self.detileTableView.backgroundColor;
    [footer setTitle:@"继续拖动，查看图文详情" forState:MJRefreshStateIdle];
    [footer setTitle:@"松开，即可查看图文详情" forState:MJRefreshStatePulling];
    [footer setTitle:@"松开，即可查看图文详情" forState:MJRefreshStateRefreshing];
    self.detileTableView.footer = footer;
    
    // 2.设置 UIWebView 下拉显示商品详情
    MJRefreshGifHeader *header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        //设置动画效果
        [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.detileScrollView.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            //结束加载
            [self.TwoWebView.scrollView.header endRefreshing];
        }];
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    
    // 设置文字、颜色、字体
    [header setTitle:@"下拉，返回商品简介" forState:MJRefreshStateIdle];
    [header setTitle:@"释放，返回商品简介" forState:MJRefreshStatePulling];
    [header setTitle:@"释放，返回商品简介" forState:MJRefreshStateRefreshing];
    header.stateLabel.textColor = [UIColor orangeColor];
    header.stateLabel.font = [UIFont systemFontOfSize:12.f];
    self.TwoWebView.scrollView.header = header;
    
    // 设置 UICollectionView 下拉显示商品详情
    MJRefreshGifHeader *cHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.detileScrollView.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self.TwoColltionView.header endRefreshing];
            
        }];
    }];
    cHeader.lastUpdatedTimeLabel.hidden = YES;
    [cHeader setTitle:@"下拉，返回商品简介" forState:MJRefreshStateIdle];
    [cHeader setTitle:@"释放，返回商品简介" forState:MJRefreshStatePulling];
    [cHeader setTitle:@"释放，返回商品简介" forState:MJRefreshStateRefreshing];
    cHeader.stateLabel.font = [UIFont systemFontOfSize:12.f];
    cHeader.stateLabel.textColor = [UIColor orangeColor];
    self.TwoColltionView.header = cHeader;
   
    
//    设置detileTwoView的商品详情
    MJRefreshGifHeader *tHeader = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.detileScrollView.contentOffset = CGPointMake(0, 0);
        } completion:^(BOOL finished) {
            [self.detileTwoTab.header endRefreshing];
        }];
    }];
    tHeader.lastUpdatedTimeLabel.hidden = YES;
    [tHeader setTitle:@"下拉，返回商品简介" forState:MJRefreshStateIdle];
    [tHeader setTitle:@"释放，返回商品简介" forState:MJRefreshStatePulling];
    [tHeader setTitle:@"释放，返回商品简介" forState:MJRefreshStateRefreshing];
    tHeader.stateLabel.font = [UIFont systemFontOfSize:12.f];
    tHeader.stateLabel.textColor = [UIColor orangeColor];
    self.detileTwoTab.header = tHeader;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag==2000)
    {
    
        return 2;
        
    }else
    {
     
        return 1;
        
    }
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView.tag==2000)
    {
        
        if (section == 0) {
            return 1;
            
        }else if (section==1)
        {
        
             return 2;
            
        }
        
        
    }
    
        
    if (_detile_ColltionArr) {
        tw_DetileArr = [[NSMutableArray alloc]initWithCapacity:0];
        tw_DetileArr =   _DetileColltionmodel.Detail;
        }
        return tw_DetileArr.count;
    

    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (tableView.tag==2000) {
        
        if (indexPath.section == 0) {
            tabViewCellhigh(100, 117, 117);
        }
        return 45;
    }
    else
    {
    
        return 35;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (tableView.tag==2000) {
        if(indexPath.section==0)
        {
            static NSString *identifier = @"cell";
            JDLBuyOneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLBuyOneTableViewCell" owner:self options:nil]lastObject];
            
            if(buyModel!=nil)
            {
                [cell setBuyModel:buyModel];
                
            }
            NSUInteger length = [cell.originalPrice.text length];
            NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:cell.originalPrice.text];
            [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
            [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, length)];
            [cell.originalPrice setAttributedText:attri];
            cell.selectionStyle=UITableViewCellAccessoryNone;
            
            return cell;
        }
        else
        {
            static NSString *identifier = @"cell";
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.selectionStyle = UITableViewCellSelectionStyleNone;
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            }
            cell.textLabel.font = [UIFont boldSystemFontOfSize:13];
            cell.textLabel.text = [dataArr objectAtIndex:indexPath.row];
            return cell;
        }
    }
    else
    {
    
        static NSString *identifier = @"cellID";
        JDLDetileTwoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLDetileTwoTableViewCell" owner:self options:nil]lastObject];
        if (tw_DetileArr.count>0) {
            [cell setDetileTwoModel:[tw_DetileArr objectAtIndex:indexPath.row]];
        }
        cell.selectionStyle = UITableViewCellAccessoryNone;
        UIView *v = [[UIView alloc]init];
        v.frame = CGRectMake(10, 0, SCREEN_WIDTH-20, 1);
        v.backgroundColor = [UIColor colorWithRed:193/255.0f green:193/255.0f blue:193/255.0f alpha:1];
        [cell addSubview:v];

        
        return cell;
    }


    
}





#pragma mark - uicolltionDeleget
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_detile_ColltionArr.count>0) {
        _TJshop_arr = [[NSMutableArray alloc]initWithCapacity:0];
        _TJshop_arr = _DetileColltionmodel.rec_shpo;
    }
    return _TJshop_arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *cellIdenttifer = @"CellID";
    JDLDetileCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdenttifer forIndexPath:indexPath];
    if (_detile_ColltionArr.count>0) {
//        _TJshop_arr = [[NSMutableArray alloc]initWithCapacity:0];
//        _TJshop_dic = [[NSDictionary alloc]init];
//        _DetileColltionmodel = [_detile_ColltionArr objectAtIndex:0];
//        _TJshop_arr = _DetileColltionmodel.rec_shpo;
            _TJshop_dic = [[NSDictionary alloc]init];
            _TJshop_dic = [_TJshop_arr objectAtIndex:indexPath.row];
            [cell setDetileColltionModel:_TJshop_dic];
        
        
    }
   
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
   
    _TJshop_dic = [_TJshop_arr objectAtIndex:indexPath.row];
    JDLBuyViewController *publicVC = [[JDLBuyViewController alloc]initWith_SP_ID:[_TJshop_dic objectForKey:@"pid"]];
    MYLOG(@"%@",[_TJshop_dic objectForKey:@"pid"]);
//    publicVC.city_id = _chinaModel.cyid;
//    publicVC.navTitle = _chinaModel.name;
    //	[self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:publicVC animated:YES];
}





- (void)setupBanner
{
    UIView *adView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Width)];
    adView.backgroundColor = [UIColor redColor];
    // 初始化
    self.banner = [[ZYBannerView alloc] init];
    // 设置frame
    self.banner.frame = CGRectMake(0,0, adView.frame.size.width, adView.frame.size.height);
    self.banner.showFooter = YES;
    self.banner.dataSource = self;
    self.banner.delegate = self;
    [adView addSubview:self.banner];
    _detileTableView.tableHeaderView =adView;
    
}

#pragma mark - ZYBannerViewDataSource


- (NSInteger)numberOfItemsInBanner:(ZYBannerView *)banner
{
    return self.dataArray.count;
}

#pragma mark 绑定图片

- (UIView *)banner:(ZYBannerView *)banner viewForItemAtIndex:(NSInteger)index
{
    // 取出数据
    NSString *imageName = self.dataArray[index];
    
    // 创建将要显示控件
    _imageView_gun = [[UIImageView alloc] init];
    [_imageView_gun sd_setImageWithURL:[NSURL URLWithString:imageName]];
    _imageView_gun.contentMode = UIViewContentModeScaleAspectFill;
    
    return _imageView_gun;
}

// 返回Footer在不同状态时要显示的文字
- (NSString *)banner:(ZYBannerView *)banner titleForFooterWithState:(ZYBannerFooterState)footerState
{
    if (footerState == ZYBannerFooterStateIdle) {
        return @"拖动进入下一页";
    } else if (footerState == ZYBannerFooterStateTrigger) {
        return @"释放进入下一页";
    }
    return nil;
}


#pragma mark - ZYBannerViewDelegate
// 在这里实现点击事件的处理
- (void)banner:(ZYBannerView *)banner didSelectItemAtIndex:(NSInteger)index
{
        [SJAvatarBrowser showImage:_imageView_gun];
    
}



// 在这里实现拖动footer后的事件处理
- (void)bannerFooterDidTrigger:(ZYBannerView *)banner
{
    //         _detileView *vc = [[_detileView alloc] init];
    //        [self.navigationController pushViewController:vc animated:YES];
    [UIView animateWithDuration:0.3f delay:0.0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.detileScrollView.contentOffset = CGPointMake(0, self.detileScrollView.height);
    } completion:^(BOOL finished) {
        [self.detileTableView.footer endRefreshing];
        //    请求数据
        [self createTwoLoadData];
    }];
    
}

#pragma gram-TabViewDelegate
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        //        MYLOG(@"yanse");
    }else if (indexPath.row == 0){
        if (![LoginModel isLogin]) {
            
            JDLLoggingViewController *logVc = [[JDLLoggingViewController alloc]init];
            [self.navigationController pushViewController:logVc animated:YES];
        }
        else{
            [UIView animateWithDuration: 0.35 animations: ^{
                popView.frame =CGRectMake(0, 0, screen_Width, screen_Height);
            } completion: nil];
            MYLOG(@"fenlei");
        }
    }else if (indexPath.row==1){
        MYLOG(@"pingjia");
        
    }
}


- (NSArray *)dataArray
{
    
    if (!_dataArray) {
        _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
        NSDictionary *dic_imageurl = [[NSDictionary alloc]init];
        //解析滚动图片
        for (int i =0; i<buyModel.product_imgsArr.count; i++) {
            dic_imageurl = buyModel.product_imgsArr[i];
            NSString *str_imageurl =  [dic_imageurl objectForKey:@"url"];
            [_dataArray addObject:str_imageurl];
        }
    }
    return _dataArray;
}



#pragma mark - typeDelegete
-(void)btnindex:(int)tag{
    
    if (popView.sizeView.seletIndex >=0&&popView.colorView.seletIndex >= 0) {
        size = [sizearr objectAtIndex:popView.sizeView.seletIndex];
        color = [colorarr objectAtIndex:popView.colorView.seletIndex];
        imageUrl = [sp_url objectForKey:color];
        [popView.image sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
        popView.stockLab.text = [NSString stringWithFormat:@"库存%@件",[[dic_all_allcolor_Ceshi objectForKey: size] objectForKey:color]];
        Kucun =[[dic_all_allcolor_Ceshi objectForKey: size] objectForKey:color];
        popView.detailLab.text = [NSString stringWithFormat:@"已选 \"%@\" \"%@\"",size,color];
        popView.stock =[[[dic_all_allcolor_Ceshi objectForKey: size] objectForKey:color] intValue];
        
        [self reloadTypeBtn:[dic_all_allcolor_Ceshi objectForKey:size] :colorarr :popView.colorView];
        [self reloadTypeBtn:[dic_all_allcolor_Ceshi objectForKey:color] :sizearr :popView.sizeView];
        
    }else if (popView.sizeView.seletIndex ==-1&&popView.colorView.seletIndex == -1)
    {

        imageUrl =[sp_url objectForKey:colorarr[0]];
        //尺码和颜色都没选的时候
        [popView.image sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];

        
        popView.priceLab.text = [NSString stringWithFormat:@"¥%@",buyModel.price] ;
        popView.stockLab.text = [NSString stringWithFormat:@"库存%@件",buyModel.stock];
        popView.detailLab.text = @"请选择 尺码 颜色分类";
        popView.stock = 100000;
        [self resumeBtn:colorarr :popView.colorView];
        [self resumeBtn:sizearr :popView.sizeView];
        
    }else if (popView.sizeView.seletIndex ==-1&&popView.colorView.seletIndex >= 0)
    {
        //只选了颜色
        color =[colorarr objectAtIndex:popView.colorView.seletIndex];
        //根据所选颜色 取出该颜色对应所有尺码的库存字典
        NSDictionary *dic = [dic_all_allcolor_Ceshi objectForKey:color];
        [self reloadTypeBtn:dic :sizearr :popView.sizeView];
        [self resumeBtn:colorarr :popView.colorView];
        int j=0 ;
        for (int i=0; i<sizearr.count; i++) {
            NSString *str= [NSString stringWithFormat:@"%@",[dic objectForKey:[sizearr objectAtIndex:i ]]];
            j=j+[str intValue];
        }
        imageUrl =[sp_url objectForKey:color];
        [popView.image sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
        popView.stockLab.text = [NSString stringWithFormat:@"库存%ld件",(long)j];
        popView.detailLab.text = @"请选择 尺码";
        popView.stock = j;
        
        
    }else if (popView.sizeView.seletIndex >= 0&&popView.colorView.seletIndex == -1)
    {
        //只选了尺码
        size =[sizearr objectAtIndex:popView.sizeView.seletIndex];
        //根据所选尺码 取出该尺码对应所有颜色的库存字典
        NSDictionary *dic = [dic_all_allcolor_Ceshi objectForKey:size];
        [self resumeBtn:sizearr :popView.sizeView];
        [self reloadTypeBtn:dic :colorarr :popView.colorView];
        int j=0 ;
        for (int i=0; i<colorarr.count; i++) {
            NSString *str= [NSString stringWithFormat:@"%@",[dic objectForKey:[colorarr objectAtIndex:i ]]];
            j=j+[str intValue];
        }
        imageUrl =  [sp_url objectForKey:colorarr[0]];
        [popView.image sd_setImageWithURL:[NSURL URLWithString:imageUrl] placeholderImage:[UIImage imageNamed:@"bg_home_convergechoiceness(2)"]];
        popView.stockLab.text =  [NSString stringWithFormat:@"库存%ld件",(long)j];
        popView.detailLab.text = @"请选择 颜色分类";
        popView.stock = j;
    }
    
}
//放大选中图片显示
-(void)tap1Click_Ten:(UITapGestureRecognizer * )sender
{
    
    [SJAvatarBrowser showImage:popView.image];
    
}

//恢复按钮的原始状态
-(void)resumeBtn:(NSArray *)arr :(JDLTypeView *)view
{
    for (int i = 0; i< arr.count; i++) {
        UIButton *btn =(UIButton *) [view viewWithTag:100+i];
        btn.enabled = YES;
        btn.selected = NO;
        [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        [btn setTitleColor:[UIColor blackColor] forState:0];
        [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        if (view.seletIndex == i) {
            btn.selected = YES;
            [btn setBackgroundColor:[UIColor redColor]];
        }
    }
}
//根据所选的尺码或者颜色对应库存量 确定哪些按钮不可选
-(void)reloadTypeBtn:(NSDictionary *)dic :(NSArray *)arr :(JDLTypeView *)view
{
    for (int i = 0; i<arr.count; i++) {
        int count = [[dic objectForKey:[arr objectAtIndex:i]] intValue];
        UIButton *btn =(UIButton *)[view viewWithTag:100+i];
        btn.selected = NO;
        [btn setBackgroundColor:[UIColor colorWithRed:240/255.0 green:240/255.0 blue:240/255.0 alpha:1]];
        //库存为零 不可点击
        if (count == 0) {
            btn.enabled = NO;
            [btn setTitleColor:[UIColor lightGrayColor] forState:0];
        }else
        {
            btn.enabled = YES;
            [btn setTitleColor:[UIColor blackColor] forState:0];
        }
        //根据seletIndex 确定用户当前点了那个按钮
        if (view.seletIndex == i) {
            btn.selected = YES;
            [btn setBackgroundColor:[UIColor redColor]];
        }
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
