//
//  JDLCategoryViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/29.
//  Copyright :copyright: 2016年 JDL. All rights reserved.
//

#import "JDLCategoryViewController.h"
#import "JDLCategorTableViewCell.h"
#import "JDLCategoryModel.h"
#import "JDLBuyViewController.h"
@interface JDLCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tabView;
    UICollectionView *_collectionView;
    NSInteger _page;
    NSArray *_dataArray;
    BOOL _isRelate;
}
@property(nonatomic,strong)MBProgressHUD *hud;

@end

@implementation JDLCategoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"分类";
    _page = 0;
    [self createNavLeftItem];
    [self tableView];
    [self collectionView];
    [self loadData];
    
}

-(UITableView *)tableView{

    if (!_tabView) {
        _tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 70, screen_Height)];
        _tabView.dataSource = self;
        _tabView.delegate = self;
        _tabView.separatorStyle = UITableViewCellEditingStyleNone;
        _tabView.showsVerticalScrollIndicator = NO;
        _tabView.backgroundColor = [UIColor whiteColor];
        [self.view addSubview:_tabView];
    }
    return _tabView;
}


-(UICollectionView *)collectionView{

    if (!_collectionView) {
        self.automaticallyAdjustsScrollViewInsets = YES;
        //    创建流式布局图
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake((screen_Width-72)/3.0-1, (screen_Width-72)/3.0-1);
        layout.minimumInteritemSpacing = 1;
        layout.minimumLineSpacing = 1;
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(70, 64, screen_Width-73, screen_Height-64) collectionViewLayout:layout];
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"uicollectionView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];//注册头/尾视图
//        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footView"];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.backgroundColor = [UIColor grayColor];
        _collectionView.showsVerticalScrollIndicator =NO;
        [self.view addSubview:_collectionView];
    }
    return _collectionView;
}

#pragma mark 加载数据
-(void)loadData{
    
    _dataArray = @[@"浙江",@"杭州",@"宁波",@"温州",@"嘉兴",@"金华",@"台州",@"台州",@"台州",@"台州",@"台州",@"嘉兴",@"金华",@"嘉兴",@"金2华",];
}
#pragma mark - 设置左边返回按钮
-(void)createNavLeftItem{
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
    
}

-(void)createViewClick
{
    //    [self.tabBarController.tabBar setHidden:NO];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indenfier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indenfier];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:indenfier];
    }
    cell.selectionStyle = UITableViewCellStyleDefault;
    
    if ([_dataArray containsObject:indexPath]) {
        cell.textLabel.textColor = [UIColor redColor];
    }else{
        cell.textLabel.textColor = [UIColor blackColor];
    }
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.textLabel.font = [UIFont systemFontOfSize:15.f];
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 50;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.backgroundColor = [UIColor whiteColor];
    [_tabView reloadData];
    UITableViewCell *cell2 = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell2.backgroundColor = [UIColor whiteColor];
    _page = indexPath.row;
    _isRelate = NO;
    [_collectionView reloadData];
    cell2.textLabel.textColor = [UIColor redColor];
    NSIndexPath *topRow = [NSIndexPath indexPathForRow:0 inSection:0];
    [_collectionView scrollToItemAtIndexPath:topRow atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    
    if (indexPath.row < _dataArray.count) {
        [tableView setContentOffset:CGPointMake(0, 50*(indexPath.row)) animated:YES];
    }
}

#pragma mark 定义展示的Section的个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
   
    return _dataArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 10;
}

#pragma mark 每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identifier = @"uicollectionView";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    if(indexPath.item == 0)
    {
        for (UIView *view in cell.subviews) {
            [view removeFromSuperview];
        }
        
        UILabel *titleTextLable = [[UILabel alloc]initWithFrame:cell.frame];
        titleTextLable.textColor = [UIColor blackColor];
        titleTextLable.text = _dataArray[indexPath.section];
        titleTextLable.backgroundColor = [UIColor grayColor];
        cell.backgroundView = titleTextLable;
        cell.userInteractionEnabled = NO;
    }else
    {
        for (UIView *view in cell.subviews) {
            [view removeFromSuperview];
        }
        
        cell.userInteractionEnabled = YES;
    }
    return cell;
    

}

//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
//    
//    
//    return CGSizeMake(screen_Width-70,0);//在此如果将头视图的尺寸设置为（0，0）则左侧的tableView的分类cell不会根据collectionView的滑动而滑到相应的分类的cell。
//    
//}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
    headerView.backgroundColor = [UIColor whiteColor];
    
    for (UIView *view in headerView.subviews) {
        [view removeFromSuperview];
    }
    return headerView;
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.item == 0)
    {
        return CGSizeMake(screen_Width-70, 40);
        
    }
    
    return CGSizeMake((screen_Width-73)/3.0-1, (screen_Width-73)/3.0-1);
}

//将显示视图
-(void)collectionView:(UICollectionView *)collectionView willDisplaySupplementaryView:(UICollectionReusableView *)view forElementKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    if (_isRelate) {
        
        NSInteger topcellsection = [[[collectionView indexPathsForVisibleItems]firstObject]section];
        if (collectionView == _collectionView) {
            [_tabView selectRowAtIndexPath:[NSIndexPath indexPathForItem:topcellsection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
            
        }
    }
}
//将结束显示视图
-(void)collectionView:(UICollectionView *)collectionView didEndDisplayingSupplementaryView:(UICollectionReusableView *)view forElementOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    if (_isRelate) {
        NSInteger itemsection = [[[collectionView indexPathsForVisibleItems]firstObject]section];
        if (collectionView == _collectionView) {
            
            //当collectionView滑动时，tableView的cell自动选中相应的分类
            [_tabView selectRowAtIndexPath:[NSIndexPath indexPathForItem:itemsection inSection:0] animated:YES scrollPosition:UITableViewScrollPositionMiddle];
        }
        
    }
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    
    _isRelate = YES;
}



#pragma mark 返回这个UICollectionView是否可以被选择
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.backgroundColor = [UIColor redColor];
    MYLOG(@"%ld--%ld-%ld",(long)indexPath.item,(long)indexPath.section,(long)indexPath.row);
    JDLBuyViewController *buyVC = [[JDLBuyViewController alloc]init];
    [self.navigationController pushViewController:buyVC animated:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end