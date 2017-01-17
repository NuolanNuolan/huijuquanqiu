//
//  AddrListEditTableViewCell.h
//  ZKAddrList
//
//  Created by 陈婷 on 16/4/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Address.h"

@protocol AddrListEditTableViewCellDelegate <NSObject>

-(void)onAddrDelWithIndex:(NSInteger)index_section_del;
-(void)onAddrEditWithIndex:(NSInteger)index_section;
-(void)onSetDefaultAddrWithIndex:(Address *)addressmodel;
@end

@interface AddrListEditTableViewCell : UITableViewCell
@property (nonatomic) NSInteger index_section;
@property (nonatomic) NSInteger index_section_del;
@property (nonatomic) Address * addressmodel;
@property (weak, nonatomic) IBOutlet UIButton *addr_btn;
@property (nonatomic,weak) id<AddrListEditTableViewCellDelegate> delegate;
@end
