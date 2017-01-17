//
//  JDLShoppingViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLShoppingViewController.h"
#import "JDLShoppingCartTableViewCell.h"
#import "JDLBuyDetileViewController.h"
#import "JDLBuyViewController.h"
#import "JDLSureCartModel.h"
#import "JDLStoredeatail.h"
#import "JDLStoreViewController.h"
@interface JDLShoppingViewController ()<UITableViewDelegate,UITableViewDataSource,JDLShoppingCartTableViewCellDelegate,UIAlertViewDelegate>
{

    UIImageView *_EmptyView;
    NSMutableArray *_dataArray;
    UITableView *_shopingTabView;
    //店铺
    JDLStoredeatail *  _storemodel;
    JDLSureCartModel *_shoppingModel;
    JDLShoppingCartTableViewCell *_scCell;
    UIView *footView;
    //装购物车临时数组
    NSMutableArray *_shoppingcart_arr;
    //总价
    float all_price;
    //店铺名字按钮
    UIButton *btn_store;
    
    //    传过来的id
    NSString *_tlitleStr;
    int _number;
    BOOL _hidden;
    UIButton *_rightBtn;
}

@property(nonatomic,strong)UILabel *pricelab;
@property(nonatomic,strong)UIButton *jsBtn;
@property(nonatomic,strong)UIButton *btn;
@property(nonatomic,strong)UILabel *lab;

@end

@implementation JDLShoppingViewController

- (id)initWith_title:(NSString *)title andFootH:(int)number andBarHidden:(BOOL)hidden{
    
    self = [super init];
    if (self) {
        _tlitleStr = title;
        _number = number;
        _hidden = hidden;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _shoppingcart_arr = [[NSMutableArray alloc]initWithCapacity:0];
     [self lodaData];
    [self navTitle:@"购物袋"];
    
    //    购物车的返回按钮
    if ([_tlitleStr isEqualToString:@"购物车"]) {
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.frame = CGRectMake(0, 0, 12, 22);
        [leftBtn setBackgroundImage:[UIImage imageNamed:@"nav_return.png"] forState:UIControlStateNormal];
        [leftBtn setImage:[UIImage imageNamed:@"nav_return(1)"] forState:UIControlStateHighlighted];
        [leftBtn addTarget:self action:@selector(createViewClick) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftBtn];
        self.navigationItem.leftBarButtonItem = leftItem;
        
    }else{
        
    }
//    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor colorWithRed:235/255.0f green:235/255.0f blue:241/255.0f alpha:1];
    [self createTabView];
    [self CreateRightBot];
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [_shoppingcart_arr removeAllObjects];
    if ([_tlitleStr isEqualToString:@"购物车"]) {
        [self.tabBarController.tabBar setHidden:_hidden];
    }else{
        //    [self.tabBarController.tabBar setHidden:NO];
    }
    [self lodaData];
    [_shopingTabView reloadData];
    
}
//右上角按钮
-(void)CreateRightBot
{
    
    _rightBtn =[PublicClass createButtonWithFrame:CGRectMake(screen_Width - 50, 0, 22, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"btn_shoppingbag_Trashcan"] highlightedImage:nil target:self SEL:@selector(RightBtn_del)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
}
-(void)createViewClick{
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
}

//右上角删除点击事件
-(void)RightBtn_del
{

    if (_shoppingcart_arr.count==0) {
        [MBProgressHUD showError:@"您还未选中要删除的商品"];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"确认删除购物车选中商品?" message:nil delegate:self cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        alert.tag=1000;
        [alert show];
//        [cartmodel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
//            if (error == nil) {
//                MYLOG(@"seccecc");
//            } else {
//                MYLOG(@"save book error= %@", error);
//                
//            }
//        }];
    }
    
}
//alert协议方法
-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{

    if (alertView.tag==1000) {
        if (buttonIndex==1) {
            for (int i=0; i<_shoppingcart_arr.count; i++) {
                _shoppingModel = [_shoppingcart_arr objectAtIndex:i];
                [self del_shopmodel:_shoppingModel];
            }
        }
    }
    
}
//删除购物车数据
-(void)del_shopmodel:(JDLSureCartModel *)cartmodel
{
    [cartmodel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
        if (error == nil) {
            MYLOG(@"seccecc");
            [_dataArray removeObject:cartmodel];
            [_shopingTabView reloadData];
            if (_dataArray.count==0) {
                [self createEmptyView];
            }
        } else {
            MYLOG(@"save book error= %@", error);
            [MBProgressHUD showError:@"服务器繁忙"];
            
        }
    }];
    
}
-(void)lodaData{
//    [MBProgressHUD showMessage:@"加载中" toView:self.view];
     _dataArray = [[NSMutableArray alloc]initWithCapacity:0];
    [JDLSureCartModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        if(error==nil){
            if(objects.count>0){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                _dataArray = [NSMutableArray arrayWithArray:objects];
                [_shoppingcart_arr removeAllObjects];
                [_shopingTabView reloadData];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self createEmptyView];
                });
                
            }
            else{
                [MBProgressHUD hideHUDForView:self.view animated:YES];
               
                [_shoppingcart_arr removeAllObjects];
                [_shopingTabView reloadData];
                dispatch_async(dispatch_get_main_queue(), ^{
                    [self createEmptyView];
                });
            }
        }
        else{
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
    


}

-(void)createEmptyView{
    if (_dataArray.count ==0) {
        _rightBtn.hidden=YES;
        if (_EmptyView) {
            
            [_EmptyView removeFromSuperview];
        }
        _EmptyView = [[UIImageView alloc]initWithFrame:CGRectMake(screen_Width/2-72, 163, 134, 103)];
        [_EmptyView setImage:[UIImage imageNamed:@"icon_trolley"]];
        _EmptyView.tag=1;
        [self.view addSubview:_EmptyView];
        if (footView) {
            footView.backgroundColor = [UIColor colorWithRed:235/255.0f green:235/255.0f blue:241/255.0f alpha:1];
            [footView removeAllSubviews];
            
        }
    }
    else
    {
        
        if (_EmptyView) {
            
             [_EmptyView removeFromSuperview];
            _EmptyView.hidden =YES;
             _rightBtn.hidden=NO;
            
        }
        

        if (footView) {
            [footView removeAllSubviews];
            
        }
        [self createFootView];
        
        
    }
}



-(void)createFootView{
    if ([_tlitleStr isEqualToString:@"购物车"]) {
        footView = [[UIView alloc]initWithFrame:CGRectMake(0, screen_Height -109+_number , screen_Width, 60)];
    }
    else{
        
        footView = [[UIView alloc]initWithFrame:CGRectMake(0, screen_Height -109 , screen_Width, 60)];
    }

    if (_dataArray.count!=0) {
        footView.backgroundColor = [UIColor whiteColor];
    }
    else
    {
        footView.backgroundColor = [UIColor clearColor];
        
    }
    
    
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(0, 0, 49, 60);
    _btn.highlighted = NO;
    _btn.tag=0;
    [_btn setImage:[UIImage imageNamed:@"btn_roundne"] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(selectBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:_btn];
    
    _lab = [[UILabel alloc]initWithFrame:CGRectMake(49, 20, 30, 20)];
    _lab.text = @"全选";
    _lab.font = [UIFont systemFontOfSize:13.0f];
    _lab.textColor = [UIColor lightGrayColor];
    [footView addSubview:_lab];
    
    _jsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _jsBtn.frame = CGRectMake(screen_Width-130, 0, 130, 60);
    [_jsBtn setTitle:@"结算" forState:UIControlStateNormal];
    _jsBtn.backgroundColor = [UIColor redColor];
    [_jsBtn addTarget:self action:@selector(JsBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [footView addSubview:_jsBtn];
    
    
    if (screen_Width == iphone5_width) {
        _pricelab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width - _jsBtn.frame.size.width-105, 15, 105, 30)];
        _pricelab.font = [UIFont systemFontOfSize:13.0f];
    }
    else{
         _pricelab = [[UILabel alloc]initWithFrame:CGRectMake(screen_Width - _jsBtn.frame.size.width-120, 17, 120, 30)];
        _pricelab.font = [UIFont systemFontOfSize:15.0f];
    }
   
//    _pricelab.text = @"总价:￥0.00";
    NSString *contentStr = @"实付:￥0.00";
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, contentStr.length-3)];
    _pricelab.attributedText = str;
//    _pricelab.font = [UIFont systemFontOfSize:1.0f];
    [footView addSubview:_pricelab];
    [self.view addSubview:footView];
}

//跳转到订单详情界面
-(void)JsBtnClick{

    if (_shoppingcart_arr.count==0) {
        [MBProgressHUD showError:@"您还没有选择宝贝哦"];
        return;
    }
    JDLBuyDetileViewController *buyVC = [[JDLBuyDetileViewController alloc]initWith_shopcartmodel:_shoppingcart_arr andallprice:all_price];
    [self.navigationController pushViewController:buyVC animated:YES];
}



//全选按钮
-(void)selectBtnClick:(UIButton *)sender{
    
    if (sender.tag==0) {
        [_shoppingcart_arr removeAllObjects];
         [sender setImage:[UIImage imageNamed:@"btn_roundne_pro"] forState:UIControlStateNormal];
        for (int i = 0; i < _dataArray.count; i++) {
            JDLSureCartModel *shoppingModel = [_dataArray objectAtIndex:i];
            shoppingModel.selectState = YES;
            [_shoppingcart_arr addObject:shoppingModel];
            
        }
        sender.tag=1;
        
    }
    else
    {
    
        [_shoppingcart_arr removeAllObjects];
        [sender setImage:[UIImage imageNamed:@"btn_roundne"] forState:UIControlStateNormal];
        for (int i = 0; i < _dataArray.count; i++) {
            JDLSureCartModel *shoppingModel = [_dataArray objectAtIndex:i];
            shoppingModel.selectState = NO;
        }
        sender.tag=0;
    }
   
    [self totalPrice];
    [_shopingTabView reloadData];

}

//按钮点击事件
-(void)btnClick_shop:(UIButton *)sender{
    
    _shoppingModel = [_dataArray objectAtIndex:sender.tag];
    

    if (_shoppingModel.selectState)
    {
        _shoppingModel.selectState = NO;
        [_shoppingcart_arr removeObject:_shoppingModel];
        
    }
    else
    {
        _shoppingModel.selectState = YES;
        [_shoppingcart_arr addObject:_shoppingModel];
    }
    //全选了
    if (_shoppingcart_arr.count==_dataArray.count&&_shoppingcart_arr!=0&&_dataArray.count!=0) {
     
         [_btn setImage:[UIImage imageNamed:@"btn_roundne_pro"] forState:UIControlStateNormal];
        _btn.tag=1;
//        int j=0;
//        for (int i=0; i<_shoppingcart_arr.count; i++) {
//            _shoppingModel = _shoppingcart_arr[i];
//            NSString *str =   _shoppingModel.total_fee;
//             j=j+[str intValue];
//            
//        }
       
        
    }
    else
    {
    
        [_btn setImage:[UIImage imageNamed:@"btn_roundne"] forState:UIControlStateNormal];
         _btn.tag=0;
        
    }
    MYLOG(@"%ld",_shoppingcart_arr.count);
    //刷新当前行
    [_shopingTabView reloadData];
    
    [self totalPrice];
    
}

-(void)createTabView{
    _shopingTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height-49) style:UITableViewStyleGrouped];
    _shopingTabView.delegate = self;
    _shopingTabView.dataSource = self;
    _shopingTabView.showsVerticalScrollIndicator =NO;
    _shopingTabView.backgroundColor = [UIColor clearColor ];
    _shopingTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_shopingTabView];
}
#define mark - shopingTabViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
 
    return _dataArray.count;
    MYLOG(@"%lu",(unsigned long)_dataArray.count);
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _scCell = [[[NSBundle mainBundle]loadNibNamed:@"JDLShoppingCartTableViewCell" owner:self options:nil]lastObject];
    _scCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (_dataArray.count > 0) {
            _shoppingModel = [_dataArray objectAtIndex:indexPath.section];
        _scCell.tickBtn.tag = indexPath.section;
        [_scCell.tickBtn addTarget:self action:@selector(btnClick_shop:) forControlEvents:UIControlEventTouchUpInside];
        [_scCell setShoppingModel:_shoppingModel];
    }
    _scCell.delegate =self;
    return _scCell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    tabViewCellhigh(116, 116, 116);
}




-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{

    if (editingStyle == UITableViewCellEditingStyleDelete) {
        MYLOG(@"sszss");
        if (_dataArray.count>0) {
            _shoppingModel = [_dataArray objectAtIndex:indexPath.section];
            [_shoppingModel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
                
                if (error == nil) {
                    MYLOG(@"seccecc");
                    [_dataArray removeObject:_shoppingModel];
                    [_shoppingcart_arr removeObject:_shoppingModel];
                    [self lodaData];
                    [_shopingTabView reloadData];
                    MYLOG(@"%ld",_dataArray.count);
                    MYLOG(@"%ld",_shoppingcart_arr.count);
                } else {
                    [MBProgressHUD showError:@"服务器繁忙,请稍后再试"];
                    MYLOG(@"save book error= %@", error);
                    
                }
            }];
        }
        
    }
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{

    return @"删除";
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{

    
       _shoppingModel =   [_dataArray objectAtIndex:section];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 49)];
    view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *image = [[UIImageView alloc]initWithFrame:CGRectMake(20, 16, 15, 15)];
    image.image = [UIImage imageNamed:@"pic_store.png"];
    [view addSubview:image];
    
    btn_store = [UIButton buttonWithType:UIButtonTypeCustom];
    btn_store.frame = CGRectMake(40, 15, screen_Width-40, 20);
    [btn_store setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    btn_store.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [btn_store setTitle:_shoppingModel.store_name forState:UIControlStateNormal];
    btn_store.titleLabel.font = [UIFont systemFontOfSize:14.0f];
    btn_store.tag=section;
    [btn_store addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:btn_store];

    
    return view;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 49;
}

#define mar - 数量的点击事件
-(void)btnClick:(JDLSureCartModel *)shopmodel andbtntag:(NSInteger)tag andcount:(NSInteger)count{

    if (tag==0) {
        MYLOG(@"减！");

        if (shopmodel.selectState) {
            
            for (int i=0; i<_shoppingcart_arr.count; i++) {
                if (shopmodel==_shoppingcart_arr[i]) {
                    _shoppingModel = _shoppingcart_arr[i];
                    _shoppingModel.buy_amount = shopmodel.buy_amount;
                }
            }
        }
        else
        {
        
            for (int i = 0; i<_dataArray.count; i++) {
                if (shopmodel==_dataArray[i]) {
                    _shoppingModel  =_dataArray[i];
                    _shoppingModel.buy_amount = shopmodel.buy_amount;
                }
            }
        }
        
    }
    else
    {
    
        MYLOG(@"加!");
        if (shopmodel.selectState) {
        
            for (int i=0; i<_shoppingcart_arr.count; i++) {
                if (shopmodel==_shoppingcart_arr[i]) {
                    _shoppingModel = _shoppingcart_arr[i];
                    _shoppingModel.buy_amount = shopmodel.buy_amount;
                }
            }
        }
        else
        {
            for (int i = 0; i<_dataArray.count; i++) {
                
                if (shopmodel==_dataArray[i]) {
                    _shoppingModel  =_dataArray[i];
                    _shoppingModel.buy_amount = shopmodel.buy_amount;
                }
            }
        }
        
        
    }
    [self totalPrice];
}
//计算价格
-(void)totalPrice{
    int count = 0;
    int price = 0;
    all_price= 0;
    for (int i = 0 ; i < _shoppingcart_arr.count; i++) {
        _shoppingModel = [_shoppingcart_arr objectAtIndex:i];
        count = [_shoppingModel.buy_amount intValue];
        price = [_shoppingModel.price intValue];
        all_price =all_price +( count * price);
    }
    
//    _pricelab.text = [NSString stringWithFormat:@"总价:￥%0.2f",all_price];
    NSString *contentStr = [NSString stringWithFormat:@"总价:￥%0.2f",all_price];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc]initWithString:contentStr];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(3, contentStr.length-3)];
    _pricelab.attributedText = str;
    if (screen_Width == iphone4_width) {
        _pricelab.font = [UIFont systemFontOfSize:13.0f];
    }
    else{
    _pricelab.font = [UIFont systemFontOfSize:15.0f];
    }
}





-(void)btnClick:(UIButton *)sender{
     _shoppingModel =   [_dataArray objectAtIndex:sender.tag];
    JDLStoreViewController *store = [[JDLStoreViewController alloc]initWith_StoreID:_shoppingModel.sid];
    self.tabBarController.tabBar.hidden =YES;
    [self.navigationController pushViewController:store animated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:_shoppingModel.ID];
    [self.navigationController pushViewController:buyVc animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
