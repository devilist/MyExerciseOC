//
//  SwitchViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/3.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "SwitchViewController.h"

@interface SwitchViewController ()

@property(strong,nonatomic) UISwitch *leftSwitch;
@property(strong,nonatomic) UISwitch *rightSwitch;
@property(strong,nonatomic) UILabel *slideValue;

@end

@implementation SwitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.leftSwitch = [[UISwitch alloc] init];
    CGRect frame = self.leftSwitch.frame;
    frame.origin = CGPointMake(39, 98);
    self.leftSwitch.frame = frame;
    self.leftSwitch.on = TRUE;
    [self.leftSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.leftSwitch];
    
    self.rightSwitch = [[UISwitch alloc] init];
    CGRect frame1 = self.leftSwitch.frame;
    frame1.origin = CGPointMake(screen.size.width - frame1.size.width - 39, 98);
    self.rightSwitch.frame = frame1;
    self.rightSwitch.on = TRUE;
    [self.rightSwitch addTarget:self action:@selector(switchValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:self.rightSwitch];
    
    
    NSArray *segment = @[@"left",@"right"];
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:segment];
    segmentedControl.frame = CGRectMake((screen.size.width -220)/2, 180, 220, 29);
    [segmentedControl addTarget:self action:@selector(touchDown:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmentedControl];
    
    UISlider *slider = [[UISlider alloc]
                        initWithFrame:CGRectMake(40, 250, screen.size.width - 80, 31)];
    slider.minimumValue = 0;
    slider.maximumValue = 100;
    slider.value = 50;
    [slider addTarget:self action:@selector(slideValueChanged:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:slider];
    
    self.slideValue = [[UILabel alloc]
                       initWithFrame:CGRectMake((screen.size.width -50)/2, 300, 50, 21)];
    
    [self.view addSubview:self.slideValue];

    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    back.frame = CGRectMake((screen.size.width - 60)/2, 50, 60, 20);
    [self.view addSubview:back];
    
    back.tag = 100;
    [back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];


}

-(void)switchValueChanged:(UISwitch*)sender{
    BOOL setting = sender.isOn;
    [self.leftSwitch setOn:setting animated:TRUE];
    [self.rightSwitch setOn:setting animated:TRUE];
}

-(void)touchDown:(UISegmentedControl*)sender{
    NSLog(@"选择了 %li",sender.selectedSegmentIndex);
    
    if (self.leftSwitch.hidden) {
        self.leftSwitch.hidden = FALSE;
        self.rightSwitch.hidden = FALSE;
    } else {
        self.leftSwitch.hidden = TRUE;
        self.rightSwitch.hidden = TRUE;
    }
}

-(void)slideValueChanged:(UISlider*)sender{
    int progress = (int)sender.value;
    NSString *value = [[NSString alloc] initWithFormat:@"%d",progress];
    self.slideValue.text = value;
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
