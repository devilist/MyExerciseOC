//
//  ScrollViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/20.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "ScrollViewController.h"

@interface ScrollViewController ()<UIScrollViewDelegate>

@property(strong,nonatomic) UIScrollView *scrollView;
@property(strong,nonatomic) UIPageControl *pageControll;

@property(strong,nonatomic) UIImageView *imageView1;
@property(strong,nonatomic) UIImageView *imageView2;
@property(strong,nonatomic) UIImageView *imageView3;

@end

@implementation ScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.navigationItem.title = @"scroll page";
    UIBarButtonItem *back =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(onClick:)];
    back.tag = 100;
    self.navigationItem.leftBarButtonItem = back;
    
    self.scrollView = [[UIScrollView alloc] init];
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self;
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width*3, self.scrollView.frame.size.height);
    self.scrollView.frame = self.view.frame;
    self.scrollView.pagingEnabled = TRUE;
    self.scrollView.showsVerticalScrollIndicator = FALSE;
    self.scrollView.showsHorizontalScrollIndicator = FALSE;
    
    self.pageControll = [[UIPageControl alloc] initWithFrame:CGRectMake(0, screen.size.height-67, screen.size.width, 37)];
    self.pageControll.numberOfPages = 3;
    [self.pageControll addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.pageControll];
    
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen.size.width, screen.size.height)];
    // 这种方式会在b内存中创建缓存，直至应用i销毁
    // self.imageView1.image = [UIImage imageNamed:@"保罗克利-肖像.png"];
    // 这种方式用完即毁
    NSString *imgPath = [[NSBundle mainBundle] pathForResource:@"保罗克利-肖像" ofType:@"png"];
    self.imageView1.image = [[UIImage alloc] initWithContentsOfFile:imgPath];

    self.imageView1.contentMode = UIViewContentModeCenter;
    [self.scrollView addSubview:self.imageView1];
    
   
    
    

}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

- (void)changePage:(id)sender  {
    [UIView animateWithDuration:0.3f animations:^{
        NSInteger page = self.pageControll.currentPage;
        NSLog(@"currentPage:%ld",page);
        CGRect screen = [[UIScreen mainScreen] bounds];

        self.scrollView.contentOffset = CGPointMake(page*screen.size.width, 0);
        [self loadImage:self.pageControll.currentPage +1];

    }];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = scrollView.contentOffset;
    CGRect screen = [[UIScreen mainScreen] bounds];

    self.pageControll.currentPage = offset.x / screen.size.width;
    [self loadImage:self.pageControll.currentPage +1];
}

-(void)loadImage:(NSUInteger) page {
    CGRect screen = [[UIScreen mainScreen] bounds];
    if (page == 1 && self.imageView2 == nil) {
        self.imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(screen.size.width, 0, screen.size.width, screen.size.height)];
        self.imageView2.image = [UIImage imageNamed:@"达芬奇-蒙娜丽莎.png"];
        [self.scrollView addSubview:self.imageView2];
    }
    if (page == 2 && self.imageView3 == nil) {
        self.imageView3 = [[UIImageView alloc] initWithFrame:CGRectMake(2*screen.size.width, 0, screen.size.width, screen.size.height)];
        self.imageView3.image = [UIImage imageNamed:@"罗丹-思想者.png"];
        [self.scrollView addSubview:self.imageView3];
        
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
