//
//  PageViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/20.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "PageViewController.h"

enum DirectionForward {
    ForwardBefore = 1,
    ForwardAfter = 2
};

@interface PageViewController ()<UIPageViewControllerDataSource,UIPageViewControllerDelegate>{
    int pageIndex;
    int directionForward;
}

@property(strong,nonatomic) UIPageViewController *pageViewController;
@property(strong,nonatomic) NSArray *viewControllers;


@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.navigationItem.title = @"page";
    UIBarButtonItem *back =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(onClick:)];
    back.tag = 100;
    self.navigationItem.leftBarButtonItem = back;
    
    
    UIViewController *controller1 = [[UIViewController alloc] init];
    UIViewController *controller2 = [[UIViewController alloc] init];
    UIViewController *controller3 = [[UIViewController alloc] init];

    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView1.image = [UIImage imageNamed:@"保罗克利-肖像.png"];
    imageView1.contentMode = UIViewContentModeCenter;
    [controller1.view addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView2.image = [UIImage imageNamed:@"达芬奇-蒙娜丽莎.png"];
    imageView2.contentMode = UIViewContentModeCenter;
    [controller2.view addSubview:imageView2];
    
    UIImageView *imageView3 = [[UIImageView alloc] initWithFrame:self.view.frame];
    imageView3.image = [UIImage imageNamed:@"罗丹-思想者.png"];
    imageView3.contentMode = UIViewContentModeCenter;
    [controller3.view addSubview:imageView3];
    
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStylePageCurl navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    self.pageViewController.delegate = self;
    self.pageViewController.dataSource = self;
    
    [self.pageViewController setViewControllers:@[controller1] direction:UIPageViewControllerNavigationDirectionForward animated:TRUE completion:nil];
    [self.view addSubview:self.pageViewController.view];
    pageIndex = 0;
   
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

#pragma UIPageViewControllerDataSource
- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    pageIndex--;
    if (pageIndex<0) {
        pageIndex = 0;
        return nil;
    }
    directionForward = ForwardBefore;
    return self.viewControllers[pageIndex];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    pageIndex++;
    if (pageIndex>2) {
        pageIndex = 2;
        return nil;
    }
    directionForward = ForwardAfter;
    return self.viewControllers[pageIndex];
}

#pragma  UIPageViewControllerDelegate

- (UIPageViewControllerSpineLocation)pageViewController:(UIPageViewController *)pageViewController spineLocationForInterfaceOrientation:(UIInterfaceOrientation)orientation {
    self.pageViewController.doubleSided = FALSE;
    return UIPageViewControllerSpineLocationMin;
}

- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed {
    if (!completed) {
        if (directionForward == ForwardAfter) {
            pageIndex--;
        }
        if (directionForward == ForwardBefore) {
            pageIndex++;
        }
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
