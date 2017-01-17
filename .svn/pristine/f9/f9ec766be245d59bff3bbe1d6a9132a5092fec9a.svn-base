//
//  JDLpub_oneViewController.m
//  GlobalConvergence
//
//  Created by 杭州尖刀连电子商务有限公司 on 16/7/13.
//  Copyright © 2016年 JDL. All rights reserved.
//

#import "JDLpub_oneViewController.h"
#import "JDLPublicDetileTableViewCell.h"
#import "JDLPublickSectionTableViewCell.h"
#import "JDLBuyViewController.h"

@interface JDLpub_oneViewController ()<UITableViewDelegate,UITableViewDataSource,JDLPublicDetileTableViewCellDelegate,UIScrollViewDelegate>

@end

@implementation JDLpub_oneViewController
{

    UITableView *_tableview;
}

- (void)viewDidLoad {
    [super viewDidLoad];
     self.view.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    [self Createtableview];
    // Do any additional setup after loading the view.
}
-(void)Createtableview
{

    _tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height-200-40-64)];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    //透出背景,设置表格无颜色
    _tableview.backgroundColor = [UIColor clearColor];
    _tableview.showsVerticalScrollIndicator =NO;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableview];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JDLPublicDetileTableViewCell *cell = [[[NSBundle mainBundle]loadNibNamed:@"JDLPublicDetileTableViewCell" owner:self options:nil]lastObject];
        if (indexPath.row < 2) {
            
            if (_TJ_arr.count>=4) {
                if(indexPath.row==0)
                {
                    [cell setTJmodel:[_TJ_arr objectAtIndex:indexPath.row] andsetTJmodel:[_TJ_arr objectAtIndex:indexPath.row+1]];
                    MYLOG(@"%@",[_TJ_arr objectAtIndex:indexPath.row]);
                }
                else if(indexPath.row==1)
                {
                    
                    [cell setTJmodel:[_TJ_arr objectAtIndex:indexPath.row+1] andsetTJmodel:[_TJ_arr objectAtIndex:indexPath.row+2]];
                    
                }
                //原价的删除线效果
                NSUInteger length = [cell.lab2.text length];
                NSMutableAttributedString *attri = [[NSMutableAttributedString alloc] initWithString:cell.lab2.text];
                [attri addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, length)];
                [attri addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, length)];
                [cell.lab2 setAttributedText:attri];
                cell.selectionStyle=UITableViewCellAccessoryNone;
                
                NSUInteger lengthTwo = [cell.lab5.text length];
                NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:cell.lab5.text];
                [attr addAttribute:NSStrikethroughStyleAttributeName value:@(NSUnderlinePatternSolid | NSUnderlineStyleSingle) range:NSMakeRange(0, lengthTwo)];
                [attr addAttribute:NSStrikethroughColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, lengthTwo)];
                [cell.lab5 setAttributedText:attri];
                
            }
            cell.delegate = self;
            cell.selectionStyle=UITableViewCellAccessoryNone;
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
//        else{
//            JDLPublickSectionTableViewCell *cell1 = [[[NSBundle mainBundle]loadNibNamed:@"JDLPublickSectionTableViewCell" owner:self options:nil]lastObject];
//            return cell1;
//        }
    
    return cell;
    
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row < 2) {
        if (screen_Width == iphone4_width) {
            return 272;
        }else if (screen_Width == iphone6_width){
            
            return 272;
        }else{
            
            return 272;
        }
    }
    else{
        if (screen_Width == iphone4_width) {
            return 117;
        }else if (screen_Width == iphone6_width){
            
            return 117;
        }else{
            
            return 117;
        }
        
        
    }
}
-(void)BuyViewClick:(NSString *)shop_id
{
    
    JDLBuyViewController *buyVc = [[JDLBuyViewController alloc]initWith_SP_ID:shop_id];
    [self.navigationController pushViewController:buyVc animated:YES];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    [self.delegate Scrow_delegate:scrollView.contentOffset.y];
//    [_tableview setFrame:CGRectMake(0, -scrollView.contentOffset.y, screen_Width, screen_Height)];
}
@end
