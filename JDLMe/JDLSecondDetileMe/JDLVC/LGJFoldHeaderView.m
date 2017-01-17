//
//  LGJFoldHeaderView.m
//  bread
//
//  Created by 傅登慧 on 16/04/24.
//  Copyright © 2016年 傅登慧. All rights reserved.
//

#import "LGJFoldHeaderView.h"

@implementation LGJFoldHeaderView
{
    BOOL _created;/**< 是否创建过 */
    UIImageView *_images;/**< 图标 */
    UILabel *_titleLabel;/**< 标题 */
    UIImageView *_imageView;//right、down图片
    UIButton *_btn;/**< 收起按钮 */
    BOOL _canFold;/**< 是否可展开 */
    JDLFav_shop *_storeModel;
    //section
    NSInteger _store_section;
    
}

- (void)setFoldSectionHeaderViewWithTitle:(NSString *)title andImage:(NSString *)image section:(NSInteger)section canFold:(BOOL)canFold {
    if (!_created) {
        [self creatUI];
    }
    _titleLabel.text = title;
    _images.image=[UIImage imageNamed:image];
    
    _section = section;
    _canFold = canFold;
}
-(void)setCollectionStoreModel:(JDLFav_shop *)CollectionStoreModel andsection_store:(NSInteger)section_store
{

    _storeModel = CollectionStoreModel;
    _store_section = section_store;
}
- (void)setFoldSectionHeaderViewWithTitle:(NSInteger)section canFold:(BOOL)canFold
{

    if (!_created) {
        [self creatUI];
    }
    _section = section;
    _canFold = canFold;
}

- (void)creatUI {
    _created = YES;
    UIView *view_dj = [[UIView alloc]initWithFrame:CGRectMake(0, 0, screen_Width-65, 100)];
    
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(20, 20, 60, 60)];
    [imageview sd_setImageWithURL:[NSURL URLWithString:_storeModel.url] placeholderImage:[UIImage imageNamed:@"bg_home_hot"]];
    UILabel  *lab = [[UILabel alloc]initWithFrame:CGRectMake(95, 43, 300, 15)];
    lab.text =  _storeModel.name;
    lab.font = [UIFont systemFontOfSize:13.0f];
    lab.textColor = [UIColor blackColor];
    [self.contentView addSubview:lab];
    //按钮
    _btn = [UIButton buttonWithType:UIButtonTypeCustom];
    _btn.frame = CGRectMake(screen_Width-20-33, 33, 33, 33);
    [_btn setBackgroundImage:[UIImage imageNamed:@"btn_downward"] forState:UIControlStateNormal];
    [_btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap2Click:)];
    [view_dj addGestureRecognizer:tap1];
    self.contentView.backgroundColor = [UIColor whiteColor];
    [view_dj addSubview:imageview];
    [view_dj addSubview:lab];
    [self.contentView addSubview:_btn];
    [self.contentView addSubview:view_dj];
}

- (void)setFold:(BOOL)fold {
    _fold = fold;
}

- (void)tap2Click:(UITapGestureRecognizer*)sender{
    
    [self.delegate section_store:_store_section];
}
#pragma mark = 按钮点击事件
- (void)btnClick:(UIButton *)sender {
    MYLOG(@"canFold=%@",_canFold?@"YES":@"NO");
    if (_canFold) {
        if ([self.delegate respondsToSelector:@selector(foldHeaderInSection:)]) {
            [self.delegate foldHeaderInSection:_section];
        }
    }
}


@end
