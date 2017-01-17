//
//  JDLTypeView.h
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/4/21.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol JDLTypeViewDelegete <NSObject>

-(void)btnindex:(int) tag;

@end

@interface JDLTypeView : UIView
@property(nonatomic)float height;
@property(nonatomic)int seletIndex;
@property (nonatomic,retain) id<JDLTypeViewDelegete> delegate;

-(instancetype)initWithFrame:(CGRect)frame andDatasource:(NSArray *)arr :(NSString *)typename;

@end
