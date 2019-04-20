//
//  AlertViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/6.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "AlertViewController.h"

@interface AlertViewController ()

@property(strong,nonatomic) UIActivityIndicatorView *activityIndicatorView;
@property(strong,nonatomic) UIProgressView *progressView;
@property(strong,nonatomic) NSTimer *timer;

@property(strong,nonatomic) UILabel *label;



@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
//    self.view.backgroundColor = UIColor.yellowColor;
    // 警告框
    CGFloat buttonW = screen.size.width, buttonH = 20, buttonTop = 150;
    UIButton *alertBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [alertBtn setTitle:@"警告框" forState:UIControlStateNormal];
    alertBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    alertBtn.frame = CGRectMake(40, buttonTop, buttonW, buttonH);
    [self.view addSubview:alertBtn];
    alertBtn.tag = 1;
    [alertBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];

    // 操作表
    UIButton *alertSheetBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [alertSheetBtn setTitle:@"操作表" forState:UIControlStateNormal];
    alertSheetBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    alertSheetBtn.frame = CGRectMake(40, 180, buttonW, buttonH);
    [self.view addSubview:alertSheetBtn];
    alertSheetBtn.tag = 2;
    [alertSheetBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 菊花
    self.activityIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    CGRect frame = self.activityIndicatorView.frame;
    frame.origin = CGPointMake((screen.size.width - frame.size.width)/2, 210);
    self.activityIndicatorView.frame = CGRectMake((screen.size.width - 60)/2, 210,60, 60);
    self.activityIndicatorView.hidesWhenStopped = false;
    [self.view addSubview:self.activityIndicatorView];
    
    UIButton *uploadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [uploadBtn setTitle:@"upload" forState:UIControlStateNormal];
    uploadBtn.frame = CGRectMake((screen.size.width - 60)/2, 270, 60, 20);
    [self.view addSubview:uploadBtn];
    uploadBtn.tag = 3;
    [uploadBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // 进度条
    self.progressView = [[UIProgressView alloc] initWithFrame:CGRectMake((screen.size.width - 200)/2, 350,200, 2)];
    [self.view addSubview:self.progressView];
    
    UIButton *downloadBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [downloadBtn setTitle:@"download" forState:UIControlStateNormal];
    downloadBtn.frame = CGRectMake((screen.size.width - 100)/2, 370, 100, 20);
    [self.view addSubview:downloadBtn];
    downloadBtn.tag = 4;
    [downloadBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    // toolbar
    UIToolbar *toolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, screen.size.height - 44,screen.size.width, 44)];
    UIBarButtonItem *save = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onToolbarClick:)];
    save.tag = 0;
    
    UIBarButtonItem *open = [[UIBarButtonItem alloc] initWithTitle:@"open"
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:@selector(onToolbarClick:)];
    open.tag = 1;
    
    UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    toolbar.items = @[save,flex,open];
    [self.view addSubview:toolbar];
    
    self.label = [[UILabel alloc]  initWithFrame:CGRectMake((screen.size.width - 100)/2,450,100,21)];
    self.label.text = @"label";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    // nagivationbar
    UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0,100,screen.size.width,44)];
    [self.view addSubview:navigationBar];
    
    UIBarButtonItem *saveNav = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(onToolbarClick:)];
    saveNav.tag = 2;
    
    UIBarButtonItem *addNav = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onToolbarClick:)];
    addNav.tag = 3;
    
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@""];
    navItem.leftBarButtonItem = saveNav;
    navItem.rightBarButtonItem = addNav;
    navigationBar.items = @[navItem];
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    back.frame = CGRectMake((screen.size.width - 60)/2, 50, 60, 20);
    [self.view addSubview:back];
    
    back.tag = 100;
    [back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void) onToolbarClick:(UIBarButtonItem*)sender {
    if (sender.tag==0 || sender.tag==2) {
        self.label.text = @"点击了save";
    } else  if (sender.tag==1) {
        self.label.text = @"点击了open";
    } else  if (sender.tag==3) {
        self.label.text = @"点击了add";
    }
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    
    if (sender.tag == 1) {
        
        UIAlertController *controler = [UIAlertController
                                        alertControllerWithTitle:@"Alert"
                                        message:@"i am a alert view"
                                        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *noAction = [UIAlertAction actionWithTitle:@"No"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"cancel");
                                                         }];
        UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"Yes"
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"Yes");
                                                         }];
        [controler addAction:noAction];
        [controler addAction:yesAction];
        
        [self presentViewController:controler animated:TRUE completion:nil];

    } else if (sender.tag == 2) {
        
        UIAlertController *controler = [[UIAlertController alloc] init];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                           style:UIAlertActionStyleCancel
                                                         handler:^(UIAlertAction * _Nonnull action) {
                                                             NSLog(@"取消");
                                                         }];
        
        UIAlertAction *destructiveAction = [UIAlertAction actionWithTitle:@"破坏性按钮"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              NSLog(@"破坏性按钮");
                                                          }];
        
        UIAlertAction *wbAction = [UIAlertAction actionWithTitle:@"新浪微博"
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction * _Nonnull action) {
                                                                      NSLog(@"新浪微博");
                                                                  }];
        
        [controler addAction:cancelAction];
        [controler addAction:destructiveAction];
        [controler addAction:wbAction];
        
        [self presentViewController:controler animated:TRUE completion:nil];
        
    }else if (sender.tag == 3) {
        if ([self.activityIndicatorView isAnimating]) {
            [self.activityIndicatorView stopAnimating];
        } else {
           [self.activityIndicatorView startAnimating];
        }
        
    }else if (sender.tag == 4) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0
                                                      target:self
                                                    selector:@selector(download)
                                                    userInfo:nil repeats:TRUE];
    }else if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
    
}

-(void)download {
    self.progressView.progress = self.progressView.progress+ 0.1;
    if (self.progressView.progress == 1.0) {
        [self.timer invalidate];
        
        UIAlertController *controler = [UIAlertController
                                        alertControllerWithTitle:@"download complele!"
                                        message:@""
                                        preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"ok"
                                                            style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * _Nonnull action) {
                                                              NSLog(@"ok");
                                                          }];
        [controler addAction:yesAction];
        
        [self presentViewController:controler animated:TRUE completion:nil];
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
