//
//  JDLSP_DPSPTableViewCell.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/5/7.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLSP_DPSPTableViewCell.h"
#import "JDLStoredeatail.h"
#import "JDLStore_allshop.h"


@interface JDLSP_DPSPTableViewCell ()<UIScrollViewDelegate>
@end

@implementation JDLSP_DPSPTableViewCell
{
    NSInteger _count;
    UIScrollView *_scroll;
    UIButton *_btn_image;
    JDLFav_shop *_shopmodel;
    JDLStoredeatail *_storemodel;
    JDLStore_allshop *_store_allshopmodel;
    NSMutableArray *_data_arr;
    //全部商品数组
    NSMutableArray *_data_allshoparr;
}

- (id)initWith_count:(NSInteger)count
{

    self = [super init];
    if (self) {
        _count=count;
       [self viewShow];
    }
    return self;
}
-(void)setCollectionStoreModel:(JDLFav_shop*)CollectionStoreModel
{

    _shopmodel =CollectionStoreModel;
    [self load_store];
    
    
}
//查询店铺
-(void)load_store
{

    [JDLStoredeatail getObjectWithId:_shopmodel.pid completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                
                _data_arr = [NSMutableArray arrayWithObject:object];
                if (_data_arr.count>0) {
                    _storemodel = [_data_arr objectAtIndex:0];
                    [self loaddata_all];

                }
                
                
            }
        }else
        {
            
            MYLOG(@"get list error=%@",error);
            
        }
    } ];
}
-(void)loaddata_all
{
    [ JDLStore_allshop getObjectWithId:_storemodel.products_id completion:^(id object, NSError *error) {
        if (error==nil) {
            if (object) {
                _data_allshoparr = [NSMutableArray arrayWithObject:object];
                if (_data_allshoparr.count>0) {
                    _store_allshopmodel = [_data_allshoparr objectAtIndex:0];
                    if (_scroll) {
                        [_scroll removeAllSubviews];
                    }
                    [self viewShow];
                }
            }
        }
        else
        {
            
            MYLOG(@"get list error=%@",error);
            
        }
    }];
}
-(void)viewShow
{
    self.view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, 160)];
    self.view.backgroundColor = [UIColor colorWithRed:214/255.0f green:214/255.0f blue:214/255.0f alpha:1];
    
    _scroll = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 15, SCREEN_WIDTH-5, 130)];
    if (_count<_store_allshopmodel.allshoparr.count) {
        _scroll.contentSize =  CGSizeMake(115*_count, 0);
    }
    else
    {
    
        _scroll.contentSize =  CGSizeMake(115*_store_allshopmodel.allshoparr.count, 0);
    }
    
    _scroll.delegate = self;
    _scroll.bounces = NO;
    _scroll.tag=3000;
    _scroll.showsHorizontalScrollIndicator = NO;
    _scroll.backgroundColor = [UIColor clearColor];
    [self.contentView addSubview:_scroll];
    
    for (int i=0; i<_count; i++) {
        if (i<_store_allshopmodel.allshoparr.count) {
            
            _btn_image = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            _btn_image.frame = CGRectMake(5+i*115, 0, 110, 130);
            [_btn_image sd_setBackgroundImageWithURL:[NSURL URLWithString:[[_store_allshopmodel.allshoparr objectAtIndex:i]objectForKey:@"img"]] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"bg_home_hot"]];
            [_btn_image addTarget:self action:@selector(butVlick_sc:) forControlEvents:UIControlEventTouchUpInside];
            _btn_image.restorationIdentifier=[[_store_allshopmodel.allshoparr objectAtIndex:i]objectForKey:@"pid"];
            
            [_scroll addSubview:_btn_image];
        }
        
        
    }
    [self.view addSubview:_scroll];
    [self.contentView addSubview:self.view];
    
    
}
- (void)butVlick_sc:(UIButton *)btn{

    if (self.delegate) {
        [self.delegate DP_spID:btn.restorationIdentifier];
    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
