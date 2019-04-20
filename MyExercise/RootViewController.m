//
//  RootViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/1/27.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "RootViewController.h"
#import "UIButton/ButtonViewController.h"
#import "UItext/TextViewController.h"
#import "UISwitch/SwitchViewController.h"
#import "WKWebview/WebViewViewController.h"
#import "UIAlert/AlertViewController.h"
#import "UIPicker/DatePickerViewController.h"
#import "UIPicker/CustomPickerViewController.h"
#import "UICollection/CollectionViewController.h"
#import "UITable/TableViewController.h"
#import "UINavigation/NavigationViewController.h"
#import "Location/LocationViewController.h"


@interface RootViewController ()

@property(strong, nonatomic) UILabel *label;

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    CGFloat labelWidth = screen.size.width, labelHeight = 20, labelTop = 100;
    self.label = [[UILabel alloc]  initWithFrame:CGRectMake(40,labelTop,labelWidth,labelHeight)];
    self.label.text = @"hello oc!";
    self.label.textAlignment = NSTextAlignmentLeft;
    self.label.font = [UIFont systemFontOfSize:24];
    [self.view addSubview:self.label];

    CGFloat buttonW = screen.size.width, buttonH = 20, buttonTop = 150;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"button sample" forState:UIControlStateNormal];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button.frame = CGRectMake(40, buttonTop, buttonW, buttonH);
    
    UIButton *textBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [textBtn setTitle:@"text sample" forState:UIControlStateNormal];
    textBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    textBtn.frame = CGRectMake(40, 180, buttonW, buttonH);
    
    UIButton *switchBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [switchBtn setTitle:@"switch sample" forState:UIControlStateNormal];
    switchBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    switchBtn.frame = CGRectMake(40, 210, buttonW, buttonH);
    
    UIButton *webBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [webBtn setTitle:@"webview sample" forState:UIControlStateNormal];
    webBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    webBtn.frame = CGRectMake(40, 240, buttonW, buttonH);
    
    
    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [alertBtn setTitle:@"alert progress toolbar sample" forState:UIControlStateNormal];
    alertBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    alertBtn.frame = CGRectMake(40, 270, buttonW, buttonH);
    
    UIButton *pickerBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [pickerBtn setTitle:@"date picker sample" forState:UIControlStateNormal];
    pickerBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    pickerBtn.frame = CGRectMake(40, 300, buttonW, buttonH);
    
    UIButton *picker1Btn = [UIButton buttonWithType:UIButtonTypeSystem];
    [picker1Btn setTitle:@"custom picker sample" forState:UIControlStateNormal];
    picker1Btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    picker1Btn.frame = CGRectMake(40, 330, buttonW, buttonH);
    
    UIButton *collectionBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [collectionBtn setTitle:@"collection sample" forState:UIControlStateNormal];
    collectionBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    collectionBtn.frame = CGRectMake(40, 360, buttonW, buttonH);
    
    UIButton *tableBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [tableBtn setTitle:@"table sample" forState:UIControlStateNormal];
    tableBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    tableBtn.frame = CGRectMake(40, 390, buttonW, buttonH);
    
    UIButton *navigationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [navigationBtn setTitle:@"navigation sample" forState:UIControlStateNormal];
    navigationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    navigationBtn.frame = CGRectMake(40, 420, buttonW, buttonH);
    
    UIButton *locationBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [locationBtn setTitle:@"location sample" forState:UIControlStateNormal];
    locationBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    locationBtn.frame = CGRectMake(40, 450, buttonW, buttonH);
    
    [self.view addSubview:button];
    [self.view addSubview:textBtn];
    [self.view addSubview:switchBtn];
    [self.view addSubview:webBtn];
    [self.view addSubview:alertBtn];
    [self.view addSubview:pickerBtn];
    [self.view addSubview:picker1Btn];
    [self.view addSubview:collectionBtn];
    [self.view addSubview:tableBtn];
    [self.view addSubview:navigationBtn];
    [self.view addSubview:locationBtn];



    button.tag = 1;
    textBtn.tag = 2;
    switchBtn.tag = 3;
    webBtn.tag = 4;
    alertBtn.tag = 5;
    pickerBtn.tag = 6;
    picker1Btn.tag = 7;
    collectionBtn.tag = 8;
    tableBtn.tag = 9;
    navigationBtn.tag = 10;
    locationBtn.tag = 11;



    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [textBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [switchBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [webBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [alertBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [pickerBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [picker1Btn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [collectionBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [tableBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [navigationBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [locationBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];


}

- (void)onClick:(UIButton *)sender {
    NSLog(@"onClick!");
    UIViewController *controller;
    UINavigationController *nav;
    if (sender.tag == 1) {
        controller =[[ButtonViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    } else if (sender.tag == 2) {
        controller =[[TextViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    } else if (sender.tag == 3) {
        controller =[[SwitchViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    }else if (sender.tag == 4) {
        controller =[[WebViewViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    }else if (sender.tag == 5) {
        controller =[[AlertViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    }else if (sender.tag == 6) {
        controller =[[DatePickerViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    }else if (sender.tag == 7) {
        controller =[[CustomPickerViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    }else if (sender.tag == 8) {
        controller =[[CollectionViewController alloc] init];
        [self presentViewController:controller animated:TRUE completion:nil];
    }else if (sender.tag == 9) {
        controller =[[TableViewController alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:TRUE completion:nil];
    }else if (sender.tag == 10) {
        controller =[[NavigationViewController alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:TRUE completion:nil];
    }else if (sender.tag == 11) {
        controller =[[LocationViewController alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:TRUE completion:nil];
    }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end

