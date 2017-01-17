//
//  JDLpopupView.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/19.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLBuyView.h"
#import "JDLTypeView.h"
@interface JDLpopupView : UIView<UITextFieldDelegate,UIAlertViewDelegate>
@property(nonatomic, retain)UIView *alphaiView;
@property(nonatomic, retain)UIView *whiteView;
@property(nonatomic,retain)UIImageView *image;
@property(nonatomic,retain)UIButton *deletBtn;

@property(nonatomic,retain)UILabel *priceLab;
@property(nonatomic,retain)UILabel *stockLab;
@property(nonatomic,retain)UILabel *detailLab;
@property(nonatomic,retain)UILabel *lineLab;

@property(nonatomic,retain)UIButton *sureBtn;

@property(nonatomic, retain)UIScrollView *mainscrollview;

@property(nonatomic,retain)JDLBuyView *countView;
@property(nonatomic, retain)JDLTypeView *sizeView;
@property(nonatomic, retain)JDLTypeView *colorView;

@property(nonatomic) int stock;
@end
