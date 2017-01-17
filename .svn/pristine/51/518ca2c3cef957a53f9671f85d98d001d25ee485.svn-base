//
//  JDLHomeViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/3/17.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLHomeViewController.h"
#import "JDLCategoryViewController.h"
#import "JDLSearchViewController.h"
#import "JDLDetailTableViewCell.h"
#import "JDLSecondTableViewCell.h"
#import "JDLSevenTableViewCell.h"
#import "JDLEightTableViewCell.h"
#import "JDLThirdTableViewCell.h"
#import "JDLFiveTableViewCell.h"
#import "JDLTenTableViewCell.h"
#import "JDLNineTableViewCell.h"
#import "JDLSixTableViewCell.h"
#import "JDLAllShopingTableViewCell.h"
#import "JDLDetailModel.h"
#import "JDLHotViewController.h"
#import "JDLDayTuiJianViewController.h"
#import "JDLSecondModel.h"
#import "JDLAllShopingModel.h"
#import "XLPopMenuViewModel.h"
#import "XLPopMenuViewSingleton.h"
#import "ScanViewController.h"
#import "JDLBuyViewController.h"
#import "JDLTenModel.h"
#import "JDLRedViewController.h"
#import "JDLMessageViewController.h"
#import "JDLDetailTwoModel.h"
#import "JDLTopModel.h"
#import "HLActionSheet.h"
#import "JDLLovedModel.h"
#import "MainContainerViewController.h"
#import "MainContainer_publicViewController.h"
@interface JDLHomeViewController ()<UMSocialUIDelegate,UITableViewDataSource,UITableViewDelegate,SDCycleScrollViewDelegate,SecondCellMoreButtonDelegate,JDLDetailTableViewCellDelegate1,JDLDetailTableViewCellDelegate2,JDLSecondTableViewCellDelegate1,ScanViewDelegate,JDLNineTableViewCellDelegate1,JDLNineTableViewCellDelegate1,TenCellMoreChinaDetail1Delegate,AllShopingCellDelegate>


{
    //  广告sc
    UIScrollView *_adScrollView;
	//滚动视图URL
	NSMutableArray *_Top_Url_array;
    //  装载广告页数据的数组
    NSMutableArray *_Top_AdArray;
	//    记录页数
	NSInteger _page;
    //  创建分页器
    UIPageControl *_pageControl;
    //  首页
    UITableView *_detailTabView;
    NSArray *_btnArr;
//	热卖单品数据的数组
    NSMutableArray *_hotArray;
//	品牌推荐
	NSMutableArray *_hotTwoArr;
//汇聚精选国家最热数据的数组
	NSMutableArray *_worldArr;
	//每日推荐数组
	NSMutableArray *_DayArr;
//	全部商品数据的数组
	NSMutableArray *_allArr;
	//猜你喜欢
	NSMutableArray *_lovedArr;
//	大牌来了
	NSMutableArray *_daPaiArr;
	//下拉刷洗控件
	MJRefreshBackNormalFooter *refreshFooter;
	
    JDLDetailModel *_model_Detail;
    JDLSecondModel *_model_Second;
    JDLAllShopingModel *_model_All;
	JDLTenModel *_tenModel;

//	分享的数组
	NSArray *_titleArr;
	NSArray *_imageArr;
}
@property (nonatomic,strong) NSMutableArray *arr;
@property(nonatomic,strong)MBProgressHUD *hud;
@end

@implementation JDLHomeViewController

-(void)viewWillAppear:(BOOL)animated{

//	//    [self.tabBarController.tabBar setHidden:NO];
	
}
- (void)viewDidLoad {
    [super viewDidLoad];
//    _dataArray = [[NSMutableArray alloc]init];
	[[NSNotificationCenter defaultCenter]removeObserver:self];
    [self navTitle:@"首页"];
    [self createDetailTabView];
	[self createScrollView];
	[self loadData];
	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]||[[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]) {
		[self createNavLeftItem];
	}
	
//    [self createRightItem];
	[self creatRefresh];
}



#pragma mark 添加上拉，下拉加载
-(void)creatRefresh{
	
	MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(headerRefreshing)];
	_detailTabView.header = refreshHeader;
	
	refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(footerRereshing)];
	_detailTabView.footer = refreshFooter;
	
	
}


//  下拉刷新
-(void)headerRefreshing{
    
    
	
	if (_lovedArr.count>0) {
////		先删除旧数据
	[_lovedArr removeAllObjects];
	}
	if (_Top_AdArray.count>0) {
		[_Top_AdArray removeAllObjects];
	}
	if (_hotArray.count>0) {
		[_hotArray removeAllObjects];
	}
	if(_hotTwoArr.count>0){
	
		[_hotTwoArr removeAllObjects];
	}
	if(_worldArr.count>0)
	{
	
		[_worldArr removeAllObjects];
		
	}
	if (_DayArr.count>0) {
		[_DayArr removeAllObjects];
	}
	if (_allArr.count>0) {
		[_allArr removeAllObjects];
	}
	[self loadData];
}

//  上拉加载
-(void)footerRereshing{
	[refreshFooter noticeNoMoreData];
}


-(void)loadData{
//	轮播图的
	[JDLTopModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
		if(error==nil){
			if(objects){
				
				_Top_AdArray = [NSMutableArray arrayWithArray:objects];
				
			}
		}else{
			MYLOG(@"get list error=%@----",error);
			
			
			
			
			[MBProgressHUD showError:@"服务器繁忙"];
			//结束刷新动画
			[_detailTabView.header  endRefreshing];
			[_detailTabView.footer  endRefreshing];
		}
		dispatch_async(dispatch_get_main_queue(), ^{
			// 更UI
			[self createScrollView];
			
		});
	}];

//	热卖单品的
	[JDLDetailModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
		if(error==nil){
			if(objects){
				_hotArray = [NSMutableArray arrayWithArray:objects];
				
				[_detailTabView reloadData];
				//结束刷新动画
				[_detailTabView.header  endRefreshing];
				[_detailTabView.footer  endRefreshing];
				
			}
		}else{
			MYLOG(@"get list error=%@",error);
			//结束刷新动画
			[_detailTabView.header  endRefreshing];
			[_detailTabView.footer  endRefreshing];
		}
	}];
	
//	热卖单品右边的品牌推荐
	[JDLDetailTwoModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
		if(error==nil){
			if(objects){
				_hotTwoArr = [NSMutableArray arrayWithArray:objects];
				
				[_detailTabView reloadData];
			}
		}else{
			MYLOG(@"get list error=%@",error);
			//结束刷新动画
			[_detailTabView.header  endRefreshing];
			[_detailTabView.footer  endRefreshing];
		}
	}];
	
	//汇聚精选的
	[JDLTenModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
		if(error==nil){
			if(objects){
				_worldArr = [NSMutableArray arrayWithArray:objects];
				[_detailTabView reloadData];
			}
		}else{
			MYLOG(@"get list error=%@",error);
			//结束刷新动画
			[_detailTabView.header  endRefreshing];
			[_detailTabView.footer  endRefreshing];
		}
	}];
	
	//	每日推荐的
	[JDLSecondModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
		if(error==nil){
			if(objects){
				_DayArr = [NSMutableArray arrayWithArray:objects];
				[_detailTabView reloadData];
			}
		}else{
			MYLOG(@"get list error=%@",error);
			//结束刷新动画
			[_detailTabView.header  endRefreshing];
			[_detailTabView.footer  endRefreshing];
		}
	}];
	
//	全部商品的
	[JDLAllShopingModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
		if(error==nil){
			if(objects){
				_allArr = [NSMutableArray arrayWithArray:objects];
				
				[_detailTabView reloadData];
			}
		}else{
			MYLOG(@"get list error=%@",error);
			//结束刷新动画
			[_detailTabView.header  endRefreshing];
			[_detailTabView.footer  endRefreshing];
		}
	}];
	//猜你喜欢
	[JDLLovedModel getObjectsWithCompletion:^(NSArray *objects, NSError *error) {
		if (error==nil) {
			if (objects) {
				_lovedArr = [NSMutableArray arrayWithArray:objects];
				[_detailTabView reloadData];
			}
		}
		else
		{
		
			MYLOG(@"get list error = %@",error);
			//结束刷新动画
			[_detailTabView.header  endRefreshing];
			[_detailTabView.footer  endRefreshing];
		}
		
	}];

}


#pragma mark - 创建广告循环滚动
-(void)createScrollView{
	NSMutableArray *imagesURLStrings = [[NSMutableArray alloc]initWithCapacity:0];
	NSMutableArray *top_arr = [[NSMutableArray alloc]initWithCapacity:0];
	_Top_Url_array = [[NSMutableArray alloc]initWithCapacity:0];

	if(_Top_AdArray.count>0){
		JDLTopModel* topmodel = [_Top_AdArray objectAtIndex:0];
		top_arr =  topmodel.Array_Top;
		for (int i = 0; i<top_arr.count; i++) {
			
			[imagesURLStrings addObject:[[top_arr objectAtIndex:i]objectForKey:@"img"]];
			[_Top_Url_array addObject:[[top_arr objectAtIndex:i]objectForKey:@"url"]];
			float h = screen_Width / 414.0f * 200;
			UIView *adView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, h)];
			adView.backgroundColor = [UIColor whiteColor];
			
			SDCycleScrollView *cycleScrollView3 = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, adView.frame.size.width, adView.frame.size.height) delegate:self placeholderImage:[UIImage imageNamed:@""]];
			cycleScrollView3.currentPageDotImage = [UIImage imageNamed:@"pic_banner_pre"];
			cycleScrollView3.pageDotImage = [UIImage imageNamed:@"pic_banner"];
			cycleScrollView3.placeholderImage = [UIImage imageNamed:@"bg_home_banner"];
			cycleScrollView3.imageURLStringsGroup = imagesURLStrings;
			cycleScrollView3.autoScrollTimeInterval = 3;
			[adView addSubview:cycleScrollView3];
			
			_detailTabView.tableHeaderView = adView;
		}
	}
	
	
	
//    NSArray *imagesURLStrings = @[];
	
	
}



#pragma mark - 设置左边分类按钮
-(void)createNavLeftItem{
	
	self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(screen_Width - 30, 0, 20, 20) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"icon_share"] highlightedImage:[UIImage imageNamed:@"icon_share"] target:self SEL:@selector(createViewClick1)]];
    
}

-(void)createViewClick1{
	
	if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]&&![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]){
		NSArray *titles = @[@"发送给朋友",@"分享到朋友圈"];
		NSArray *imageNames = @[@"btn_share_wechat",@"btn_share_circleoffriends"];
		HLActionSheet *sheet = [[HLActionSheet alloc] initWithTitles:titles iconNames:imageNames];
		[sheet showActionSheetWithClickBlock:^(int btnIndex) {
			MYLOG(@"btnIndex:%d",btnIndex);
			if (btnIndex == 0) {
				[self createwechat];
				
			}
			else if (btnIndex == 1){
				[self createcircleoffriends];
			}
			
		} cancelBlock:^{
			MYLOG(@"取消");
		}];

	}
	else if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"mqq://"]]&&![[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"weixin://"]]){
	
		NSArray *titles = @[@"分享给qq好友",@"分享到QQ空间"];
		NSArray *imageNames = @[@"btn_share_qq",@"btn_share_qzone"];
		HLActionSheet *sheet = [[HLActionSheet alloc] initWithTitles:titles iconNames:imageNames];
		[sheet showActionSheetWithClickBlock:^(int btnIndex) {
			MYLOG(@"btnIndex:%d",btnIndex);
			if (btnIndex == 0) {
				[self createqq];
				
			}
			else if (btnIndex == 1){
				[self createqzone];
			}
			
		} cancelBlock:^{
			MYLOG(@"取消");
		}];

	}
	else{
		
		NSArray *titles = @[@"发送给朋友",@"分享到朋友圈",@"分享给qq好友",@"分享到QQ空间"];
		NSArray *imageNames = @[@"btn_share_wechat",@"btn_share_circleoffriends",@"btn_share_qq",@"btn_share_qzone"];
		HLActionSheet *sheet = [[HLActionSheet alloc] initWithTitles:titles iconNames:imageNames];
		[sheet showActionSheetWithClickBlock:^(int btnIndex) {
			MYLOG(@"btnIndex:%d",btnIndex);
			if (btnIndex == 0) {
				[self createwechat];
				
			}
			else if (btnIndex == 1){
				[self createcircleoffriends];
			}
			else if (btnIndex == 2){
				
				[self createqq];
			}
			else if (btnIndex == 3){
				
				[self createqzone];
			}
			
		} cancelBlock:^{
			MYLOG(@"取消");
		}];
	}

}



-(void)createViewClick{
//	[leftBtn setImage:[UIImage imageNamed:@"nav_classification"] forState:UIControlStateNormal];
	if (!_arr)
	{
		_arr = [[NSMutableArray alloc] init];
		for (int i = 0; i < [self titles].count; i++) {
			XLPopMenuViewModel *model = [[XLPopMenuViewModel alloc] init];
			model.image = [self images][i];
			model.title = [self titles][i];
			[_arr addObject:model];
			
		}
	}
	// 弹出框的宽度
	CGFloat menuViewWidth = 130;
	// 弹出框的左上角起点坐标
	CGPoint startPoint = CGPointMake([UIScreen mainScreen].bounds.size.width - screen_Width-menuViewWidth+20, 64+10);
	
	[[XLPopMenuViewSingleton shareManager] creatPopMenuWithFrame:startPoint popMenuWidth:menuViewWidth popMenuItems:_arr action:^(NSInteger index) {
		if (index == 0) {
			MYLOG(@"扫一扫");
			ScanViewController *scanVc = [[ScanViewController alloc]init];
			//	[self.tabBarController.tabBar setHidden:YES];
			self.navigationController.navigationBarHidden = YES;
			[self.navigationController pushViewController:scanVc animated:YES];
		}
		else if (index==1)
			
		{
		
			NSArray *titles = @[@"发送给朋友",@"分享到朋友圈",@"分享到QQ空间",@"分享给qq好友"];
			NSArray *imageNames = @[@"btn_share_wechat",@"btn_share_circleoffriends",@"btn_share_qzone",@"btn_share_qq"];
			HLActionSheet *sheet = [[HLActionSheet alloc] initWithTitles:titles iconNames:imageNames];
			[sheet showActionSheetWithClickBlock:^(int btnIndex) {
				MYLOG(@"btnIndex:%d",btnIndex);
				if (btnIndex == 0) {
					//分享 设置微信key 和分享的url
					[UMSocialWechatHandler setWXAppId:@"wxa8235233746fd58d" appSecret:@"2878950da9ddbf2f03e2839d6e3d7a05" url:[NSString stringWithFormat:@"www.quanqiuhuiju.com"]];
					[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"wxsession"];
					
				}
				else if (btnIndex == 1){
					//分享 设置微信key 和分享的url
					[UMSocialWechatHandler setWXAppId:@"wxa8235233746fd58d" appSecret:@"2878950da9ddbf2f03e2839d6e3d7a05" url:[NSString stringWithFormat:@"www.quanqiuhuiju.com"]];
					
					[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"wxtimeline"];
					
				}
				else if (btnIndex == 2){
					[UMSocialQQHandler setQQWithAppId:@"1105288723" appKey:@"dNFshWl2TiPvn3YW" url:@"www.quanqiuhuiju.com"];
//					传入的分享的内容Text
					[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"qzone"];
					
				}
				else if (btnIndex == 3){
					[UMSocialQQHandler setQQWithAppId:@"1105288723" appKey:@"dNFshWl2TiPvn3YW" url:@"www.quanqiuhuiju.com"];
					
					[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"qq"];
					
				}
				
			} cancelBlock:^{
				MYLOG(@"取消");
			}];

		}
		else if (index==2)
		{
			JDLMessageViewController *mess = [[JDLMessageViewController alloc]init];
			//	[self.tabBarController.tabBar setHidden:YES];
			[self.navigationController pushViewController:mess animated:YES];
		}
	}];
}


- (NSArray *)titles
{
    return @[@"扫一扫",
             @"分享",
             @"消息",
             ];
}

- (NSArray *) images {
    return @[@"icon_scan",
             @"icon_share",
             @"icon_message",
             ];
}


#pragma mark - 设置右侧搜索按钮
-(void)createRightItem{
	
	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(screen_Width - 30, 0, 20, 20) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_search"] highlightedImage:[UIImage imageNamed:@"nav_search(1)"] target:self SEL:@selector(rightBtnClick:)]];
}


-(void)rightBtnClick:(UIButton *)btn{
	JDLSearchViewController *search = [[JDLSearchViewController alloc]init];
	[self.navigationController pushViewController:search animated:NO];
}

-(void)JDLgoTableviewTop
{

	[_detailTabView setContentOffset:CGPointMake(0,-64) animated:YES];
}


#pragma mark - 创建tabView
-(void)createDetailTabView{
	
    _detailTabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)style:UITableViewStylePlain];
    _detailTabView.backgroundColor = [UIColor whiteColor];
    _detailTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
	_detailTabView.showsVerticalScrollIndicator =NO;
    _detailTabView.delegate = self;
    _detailTabView.dataSource = self;
    [self.view addSubview:_detailTabView];
	
	//获取通知中心单例对象
	NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
	//添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
	[center addObserver:self selector:@selector(JDLgoTableviewTop) name:@"123" object:nil];
	
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SDCycleScrollViewDelegate广告循环代理

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index{
    
    MYLOG(@"---点击了第%ld张图片", (long)index);
	JDLWebViewController *webview = [[JDLWebViewController alloc]initWith_web_url:_Top_Url_array[index]];
	//	[self.tabBarController.tabBar setHidden:YES];
	[self.navigationController pushViewController:webview animated:YES];
	
}



#pragma mark - detailView的代理
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

	if (_lovedArr.count>0) {
		JDLLovedModel *lovemodel_arr = [_lovedArr objectAtIndex:0];
		
		NSMutableArray *_data = [NSMutableArray arrayWithCapacity:0];
		_data =[[[[lovemodel_arr.LovedArr objectAtIndex:0]objectForKey:@"info"]objectAtIndex:0]objectForKey:@"goods"];
		return 11+_data.count/2;
	}
	return 11;
	
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
		if (indexPath.row == 0) {
			
		static NSString *cellID = @"Cellname";
		JDLThirdTableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID];
		cell1 = [[[NSBundle mainBundle] loadNibNamed:@"JDLThirdTableViewCell" owner:self options:nil] lastObject];
        cell1.btnArr = _btnArr;
        cell1.delegate = self;
        cell1.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell1;
        
    }
		else if (indexPath.row == 1){
//		热卖单品的cell
		static NSString *cellID = @"cEllname";
		JDLDetailTableViewCell *cell2 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell2) {
			cell2 = [[[NSBundle mainBundle] loadNibNamed:@"JDLDetailTableViewCell" owner:self options:nil] lastObject];
		}
        //   去除cell的点击效果
        cell2.delegate1 = self;
        cell2.delegate2 = self;
		if (_hotArray.count > 0&&_hotTwoArr.count>0) {
			JDLDetailModel *detailmodel = [_hotArray objectAtIndex:0];
			JDLDetailTwoModel *detailtwomodel = [_hotTwoArr objectAtIndex:0];
			[cell2 setDetailModel:detailmodel];
			[cell2 setDetailTwoModel:detailtwomodel];
			
		}

        cell2.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell2;
    }
    else if(indexPath.row == 2){
		static NSString *cellID = @"celLnaMe";
		JDLFiveTableViewCell *cell3 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell3) {
			cell3 = [[[NSBundle mainBundle] loadNibNamed:@"JDLFiveTableViewCell" owner:self options:nil] lastObject];
		}
		cell3.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell3;
    }

    else if(indexPath.row == 3 ){
//		汇聚精选的cell
		
		static NSString *cellID = @"ceLlname";
		JDLTenTableViewCell *cell4 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell4) {
			cell4 = [[[NSBundle mainBundle] loadNibNamed:@"JDLTenTableViewCell" owner:self options:nil] lastObject];
		}
		cell4.delegate1 = self;
		if (_worldArr.count>0) {
			JDLTenModel *tenModel = [_worldArr objectAtIndex:indexPath.row-3];
			[cell4 setTenModel:tenModel];
		}
		
		
        cell4.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell4;
    }
    else if(indexPath.row == 4){
		static NSString *cellID = @"cellName";
		JDLSixTableViewCell *cell5 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell5) {
			cell5 = [[[NSBundle mainBundle] loadNibNamed:@"JDLSixTableViewCell" owner:self options:nil] lastObject];
		}
        cell5.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell5;
    }
    else if(indexPath.row == 5 ){
//		每日推荐的cell
		
		static NSString *cellID = @"cellnAme";
		JDLSecondTableViewCell *cell6 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell6) {
			cell6 = [[[NSBundle mainBundle] loadNibNamed:@"JDLSecondTableViewCell" owner:self options:nil] lastObject];
		}
		cell6.delegate2 =self;
		if(_DayArr.count>0){
			JDLSecondModel *secondModel = [_DayArr objectAtIndex:0];
			_model_Second = secondModel;
			[cell6 setSecondmodel:secondModel];
		}
		
        cell6.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell6;
    }
    else if(indexPath.row == 6){
		static NSString *cellID = @"cEllname";
		JDLSevenTableViewCell *cell7 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell7) {
			cell7 = [[[NSBundle mainBundle] loadNibNamed:@"JDLSevenTableViewCell" owner:self options:nil] lastObject];
		}
        cell7.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell7;
    }
    else if(indexPath.row == 7 ){
//		全部商品的cell
		static NSString *cellID = @"cEllname";
		JDLAllShopingTableViewCell *cell8 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell8) {
			cell8 = [[[NSBundle mainBundle] loadNibNamed:@"JDLAllShopingTableViewCell" owner:self options:nil] lastObject];
		}
		cell8.selectionStyle = UITableViewCellSelectionStyleNone;
		cell8.delegate=self;
		if (_allArr.count > 0) {
//			JDLAllShopingModel *allShopingModel = [_allArr objectAtIndex:indexPath.row-7];
//			[cell8 setModel1:allShopingModel];
//			[cell8 setModel2:allShopingModel];
			cell8.model1 = _allArr[indexPath.row-7];
			cell8.model2 = _allArr[indexPath.row-6];
			cell8.model3 =_allArr[indexPath.row-5];
			cell8.model4 =_allArr[indexPath.row-4];
			cell8.model5 = _allArr[indexPath.row-3];
		}
		
		cell8.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell8;
    }
	else if(indexPath.row == 8 ){
		static NSString *cellID = @"cEllname";
		JDLAllShopingTableViewCell *cell8 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell8) {
			cell8 = [[[NSBundle mainBundle] loadNibNamed:@"JDLAllShopingTableViewCell" owner:self options:nil] lastObject];
		}
		cell8.selectionStyle = UITableViewCellSelectionStyleNone;
		cell8.delegate=self;
		if (_allArr.count > 0) {
			
			cell8.model1 = _allArr[indexPath.row-3];
			cell8.model2 = _allArr[indexPath.row-2];
			cell8.model3 =_allArr[indexPath.row-1];
			cell8.model4 =_allArr[indexPath.row];
			cell8.model5 = _allArr[indexPath.row+1];
		}
		
		cell8.selectionStyle = UITableViewCellSelectionStyleNone;
		return cell8;
	}
	else if(indexPath.row == 9 ){
		static NSString *cellID = @"cEllname";
		JDLAllShopingTableViewCell *cell8 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell8) {
			cell8 = [[[NSBundle mainBundle] loadNibNamed:@"JDLAllShopingTableViewCell" owner:self options:nil] lastObject];
		}
		cell8.selectionStyle = UITableViewCellSelectionStyleNone;
		cell8.delegate=self;
		if (_allArr.count > 0) {
			cell8.model1 = _allArr[indexPath.row+1];
			cell8.model2 = _allArr[indexPath.row+2];
			cell8.model3 =_allArr[indexPath.row+3];
			cell8.model4 =_allArr[indexPath.row+4];
			cell8.model5 = _allArr[indexPath.row+5];
		}
		
		return cell8;
	}

    else if(indexPath.row == 10){
		static NSString *cellID = @"cEllname";
		JDLEightTableViewCell *cell9 = [tableView dequeueReusableCellWithIdentifier:cellID];
		if (!cell9) {
			cell9 = [[[NSBundle mainBundle] loadNibNamed:@"JDLEightTableViewCell" owner:self options:nil] lastObject];
		}
        cell9.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell9;
    }
    else{
//		猜你喜欢的cell
		static NSString *ID = @"cEllname";
		JDLNineTableViewCell *cell10 = [tableView dequeueReusableCellWithIdentifier:ID];
		if (!cell10) {
			cell10 =[[[NSBundle mainBundle]loadNibNamed:@"JDLNineTableViewCell" owner:self options:nil]lastObject];
		}
		if (_lovedArr.count>0) {
			JDLLovedModel *lovemodel_arr = [_lovedArr objectAtIndex:0];
			[cell10 setNinemodel:lovemodel_arr andindex:indexPath.row-10];
		}
        cell10.delegate = self;
		//原价的删除线效果
		NSUInteger length = [cell10.presentLab1.text length];
		NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:cell10.presentLab1.text];
		[attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
		[attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, length)];
		[cell10.presentLab1 setAttributedText:attri];
		cell10.selectionStyle=UITableViewCellAccessoryNone;
		
		NSUInteger lengthTwo = [cell10.presentLab2.text length];
		NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:cell10.presentLab2.text];
		[attr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, lengthTwo)];
		[attr addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, lengthTwo)];
		[cell10.presentLab2 setAttributedText:attri];
		
        cell10.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell10;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
		
		tabViewCellhigh(44,44,44);
    }else if (indexPath.row == 1){
		
		tabViewCellhigh(125,125,125);
    }
    else if(indexPath.row == 2 || indexPath.row == 4 || indexPath.row == 6 || indexPath.row == 10){

		tabViewCellhigh(50,50,50);
    }
    else if (indexPath.row == 3 ){

		tabViewCellhigh(187,187,187);
		
    }
	else if(indexPath.row == 7 || indexPath.row == 8 ||indexPath.row == 9){

		tabViewCellhigh(75,75,75);
    }
    else if(indexPath.row == 5 ){
		
		tabViewCellhigh(353,353,353);
    }
    else{
		
		tabViewCellhigh(274,274,274);
    }
}





#pragma mark - TabView的代理方法

-(void)ThirdClick{
   
    [self.tabBarController setSelectedIndex:1];

}

-(void)ThirdClick1{
    
    [self.tabBarController setSelectedIndex:2];

}

-(void)ThirdClick2
{
//	if (![LoginModel isLogin]) {
//		JDLLoggingViewController *login = [[JDLLoggingViewController alloc] init];
//		//	[self.tabBarController.tabBar setHidden:YES];
//		[self.navigationController pushViewController:login animated:YES];
//	}else{
//		JDLRedViewController *Red = [[JDLRedViewController alloc]init];
//		//	[self.tabBarController.tabBar setHidden:YES];
//		[self.navigationController pushViewController:Red animated:YES];
//	}
//	[MBProgressHUD showSuccess:@"暂为开放"];
}



#pragma mark  //所有跳转
//分类按钮点击
-(void)ThirdClick3{
//    JDLCategoryViewController *categroyVc = [[JDLCategoryViewController alloc]init];
//    //	[self.tabBarController.tabBar setHidden:YES];
//    [self.navigationController pushViewController:categroyVc animated:YES];
	
}

////热卖单品点击
- (void)pushToModel1Detail:(NSString *)id_hot{
	JDLHotViewController * hot = [[JDLHotViewController alloc]initWith_Hot_ID:id_hot];
//	//	[self.tabBarController.tabBar setHidden:YES];
	[self.navigationController pushViewController:hot animated:YES];
}
//品牌推荐点击
-(void)pushToModel2Detail:(NSString *)detailTwoName{
	
//	JDLPublicDetileViewController *publicVC = [[JDLPublicDetileViewController alloc]initWith_Pr_ID:detailTwoName];
//	publicVC.navTitle = @"品牌推荐";
//	//	[self.tabBarController.tabBar setHidden:YES];
//	[self.navigationController pushViewController:publicVC animated:YES];
	
	
	MainContainer_publicViewController *vc = [[MainContainer_publicViewController alloc]initWithNibName:@"MainContainer_publicViewController" bundle:nil];
	vc.prID=detailTwoName;
	vc.navTitle=@"品牌推荐";
	[self.navigationController pushViewController:vc animated:YES];
	
}
//汇聚精选跳转中国馆世界观二级界面
-(void)tap1Click_Second{
    MYLOG(@"每日推荐");
	
}
//每日推荐
- (void)pushToModel1Second:(NSString *)DayTJ_ID
{

	
	JDLDayTuiJianViewController * DayTuiJian = [[JDLDayTuiJianViewController alloc]initWith_Day_ID:DayTJ_ID];
	
	//	[self.tabBarController.tabBar setHidden:YES];
	[self.navigationController pushViewController:DayTuiJian animated:YES];
	
}
-(void)pushToChinaDetail1:(NSString *)Name
{

	MYLOG(@"%@",Name);
	
//	JDLPublicDetileViewController *publicVC = [[JDLPublicDetileViewController alloc]initWith_Pr_ID:Name];
//	publicVC.navTitle = @"汇聚精选";
//	//	[self.tabBarController.tabBar setHidden:YES];
//	[self.navigationController pushViewController:publicVC animated:YES];
	
	
	MainContainer_publicViewController *vc = [[MainContainer_publicViewController alloc]initWithNibName:@"MainContainer_publicViewController" bundle:nil];
	vc.prID=Name;
	vc.navTitle=@"汇聚精选";
	[self.navigationController pushViewController:vc animated:YES];
	
}

////全部商品点击
-(void)sendAllShopingModel:(JDLAllShopingModel *)model
{

	MainContainerViewController *vc = [[MainContainerViewController alloc]initWithNibName:@"MainContainerViewController" bundle:nil];
	vc.navTitle_AllShop = model.name;
	[self.navigationController pushViewController:vc animated:YES];
}

//购买界面
-(void)pushToNineModelSecond:(NSString *)pid{
    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:pid];
	//	[self.tabBarController.tabBar setHidden:YES];
    [self.navigationController pushViewController:buyVc animated:YES];
}


- (void)scanView:(ScanViewController *)controller didScanedCode:(NSString *)code{

	MYLOG(@"%@",code);
}

-(void)ValueofText:(NSString *)sharetext andValueofSocialName:(NSString *)SocialName{

	//设置分享出去的文字 和图标
	//					NSString *shareText = _webModel.contentSourceName;
	//    NSURL *shareUrl =
	NSString *shareText = sharetext;
	UIImage *shareImage = [UIImage imageNamed:@"huiju.png"];
	
	//是设置ui代理 和 设置分享文字
	[[UMSocialControllerService defaultControllerService] setShareText:shareText shareImage:shareImage socialUIDelegate:self];
	
	//设置分享平台 分享平台wxtimeline
	UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:SocialName];
	snsPlatform.snsClickHandler(self,[UMSocialControllerService defaultControllerService],YES);
	return;
}

-(void)createwechat{

	//分享 设置微信key 和分享的url
	[UMSocialWechatHandler setWXAppId:@"wxa8235233746fd58d" appSecret:@"2878950da9ddbf2f03e2839d6e3d7a05" url:[NSString stringWithFormat:@"www.quanqiuhuiju.com"]];
	[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"wxsession"];
}

-(void)createcircleoffriends{

	//分享 设置微信key 和分享的url
	[UMSocialWechatHandler setWXAppId:@"wxa8235233746fd58d" appSecret:@"2878950da9ddbf2f03e2839d6e3d7a05" url:[NSString stringWithFormat:@"www.quanqiuhuiju.com"]];
	
	[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"wxtimeline"];

}
//qq
-(void)createqq{
	[UMSocialQQHandler setQQWithAppId:@"1105288723" appKey:@"dNFshWl2TiPvn3YW" url:@"www.quanqiuhuiju.com"];
	
	[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"qq"];
	
}
//空间
-(void)createqzone{

	[UMSocialQQHandler setQQWithAppId:@"1105288723" appKey:@"dNFshWl2TiPvn3YW" url:@"www.quanqiuhuiju.com"];
	//					传入的分享的内容Text
	[self ValueofText:@"一切只为品质买单，尽在汇聚全球" andValueofSocialName:@"qzone"];
}

@end
