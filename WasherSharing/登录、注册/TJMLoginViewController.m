//
//  TJMLoginViewController.m
//  WasherSharing
//
//  Created by Jiaming Tu on 2017/8/17.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import "TJMLoginViewController.h"

@interface TJMLoginViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *phoneNumTextField;
@property (weak, nonatomic) IBOutlet UITextField *pswdTextField;





@end

@implementation TJMLoginViewController
#pragma  mark - view life cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma  mark - button action
- (IBAction)getCodeAction:(UIButton *)sender {
}
- (IBAction)loginAction:(UIButton *)sender {
}


#pragma  mark - UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    //获取输入框 输入下一位之前的值
    NSMutableString *newValue = [textField.text mutableCopy];
    //拼接 下一位 得到输入框输入完成后的值
    [newValue replaceCharactersInRange:range withString:string];
    
    if ([newValue isNumber]) {
        NSInteger digit = [textField isEqual:_phoneNumTextField] ? 11 : 6;
        return newValue.length > digit ? NO : YES;
    } else {
        return NO;
    }
}




#pragma  mark - memory warning
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
