//
//  MainContainer_pubViewController.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/7/13.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "BaseViewController.h"

@interface MainContainer_publicViewController : BaseViewController<UIScrollViewDelegate>
@property (strong, nonatomic) IBOutlet UIScrollView *smallScrollView;
@property (strong, nonatomic) IBOutlet UIScrollView *bigScrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageview_fengmian;
@property(nonatomic,strong)NSString *navTitle;
@property(strong,nonatomic)NSString *prID;
@property(nonatomic,strong)NSString *city_id;
@end
