//
//  JDLInternstionViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLInternstionViewController.h"
#import "JDLSearchViewController.h"
#import "JDLIntertionCollectionViewCell.h"
#import "MainContainer_publicViewController.h"
#import "JDLInternstionModel.h"
@interface JDLInternstionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_colltionView;
    JDLInternstionModel *_internstionModel;
    NSMutableArray *_intersntionArr;
    UIView *_verticalLine;
}
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation JDLInternstionViewController
-(void)viewWillAppear:(BOOL)animated{
    
    //    [self.tabBarController.tabBar setHidden:NO];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
   [self loadData];
    [self navTitle:@"汇聚全球"];
    self.view.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
//    [self createRightItem];
    [self createColltionView];
}


-(void)loadData{
//    WEAKSELF;
//    [[HttpManager defaultManager]localCacheToUrl:URL_Internstion params:nil complete:^(BOOL successed, NSDictionary *result) {
//        if(successed){
//            if ([result[@"jdl_code"] isEqualToString:[NSString stringWithFormat:@"0"]]){
//                _intersntionArr = [[NSMutableArray alloc]init];
//                NSDictionary *chinaDic = [[NSDictionary alloc]init];
//                NSArray *chinaArr = [[NSArray alloc]init];
//                chinaArr = [result [@"jdl_body"]objectForKey:@"list"];
//                for (chinaDic in chinaArr) {
//                    JDLInternstionModel *internstionModel = [[JDLInternstionModel alloc]init];
//                    [internstionModel setValuesForKeysWithDictionary:chinaDic];
//                    [_intersntionArr addObject:internstionModel];
//                    _internstionModel = internstionModel;
//                    
//                }
//                [_colltionView reloadData];
//            }else{
//                
//            }
//            
//        }
//        else{
//            
//            
//        }
//        
//        [weakSelf.hud hide:YES];
//    }];
    [JDLInternstionModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        if(error==nil){
            if(objects){
                _intersntionArr = [NSMutableArray arrayWithArray:objects];
               
                [_colltionView reloadData];
            }
        }else{
            MYLOG(@"get list error=%@",error);
        }
    }];
}




//创建collTionView
-(void)createColltionView{
    
    self.automaticallyAdjustsScrollViewInsets = YES;
    //    创建流式布局图
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.itemSize = CGSizeMake(screen_Width/3-0.5, screen_Width/3-1);
    layout.minimumInteritemSpacing = 0.5;
    layout.minimumLineSpacing = 1;
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    _colltionView= [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)collectionViewLayout:layout];
    _colltionView.delegate = self;
    _colltionView.dataSource = self;
    _colltionView.backgroundColor = [UIColor clearColor];
     _colltionView.showsVerticalScrollIndicator =NO;
    [self.view addSubview:_colltionView];
    
    UINib *cellNib = [UINib nibWithNibName:@"JDLIntertionCollectionViewCell" bundle:nil];
    [_colltionView registerNib:cellNib forCellWithReuseIdentifier:@"cellName"];
}



#pragma mark - 设置右侧搜索按钮
-(void)createRightItem{
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectMake(screen_Width - 30, 0, 20, 20);
    [rightBtn setBackgroundImage:[UIImage imageNamed:@"nav_search"] forState:UIControlStateNormal];
    [rightBtn setImage:[UIImage imageNamed:@"nav_search(1)"] forState:UIControlStateHighlighted];
    [rightBtn addTarget:self action:@selector(rightBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = rightItem;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)rightBtnClick:(UIButton *)btn{
    
    JDLSearchViewController *searchView = [[JDLSearchViewController alloc]init];
    //	[self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:searchView animated:YES];
}


#pragma mark - UiColltionView的代理
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _intersntionArr.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _internstionModel = [_intersntionArr objectAtIndex:indexPath.row];
    static NSString *cellIdenttifer = @"cellName";
    JDLIntertionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdenttifer forIndexPath:indexPath];
    
    if (_intersntionArr.count > 0) {
        [cell configInternstionUI:_internstionModel];
        
    }
    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    _internstionModel = [_intersntionArr objectAtIndex:indexPath.row];
//    JDLPublicDetileViewController *publicVC = [[JDLPublicDetileViewController alloc]initWith_Pr_ID:_internstionModel.id];
//    publicVC.city_id = [NSString stringWithFormat:@"0087"];
//    publicVC.navTitle = _internstionModel.name;
//    //	[self.tabBarController.tabBar setHidden:YES];
//
//    [self.navigationController pushViewController:publicVC animated:YES];
    
    
    MainContainer_publicViewController *vc = [[MainContainer_publicViewController alloc]initWithNibName:@"MainContainer_publicViewController" bundle:nil];
    vc.prID=_internstionModel.id;
    vc.city_id = [NSString stringWithFormat:@"0087"];
    vc.navTitle=_internstionModel.name;
    [self.navigationController pushViewController:vc animated:YES];
}

@end
