//
//  TabViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/23.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "TabViewController.h"
#import "HViewController.h"
#import "JViewController.h"
#import "LViewController.h"

@interface TabViewController ()

@end

@implementation TabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.navigationItem.title = @"page";
    UIBarButtonItem *back =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(onClick:)];
    back.tag = 100;
    self.navigationItem.leftBarButtonItem = back;
    
    UIViewController *controller1 = [[HViewController alloc] initWithNibName:@"HViewController" bundle:nil];
    UIViewController *controller2 = [[JViewController alloc] initWithNibName:@"JViewController" bundle:nil];
    UIViewController *controller3 = [[LViewController alloc] initWithNibName:@"LViewController" bundle:nil];

    self.viewControllers = @[controller1,controller2,controller3];
    
    
    // 改变tab字体大小
    NSMutableDictionary *attr = [NSMutableDictionary dictionary];
    attr[NSFontAttributeName] = [UIFont systemFontOfSize:19];
//    attr[NSForegroundColorAttributeName] = [UIColor grayColor];
    
    NSMutableDictionary *selectAttr = [NSMutableDictionary dictionary];
    selectAttr[NSFontAttributeName] = [UIFont systemFontOfSize:19];
//    selectAttr[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
    
    UITabBarItem *item = [UITabBarItem appearance];
    [item setTitleTextAttributes:attr forState:UIControlStateNormal];
    [item setTitleTextAttributes:selectAttr forState:UIControlStateSelected];
    
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
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
