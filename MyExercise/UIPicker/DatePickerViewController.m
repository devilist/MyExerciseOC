//
//  DatePickerViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/7.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@property(strong,nonatomic) UIDatePicker *datePicker;

@property(strong,nonatomic) UILabel *label;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 100, screen.size.width, 167)];
    self.datePicker.locale = [NSLocale localeWithLocaleIdentifier:@"zh-Hans"];
    self.datePicker.datePickerMode = UIDatePickerModeDateAndTime;
    [self.view addSubview:self.datePicker];
    
    self.label = [[UILabel alloc]  initWithFrame:CGRectMake((screen.size.width - 100)/2,350,100,21)];
    self.label.text = @"label";
    self.label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.label];
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    [confirmBtn setTitle:@"confirm" forState:UIControlStateNormal];
    confirmBtn.frame = CGRectMake((screen.size.width - 60)/2, 450, 60, 20);
    [self.view addSubview:confirmBtn];
    confirmBtn.tag = 1;
    [confirmBtn addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
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
        NSDate *date = self.datePicker.date;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
        self.label.text = [formatter stringFromDate:date];
    } else if (sender.tag == 100) {
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
