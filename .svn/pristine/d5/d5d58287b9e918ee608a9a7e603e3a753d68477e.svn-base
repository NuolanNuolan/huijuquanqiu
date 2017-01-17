//
//  LGJFoldHeaderView.h
//  bread
//
//  Created by 傅登慧 on 16/04/24.
//  Copyright © 2016年 傅登慧. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JDLFav_shop.h"
@protocol FoldSectionHeaderViewDelegate <NSObject>

- (void)foldHeaderInSection:(NSInteger)SectionHeader;
-(void)section_store:(NSInteger)section_store;

@end

@interface LGJFoldHeaderView : UITableViewHeaderFooterView

@property(nonatomic, assign) BOOL fold;/**< 是否折叠 */
@property(nonatomic, assign) NSInteger section;/**< 选中的section */
@property(nonatomic, weak) id<FoldSectionHeaderViewDelegate> delegate;/**< 代理 */

@property(nonatomic, assign)CGFloat width;

- (void)setFoldSectionHeaderViewWithTitle:(NSString *)title andImage:(NSString *)image section:(NSInteger)section canFold:(BOOL)canFold;

- (void)setFoldSectionHeaderViewWithTitle:(NSInteger)section canFold:(BOOL)canFold;

-(void)setCollectionStoreModel:(JDLFav_shop*)CollectionStoreModel andsection_store:(NSInteger)section_store ;

@end
