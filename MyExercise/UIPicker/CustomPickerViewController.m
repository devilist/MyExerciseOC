//
//  CustomPickerViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/7.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "CustomPickerViewController.h"

@interface CustomPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

@property(strong,nonatomic) UIPickerView *pickView;

@property(strong,nonatomic) UILabel *label;

@property(strong,nonatomic) NSDictionary *pickerData;
@property(strong,nonatomic) NSArray *provinceData;
@property(strong,nonatomic) NSArray *cityData;


@end

@implementation CustomPickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    [self parseData];
    
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 100, screen.size.width, 162)];
    [self.view addSubview:self.pickView];
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    
    self.label = [[UILabel alloc]  initWithFrame:CGRectMake((screen.size.width - 300)/2,350,300,21)];
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

- (void) parseData {
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    self.pickerData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.provinceData = [self.pickerData allKeys];
    NSString *selectedProvince = [self.provinceData objectAtIndex:0];
    self.cityData = [self.pickerData objectForKey:selectedProvince];
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 1) {
        NSInteger row1 = [self.pickView selectedRowInComponent:0];
        NSInteger row2 = [self.pickView selectedRowInComponent:1];
        NSString *selected1 = [self.provinceData objectAtIndex:row1];
        NSString *selected2 = [self.cityData objectAtIndex:row2];

        NSString *result = [[NSString alloc] initWithFormat:@"%@,%@市",selected1,selected2];
        self.label.text = result;
        
    } else if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

#pragma UIPickerViewDataSource
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (component==0) {
        return [self.provinceData count];
    } else {
        return [self.cityData count];
    }
}

#pragma UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component {
    if (component==0) {
        return [self.provinceData objectAtIndex:row];
    } else {
        return [self.cityData objectAtIndex:row];
    }
}

- (void)pickerView:(UIPickerView *)pickerView
      didSelectRow:(NSInteger)row
       inComponent:(NSInteger)component {
    if (component == 0) {
        NSString *selectedProvince = [self.provinceData objectAtIndex:row];
        self.cityData = [self.pickerData objectForKey:selectedProvince];
        [self.pickView reloadComponent:1];
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
