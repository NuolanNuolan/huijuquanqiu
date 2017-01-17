//
//  AddrDetailViewController.h
//  ZKAddrList
//
//  Created by 陈婷 on 16/4/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"

@protocol AddrDetailViewControllerDelegate <NSObject>

- (void) saveAddress:(Address*)address isNew:(BOOL) isNew;

@end

@interface AddrDetailViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *phone;
@property (weak, nonatomic) IBOutlet UITextField *Add_DiQu;
@property (weak, nonatomic) IBOutlet UITextField *Add_XX;
@property (nonatomic,weak) id<AddrDetailViewControllerDelegate> delegate;
-(void)setUpViewContent:(Address*)dataModel;
@end
	