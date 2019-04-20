//
//  WebViewViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/3.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "WebViewViewController.h"
#import <WebKit/WebKit.h>

@interface WebViewViewController ()<WKNavigationDelegate>

@property(strong,nonatomic) WKWebView *webView;

@end

@implementation WebViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    UIView *title = [[UIView alloc] initWithFrame:CGRectMake((screen.size.width - 316)/2, 100, 316, 30)];
    [self.view addSubview:title];
    
    UIButton *htmlStr = [UIButton buttonWithType:UIButtonTypeSystem];
    [htmlStr setTitle:@"loadHtmlString" forState:UIControlStateNormal];
    htmlStr.frame = CGRectMake(0, 0, 117, 30);
    htmlStr.tag = 1;
    [htmlStr addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [title addSubview:htmlStr];
    
    UIButton *loadData = [UIButton buttonWithType:UIButtonTypeSystem];
    [loadData setTitle:@"loadData" forState:UIControlStateNormal];
    loadData.frame = CGRectMake(137, 0, 67, 30);
    loadData.tag = 2;
    [loadData addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [title addSubview:loadData];
    
    UIButton *loadRequest = [UIButton buttonWithType:UIButtonTypeSystem];
    [loadRequest setTitle:@"loadRequest" forState:UIControlStateNormal];
    loadRequest.frame = CGRectMake(224, 0, 92, 30);
    loadRequest.tag = 3;
    [loadRequest addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [title addSubview:loadRequest];
    
    self.webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 140, screen.size.width, screen.size.height - 80)];
    [self.view addSubview:self.webView];
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    back.frame = CGRectMake((screen.size.width - 60)/2, 50, 60, 20);
    [self.view addSubview:back];
    
    back.tag = 100;
    [back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];

}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    
    if (sender.tag == 1) {
        NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
        NSError *error = nil;
        NSString *html = [[NSString alloc] initWithContentsOfFile:htmlPath
                                                         encoding:NSUTF8StringEncoding error:&error];
        if (error == nil) {
            [self.webView loadHTMLString:html baseURL:bundleUrl];
        }
        
    } else if (sender.tag == 2) {
        NSString *htmlPath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
        NSURL *bundleUrl = [NSURL fileURLWithPath:[[NSBundle mainBundle] bundlePath]];
        NSData *htmlData = [[NSData alloc] initWithContentsOfFile:htmlPath];
        
        [self.webView loadData:htmlData MIMEType:@"text/html" characterEncodingName:@"UTF-8"
                       baseURL:bundleUrl];
        
    } else if (sender.tag == 3) {
        
        NSURL *url = [NSURL URLWithString:@"https://www.baidu.com"];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.webView loadRequest:request];
        self.webView.navigationDelegate = self;
        
    } else if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

#pragma mark - WKNavigationDelegate
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"开始加载");
}

- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"开始返回内容");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"加载完成");
}

- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"加载失败 error %@", error.description);
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
