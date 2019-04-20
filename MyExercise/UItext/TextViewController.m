//
//  TextViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/3.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "TextViewController.h"

@interface TextViewController () <UITextFieldDelegate, UITextViewDelegate>

@end

@implementation TextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
//
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, 300, 50)];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.text = @"I am a UITextField";
    textField.returnKeyType = UIReturnKeyNext;
    textField.keyboardType = UIKeyboardTypeNumbersAndPunctuation;

    [self.view addSubview:textField];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(40, 160, 300, 50)];
    textView.text = @"I am a UITextView";
    textView.delegate = self;
    textView.backgroundColor = UIColor.orangeColor;

     
    [self.view addSubview:textView];

     
     
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    back.frame = CGRectMake((screen.size.width - 60)/2, 50, 60, 20);
    [self.view addSubview:back];
    
    back.tag = 100;
    [back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
    
}


#pragma mark  实现UITextFieldDelegate委托协议方法
-(BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return TRUE;
}

#pragma mark  实现UITextViewDelegate委托协议方法
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range
 replacementText:(NSString *)text {
    if ([text isEqualToString:@"\n"]) {
        [textView resignFirstResponder];
        return FALSE;
    }
    return TRUE;
}
#pragma mark  注册键盘出现和隐藏的通知
- (void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidShow:)
                                                 name:UIKeyboardDidShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardDidHidden:)
                                                 name:UIKeyboardDidHideNotification
                                               object:nil];
    [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardDidShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                 name:UIKeyboardDidHideNotification
                                                  object:nil];
}

- (void)keyboardDidShow:(NSNotification *) noti {
    NSLog(@"键盘打开");
}
- (void)keyboardDidHidden:(NSNotification *) noti {
    NSLog(@"键盘关闭");
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
