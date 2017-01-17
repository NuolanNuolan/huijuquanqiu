//
//  AddrDetailViewController.m
//  ZKAddrList
//
//  Created by 陈婷 on 16/4/13.
//  Copyright © 2016年 zk. All rights reserved.
//

#import "AddrDetailViewController.h"
#import "KJAreaPickerView.h"
#import "KJLocation.h"
#import "Address.h"

@interface AddrDetailViewController ()<UITextFieldDelegate,KJAreaPickerViewDelegate>
@property (nonatomic,copy) NSString* navTitle;
@property (nonatomic, strong) KJAreaPickerView *areaPickerView;
@end

@implementation AddrDetailViewController
{

    Address * _address;
     BOOL isNew;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self Dismiss];
    dismiss_w;
    // Do any additional setup after loading the view.
}
#pragma mark - 设置左边返回按钮
-(void)Dismiss{
    
    
    self.view.backgroundColor = [UIColor colorWithRed:252/255.0f green:252/255.0f blue:252/255.0f alpha:1];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:[PublicClass createButtonWithFrame:CGRectMake(0, 0, 12, 22) title:nil titleColor:nil normalImage:[UIImage imageNamed:@"nav_return.png"] highlightedImage:[UIImage imageNamed:@"nav_return(1)"] target:self SEL:@selector(createViewClick)]];
}
-(void)createViewClick
{
    //	[self.tabBarController.tabBar setHidden:YES];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated{
    [self setUpSubView];
}

-(void)setUpSubView{
    //设置nav标题
    self.navigationItem.title = self.navTitle;
    _Add_DiQu.delegate =self;
    _name.text = _address.name;
    _phone.text =_address.tel;
    _Add_DiQu.text =_address.area;
    _Add_XX.text = _address.address;

    
}

-(void)setUpViewContent:(Address*)dataModel{
    if (!dataModel) {
        _address = [[Address alloc]init];
        self.navTitle = @"新建联系人";
        isNew = TRUE;
    }else{
        _address = dataModel;
        self.navTitle = @"编辑联系人";
        isNew = false;
    }
}
#pragma mark - 实现textfield的代理
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField) {
        [textField resignFirstResponder];
    }
    return TRUE;
}
#pragma mark - 响应控件
- (IBAction)SaveAddr:(UIButton *)sender {
    if(_address==nil){
        _address = [[Address alloc]init];
    }
//    NSCharacterSet *errorCharStr = [NSCharacterSet
//                                    
//                                    characterSetWithCharactersInString:@",.;{}[]|<>~!@#$%^&*+?/= "];
//    
//    NSRange range = (NSRange){65535,0};
//    
//    range = [self.name.text rangeOfCharacterFromSet:errorCharStr];
//    
//    if (range.length > 0) {
//        [MBProgressHUD showError:@"昵称非法"];
//        return ;
//        
//    }
//
//    
//    BOOL isOk =[LoginModel checkInputMobile:self.phone.text];
//    if (!isOk)
//    {
//        
//        [MBProgressHUD showError:@"您输入的手机号码格式不正确"];
//        return;
//    }

    _address.name = self.name.text;
    _address.tel = self.phone.text;
    _address.address = self.Add_XX.text;
    _address.area = self.Add_DiQu.text;
    if ([_address.name isEqualToString:@""] ||
                [_address.tel isEqualToString:@""]||
                [_address.address isEqualToString:@""]||[_address.area isEqualToString:@""])
    {
                //提示输入完整信
        [MBProgressHUD showError:@"请输入完整信息哦"];
        
    }
    else
    {
        [_address saveObjectWithCompletion:^(Address *addr, NSError *error) {
            if (error == nil) {
                
                if(self.delegate && [self.delegate respondsToSelector:@selector(saveAddress:isNew:)]) {
                    
                    [self.delegate saveAddress:addr isNew:isNew];
                   
                }

                 [self.navigationController popViewControllerAnimated:YES];
                
                
            } else {
                // deal with error
                //            MYLOG(@"save address error= %@", error);
                
            }
        }];

        
    }
    
}
#pragma mark - UITextFieldDelegate的代理
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    for(UITextField *field in self.view.subviews)
    {
        
        if([field isKindOfClass:[UITextField class]])
        {
            
            [field resignFirstResponder];
            
        }
    }
    // 1, 先清空AreaPickerView
    [self cancelLocatePicker];
    // 2，再初始化AreaPickerView
    self.areaPickerView = [KJAreaPickerView areaPickerViewWithDelegate:self];
    // 3，显示
    [self.areaPickerView showInView:self.view];
    return NO;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    for(UITextField *field in self.view.subviews)
    {
        
        if([field isKindOfClass:[UITextField class]])
        {
            
            [field resignFirstResponder];
            
        }
    }
    [super touchesBegan:touches withEvent:event];
    // 取消areaPickerView
    [self cancelLocatePicker];
}
-(void)cancelLocatePicker
{
    [self.areaPickerView cancelPicker];
    self.areaPickerView.delegate = nil;
    self.areaPickerView = nil;
}
#pragma mark - KJAreaPickerViewDelegate的代理
- (void)pickerDidChangeStatus:(KJAreaPickerView *)picker
{
    _Add_DiQu.text = [NSString stringWithFormat:@"%@ %@ %@",picker.locate.state,picker.locate.city,picker.locate.district];
    
}
@end
