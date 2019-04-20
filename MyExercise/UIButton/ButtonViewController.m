//
//  ButtonViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/1.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()
@property(strong, nonatomic) UILabel *label;

@end

@implementation ButtonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat labelWidth = screen.size.width, labelHeight = 100, labelTop = 50;
    self.label = [[UILabel alloc]  initWithFrame:CGRectMake((screen.size.width - labelWidth)/2,labelTop,labelWidth,labelHeight)];
    self.label.text = @"i am a button";
    self.label.textAlignment = NSTextAlignmentCenter;
    
    CGFloat buttonW = 60, buttonH = 20, buttonTop = 200;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"OK" forState:UIControlStateNormal];
    button.frame = CGRectMake((screen.size.width - buttonW)/2, buttonTop, buttonW, buttonH);
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    back.frame = CGRectMake((screen.size.width - buttonW)/2, 400, buttonW, buttonH);
    
    [self.view addSubview:self.label];
    [self.view addSubview:button];
    [self.view addSubview:back];


    // 点击事件
    button.tag = 1;
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    back.tag = 100;
    [back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    } else if(sender.tag == 1){
        self.label.text = @"Click!";
    }
//    [self.navigationController popToRootViewControllerAnimated:TRUE];
    
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
