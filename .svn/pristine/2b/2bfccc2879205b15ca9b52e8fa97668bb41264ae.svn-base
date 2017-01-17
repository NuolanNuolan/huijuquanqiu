//
//  JDLChinaViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/14.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLChinaViewController.h"
#import "JDLSearchViewController.h"
#import "JDLChinaMainCollectionViewCell.h"
#import "JDLChinaModel.h"
#import "MainContainer_publicViewController.h"
//#import "SDImageCache.h"
@interface JDLChinaViewController ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
{

    UICollectionView *_colltionView;
//    装载数据的数组
    NSMutableArray *_chinaArray;
//    装载数据的model
    JDLChinaModel *_chinaModel;
//    NSArray *_chinaArr;
    UIView *_verticalLine;
}
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation JDLChinaViewController

-(void)viewWillAppear:(BOOL)animated{
    //    [self.tabBarController.tabBar setHidden:NO];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self navTitle:@"中国质造"];
    self.view.backgroundColor = [UIColor colorWithRed:204/255.0 green:204/255.0 blue:204/255.0 alpha:1];
    [self loadData];
    [self createColltionView];
//    [self createRightItem];
    
}


-(void)loadData{
    [JDLChinaModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
        if(error==nil){
            if(objects){
                _chinaArray = [NSMutableArray arrayWithArray:objects];
                [_colltionView reloadData];
            }
        }else{
            NSLog(@"get list error=%@",error);
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
    UINib *cellNib = [UINib nibWithNibName:@"JDLChinaMainCollectionViewCell" bundle:nil];
    [_colltionView registerNib:cellNib forCellWithReuseIdentifier:@"Cellname"];
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
    
    return _chinaArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _chinaModel = [_chinaArray objectAtIndex:indexPath.row];
    static NSString *cellIdenttifer = @"Cellname";
    JDLChinaMainCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdenttifer forIndexPath:indexPath];
        if (_chinaArray.count > 0) {
            [cell setChinaModel:_chinaModel];
        }

    return cell;
}


-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
 
    _chinaModel = [_chinaArray objectAtIndex:indexPath.row];
    
    MainContainer_publicViewController *vc = [[MainContainer_publicViewController alloc]initWithNibName:@"MainContainer_publicViewController" bundle:nil];
    vc.prID=_chinaModel.id;
    vc.city_id=_chinaModel.cyid;
    vc.navTitle = _chinaModel.name;
    MYLOG(@"%@",_chinaModel.cyid);
    [self.navigationController pushViewController:vc animated:YES];
}

@end
