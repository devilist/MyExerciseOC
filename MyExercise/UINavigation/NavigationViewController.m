//
//  NavigationViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/17.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "NavigationViewController.h"
#import "ScrollViewController.h"
#import "PageViewController.h"
#import "tab/TabViewController.h"
#import "tree/TreeViewController.h"

@interface NavigationViewController ()

@end

@implementation NavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.navigationItem.title = @"navigation";
    UIBarButtonItem *back =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(onClick:)];
    back.tag = 100;
    self.navigationItem.leftBarButtonItem = back;
    
    
    CGFloat buttonW = screen.size.width, buttonH = 20, buttonTop = 150;
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button1 setTitle:@"scroll sample" forState:UIControlStateNormal];
    button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button1.frame = CGRectMake(40, buttonTop, buttonW, buttonH);
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"page sample" forState:UIControlStateNormal];
    button2.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button2.frame = CGRectMake(40, 180, buttonW, buttonH);
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"tab sample" forState:UIControlStateNormal];
    button3.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button3.frame = CGRectMake(40, 210, buttonW, buttonH);
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button4 setTitle:@"tree sample" forState:UIControlStateNormal];
    button4.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    button4.frame = CGRectMake(40, 240, buttonW, buttonH);
    
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    
    button1.tag = 1;
    button2.tag = 2;
    button3.tag = 3;
    button4.tag = 4;

    
    [button1 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [button4 addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    UIViewController *controller;
    UINavigationController *nav;
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    } else if (sender.tag == 1) {
        controller =[[ScrollViewController alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:TRUE completion:nil];
    } else if (sender.tag == 2) {
        controller =[[PageViewController alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:TRUE completion:nil];
    }else if (sender.tag == 3) {
        controller =[[TabViewController alloc] init];
        nav = [[UINavigationController alloc] initWithRootViewController:controller];
        [self presentViewController:nav animated:TRUE completion:nil];
    }else if (sender.tag == 4) {
        controller =[[TreeViewController alloc] init];
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

@end
