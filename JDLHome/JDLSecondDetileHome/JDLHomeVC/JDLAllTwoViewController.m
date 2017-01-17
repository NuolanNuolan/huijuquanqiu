//
//  JDLAllTwoViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/6/15.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLAllTwoViewController.h"
#import "JDLAllShopCollectionViewCell.h"
#import "JDLAllShopDetileModel.h"
#import "JDLBuyViewController.h"
@interface JDLAllTwoViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
{
    UICollectionView *_colltionView;
    JDLAllShopDetileModel *chinaModel;
    //    热卖数组
    NSMutableArray *_allShop_hot;
    //新品
    NSMutableArray *_allshop_new;
    //特惠
    NSMutableArray*_allshop_te;
//    NSMutableArray *_allShop_Arr;
    NSString *_str;
}
@end

@implementation JDLAllTwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor clearColor];
    [self createColltionView];
    
    
}
-(void)viewWillAppear:(BOOL)animated
{

//    [_colltionView reloadData];
    
}

-(void)createColltionView{

            self.automaticallyAdjustsScrollViewInsets = YES;
            //    创建流式布局图
            UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
            layout.itemSize = CGSizeMake(screen_Width/3.0-0.5, 161-1);
            layout.minimumInteritemSpacing =0.5;
            layout.minimumLineSpacing = 1;
            layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
            layout.scrollDirection = UICollectionViewScrollDirectionVertical;
            _colltionView= [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height-VIEW_HEIGHT-64)collectionViewLayout:layout];
            _colltionView.delegate = self;
            _colltionView.dataSource = self;
            _colltionView.backgroundColor = [UIColor clearColor];
            _colltionView.showsVerticalScrollIndicator =NO;
    
            UINib *cellNib = [UINib nibWithNibName:@"JDLAllShopCollectionViewCell" bundle:nil];
            [_colltionView registerNib:cellNib forCellWithReuseIdentifier:@"Cellname"];
            [self.view addSubview:_colltionView];

}

#pragma mark 实现协议方法
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
     if (self.shop_arr.count > 0) {
     
     
         return self.shop_arr.count;
     }
    return 1;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    


        static NSString *cellIdenttifer = @"Cellname";
        JDLAllShopCollectionViewCell*cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdenttifer forIndexPath:indexPath];
        if (self.shop_arr.count > 0) {
            chinaModel = [self.shop_arr objectAtIndex:indexPath.row];
            [cell setChinaModel:chinaModel];
        }
    
        return cell;

}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    chinaModel =[self.shop_arr objectAtIndex:indexPath.row];
    [self.delegate pushbuyview:chinaModel.pid];
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
