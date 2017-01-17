//
//  JDLCollectionViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/6.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLCollectionViewController.h"
#import "JDLSPShouCangTableViewCell.h"
#import "JDLSP_DPSPTableViewCell.h"
#import "LGJFoldHeaderView.h"
#import "JDLCollectionShopModel.h"
//#import "JDLCollectModel.h"
#import "JDLBuyModel.h"
#import "JDLFav_shop.h"
#import "JDLBuyViewController.h"
#import "JDLStoreViewController.h"
@interface JDLCollectionViewController ()<UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate,FoldSectionHeaderViewDelegate,DP_btndelegate>
{
    JDLCollectionShopModel *_collectionmodel;
    JDLFav_shop*_collection_storemmodel;
    //用户ID;
    UIImageView *_imageview;
    UIImageView *_imageview_store;
    //两个按钮
    UIButton *_titlebtn;
    //线
    UIView *_xianView;
    //滚动视图
    UIScrollView *_Scrollview_SC;
    //表格
    UITableView *_tableview;
    //尾部视图
    UIView * view;
//    商品收藏的数组
    NSMutableArray *_shopArr;
    //店铺收藏的数组
    NSMutableArray*_storeArr;
    NSDictionary *_foldInfoDic;/**< 存储开关字典 */
}
@property(nonatomic,strong)UIButton *selectdBtn;
@end

@implementation JDLCollectionViewController
-(void)viewWillAppear:(BOOL)animated
{
//
//    [self loadData];
//    [self store_collection];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self loadData];
    [self initdata];
    [self Dismiss];
    [self CreateButton];
    
    // Do any additional setup after loading the view.
}
#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:237/255.0f green:237/255.0f blue:237/255.0f alpha:1];
    self.title = @"我的收藏";
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}


-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)loadData{

    [MBProgressHUD showMessage:@"加载中" toView:self.view];
    [JDLCollectionShopModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        if(error==nil){
            if(objects.count>0){
                 [MBProgressHUD hideHUDForView:self.view animated:YES];
                _shopArr = [NSMutableArray arrayWithArray:objects];
                 [self store_collection];
                //数据请求成功创建表格
                if (_Scrollview_SC) {
                    [_Scrollview_SC removeAllSubviews];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 更UI
                     [self CreateScrollView];

                });
              
                _imageview.hidden=YES;
            }
            else{
                 [self store_collection];
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                //数据请求成功创建表格
                if (_Scrollview_SC) {
                    [_Scrollview_SC removeAllSubviews];
                }
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 更UI
                    [self CreateScrollView];
                    _imageview = [[UIImageView alloc]initWithFrame:CGRectMake(_Scrollview_SC.width/2-72, _Scrollview_SC.height/2-103, 143, 103)];
                    _imageview.image = [UIImage imageNamed:@"pic_my collect_collect"];
                    [self.view addSubview:_imageview];
                });
                
            }
        }
        else
        {
        
             [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }
    }];
}
//收藏的店铺
-(void)store_collection
{

    [JDLFav_shop getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        if(error==nil){
            if(objects.count>0){
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                _storeArr = [NSMutableArray arrayWithArray:objects];
                
                //数据请求成功创建表格
                if (_Scrollview_SC) {
                    [_Scrollview_SC removeAllSubviews];
                }
                [self CreateScrollView];
            }
            else{
                
                [MBProgressHUD hideHUDForView:self.view animated:YES];
                //数据请求成功创建表格
                if (_Scrollview_SC) {
                    [_Scrollview_SC removeAllSubviews];
                }
                [self CreateScrollView];
            }
        }
        else
        {
            
            [MBProgressHUD hideHUDForView:self.view animated:YES];
            
        }
    }];
    
    
}

#pragma mark -  创建两个按钮
-(void)CreateButton
{
    UIView *bgview = [[UIView alloc]initWithFrame:CGRectMake(0, 64, screen_Width, VIEW_HEIGHT_SC)];
    bgview.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    [self.view addSubview:bgview];
    
    NSArray *titleArray = @[@"商品收藏",@"店铺收藏"];
    CGFloat with = screen_Width/2;
    
    for(int i = 0; i < titleArray.count;i++){
        
        _titlebtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _titlebtn.frame = CGRectMake(i*with, 0, with, VIEW_HEIGHT_SC-2);
        [_titlebtn setTitle:titleArray[i] forState:UIControlStateNormal];
        [_titlebtn setTitleColor:[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1] forState:UIControlStateNormal];
        [_titlebtn addTarget:self action:@selector(butVlick_sc:) forControlEvents:UIControlEventTouchUpInside];
        _titlebtn.tag = 50+i;
        if (i == 0) {
            [_titlebtn setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
            [self butVlick_sc:_titlebtn];
        }
        
        _titlebtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
        
        [bgview addSubview:_titlebtn];
    }
    _xianView = [[UIView alloc] initWithFrame:CGRectMake(0, VIEW_HEIGHT_SC-2, with, 2)];
    _xianView.backgroundColor = [UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1];
    [bgview addSubview:_xianView];
}
- (void)butVlick_sc:(UIButton *)btn{

    [self changedBtnColor:btn];
    NSInteger i = btn.tag;
    CGFloat x = i *screen_Width;
    _Scrollview_SC.contentOffset = CGPointMake(x, 0);
    [UIView animateWithDuration:0.05 animations:^{
        CGRect rc = _xianView.frame;
        _xianView.frame = CGRectMake(rc.size.width*(btn.tag-50), rc.origin.y, rc.size.width, rc.size.height);
         [_Scrollview_SC setContentOffset:CGPointMake(SCREEN_WIDTH*(btn.tag-50), 0)];
    }];

    
}
-(void)changedBtnColor:(UIButton *)btn{
    [self.selectdBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithRed:248/255.0f green:144/255.0f blue:34/255.0f alpha:1] forState:UIControlStateNormal];
    self.selectdBtn = btn;
    if (self.selectdBtn.tag==51) {
        if (_storeArr.count>0) {
            _imageview.hidden =YES;
        }else
        {
        
            _imageview.hidden =NO;
        }
    }else
    {
    
        if (_shopArr.count>0) {
            _imageview.hidden =YES;
        }else
        {
            
            _imageview.hidden =NO;
        }
    }
}
#pragma mark - 创建scrollView
-(void)CreateScrollView
{
    if (_Scrollview_SC) {
        [_Scrollview_SC removeAllSubviews];
    }
    
        _Scrollview_SC = [[UIScrollView alloc]initWithFrame:CGRectMake(0, VIEW_HEIGHT_SC+64, SCREEN_WIDTH, screen_Height-VIEW_HEIGHT_SC)];
        _Scrollview_SC.contentSize =  CGSizeMake(SCREEN_WIDTH*2, 0);
        _Scrollview_SC.pagingEnabled = YES;
        _Scrollview_SC.delegate = self;
        _Scrollview_SC.bounces = NO;
        _Scrollview_SC.scrollEnabled = NO;
        _Scrollview_SC.tag=3000;
        _Scrollview_SC.showsHorizontalScrollIndicator = NO;
        _Scrollview_SC.backgroundColor = [UIColor clearColor];
        [self.view addSubview:_Scrollview_SC];
        //在滚动上添加tableview
        [self Createtableview];
        
    
   
    
}
//加载数据
-(void)initdata
{

    _foldInfoDic = [NSMutableDictionary dictionaryWithDictionary:@{
                                                                   @"0":@"0",
                                                                   @"1":@"0",
                                                                   @"2":@"0",
                                                                   @"3":@"0"
                                                                   }];

}
-(void)Createtableview
{

    if (_tableview) {
        [_tableview removeAllSubviews];
    }

    
        for (int i=0; i<2; i++) {
            _tableview = [[UITableView alloc]initWithFrame:CGRectMake(screen_Width*i, 0, screen_Width, screen_Height-VIEW_HEIGHT_SC-64)];
            _tableview.backgroundColor = [UIColor clearColor];
            _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
            _tableview.delegate = self;
            _tableview.dataSource = self;
            _tableview.showsVerticalScrollIndicator= NO;
            _tableview.tag=1000+i;
            [_Scrollview_SC addSubview:_tableview];
        }
    
   
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView.tag==1000) {
        return _shopArr.count;
    }
    else
    {
        NSString *key = [NSString stringWithFormat:@"%d", (int)section];
        BOOL folded = [[_foldInfoDic valueForKey:key] boolValue];
        if(folded){
            
            return 1;
        }else{
            return 0;
        }
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag==1000)
    {
        
        static NSString *ID = @"Cell";
        JDLSPShouCangTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:ID];
        if(cell == nil)
        {
            cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLSPShouCangTableViewCell" owner:self options:nil]lastObject];
        }
    

        if(_shopArr.count>0){
        _collectionmodel = [_shopArr objectAtIndex:indexPath.row];
        [cell setCollectionShopModel:_collectionmodel];
        }
       
        cell.selectionStyle=UITableViewCellAccessoryNone;
        //隐藏系统的分隔线
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
    else
    {
        static NSString *CellIdentifier = @"Cell";
        JDLSP_DPSPTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if(cell == nil)
        {
            cell = [[JDLSP_DPSPTableViewCell alloc]initWith_count:8];
        }
        
        cell.backgroundColor=[UIColor clearColor];
        cell.selectionStyle=UITableViewCellAccessoryNone;
        if (_storeArr.count>0) {
            [cell setCollectionStoreModel:_storeArr[indexPath.section]];
        }

        ((JDLSP_DPSPTableViewCell*)cell).delegate = self;
        cell.selectionStyle=UITableViewCellAccessoryNone;
        //隐藏系统的分隔线
        tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        return cell;
    }
    
    
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
    if(self.selectdBtn.tag ==50){
    
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            _collectionmodel = [_shopArr objectAtIndex:indexPath.row];
            [_collectionmodel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
                
                if (error == nil) {
                    MYLOG(@"seccecc");
                    [_shopArr removeObject:_collectionmodel];
                    [self loadData];
                } else {
                    [MBProgressHUD showError:@"服务器繁忙,请稍后再试哦"];
                    MYLOG(@"save book error= %@", error);
                    
                }
            }];
        }
    }else
    {
    
//        _collection_storemmodel = [_storeArr objectAtIndex:indexPath.section];
//        [_collection_storemmodel deleteObjectWithCompletion:^(BOOL success, NSError *error) {
//            
//            if (error == nil) {
//                MYLOG(@"seccecc");
//                [_storeArr removeObject:_collection_storemmodel];
//                [self store_collection];
//            } else {
//                showAlertView(@"服务器繁忙,请稍后再试");
//                MYLOG(@"save book error= %@", error);
//                
//            }
//        }];
    }
   
}

-(NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    if (tableView.tag==1000) {
        return @"删除";
    }
    else
    {
        return nil;
    }
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (tableView.tag==1000) {
        return 1;
    }
    else
    {
    return _storeArr.count;
        
    }
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if(tableView.tag == 1001 )
    {
       return 100;
    }else
    {
        
        
        return 0;
    }
}
//表格行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView.tag==1000){
    
        return 110;
    
    }
    else
    {
    
        return 160;
    }
        
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    if(tableView.tag==1000){
        JDLCollectionShopModel * str = [_shopArr objectAtIndex:indexPath.row];
        JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:str.pid];
        [self.navigationController pushViewController:buyVc animated:YES];
      }
    
}
-(void)JD_sele:(NSInteger)index
{
    if (_tableview.tag==1001) {
       
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    LGJFoldHeaderView *headerView = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (!headerView) {
        
        headerView = [[LGJFoldHeaderView alloc] initWithReuseIdentifier:@"header"];
        
    }
     headerView.delegate = self;
    [headerView setCollectionStoreModel:_storeArr[section]andsection_store:section];
    headerView.width=screen_Width;


    [headerView setFoldSectionHeaderViewWithTitle:section canFold:YES];


   
    NSString *key = [NSString stringWithFormat:@"%d", (int)section];
    BOOL folded = [[_foldInfoDic valueForKey:key] boolValue];
    headerView.fold = folded;
    return headerView;
}
- (void)foldHeaderInSection:(NSInteger)SectionHeader {
    NSString *key = [NSString stringWithFormat:@"%d",(int)SectionHeader];
    BOOL folded = [[_foldInfoDic objectForKey:key] boolValue];
    NSString *fold = folded ? @"0" : @"1";
    [_foldInfoDic setValue:fold forKey:key];
    NSMutableIndexSet *set = [[NSMutableIndexSet alloc] initWithIndex:SectionHeader];
    [_tableview reloadSections:set withRowAnimation:UITableViewRowAnimationNone];
    
    
}
#pragma mark - ScrollView的代理

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.tag==3000) {
        CGRect rc = _xianView.frame;
        _xianView.frame = CGRectMake(rc.size.width*_Scrollview_SC.contentOffset.x/SCREEN_WIDTH, rc.origin.y, rc.size.width, rc.size.height);
        [UIView animateWithDuration:0.2 animations:^{
            NSInteger count = scrollView.contentOffset.x/scrollView.frame.size.width;
            UIButton *btn = (UIButton *)[self.view viewWithTag:count+50];
            [self changedBtnColor:btn];
        }];
        
    }
}
//实现点击店铺商品图片按钮的协议  index是商品编号
-(void)DP_spID:(NSString *)index
{

    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:index];
    [self.navigationController pushViewController:buyVc animated:YES];
    
}
-(void)section_store:(NSInteger)section_store
{
    JDLFav_shop * model =_storeArr[section_store];
    JDLStoreViewController *store = [[JDLStoreViewController alloc]initWith_StoreID:model.pid];
    [self.navigationController pushViewController:store animated:YES];
}
@end
