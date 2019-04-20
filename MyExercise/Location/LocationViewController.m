//
//  LocationViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/4/14.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "LocationViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController ()<CLLocationManagerDelegate>

@property(strong,nonatomic) UITextField *lng;
@property(strong,nonatomic) UITextField *lat;
@property(strong,nonatomic) UITextField *alt;

@property(strong,nonatomic) UITextField *where;
@property(strong,nonatomic) CLGeocoder *coder;



@property(strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation LocationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.navigationItem.title = @"Location";
    UIBarButtonItem *back =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(onClick:)];
    back.tag = 100;
    self.navigationItem.leftBarButtonItem = back;
    //
    self.lng = [[UITextField alloc] initWithFrame:CGRectMake(40, 100, 300, 50)];
    self.lng.text = @"经度";
    self.lng.borderStyle = UITextBorderStyleRoundedRect;

    self.lat = [[UITextField alloc] initWithFrame:CGRectMake(40, 200, 300, 50)];
    self.lat.text = @"纬度";
    self.lat.borderStyle = UITextBorderStyleRoundedRect;
    
    self.alt = [[UITextField alloc] initWithFrame:CGRectMake(40, 300, 300, 50)];
    self.alt.text = @"高度";
    self.alt.borderStyle = UITextBorderStyleRoundedRect;
    
    self.where = [[UITextField alloc] initWithFrame:CGRectMake(40, 400, 300, 50)];
    
    
    [self.view addSubview:self.lng];
    [self.view addSubview:self.lat];
    [self.view addSubview:self.alt];
    [self.view addSubview:self.where];

    
    self.coder = [[CLGeocoder alloc] init];
    
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationManager.distanceFilter = 10.0f;
    
    [self.locationManager requestWhenInUseAuthorization];
    [self.locationManager requestAlwaysAuthorization];

}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear: animated];
    [self.locationManager startUpdatingLocation];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.locationManager stopUpdatingLocation];
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

-(void)reserveGeocode:(CLLocation *)location {
    [self.coder reverseGeocodeLocation:location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        if (error) {
            NSLog(@"error:%@",error.localizedDescription);
            
        } else if([placemarks count]>0){
            CLPlacemark *mark = placemarks[0];
            self.where.text = mark.name;
        }
    }];
    
}

#pragma CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager
     didUpdateLocations:(NSArray<CLLocation *> *)locations {
    
    CLLocation *current = [locations lastObject];
    self.lng.text = [NSString stringWithFormat:@"经度：%3.5f",current.coordinate.longitude];
    self.lat.text = [NSString stringWithFormat:@"纬度：%3.5f",current.coordinate.latitude];
    self.alt.text = [NSString stringWithFormat:@"高度：%3.5f",current.altitude];
    
    [self reserveGeocode:current];
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error {
    NSLog(@"error:%@",error);
}

- (void)locationManager:(CLLocationManager *)manager
didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorizedAlways) {
        NSLog(@"已经授权");
    } else if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        NSLog(@"使用时授权");
    } else if (status == kCLAuthorizationStatusDenied) {
        NSLog(@"拒绝");
    } else if (status == kCLAuthorizationStatusRestricted) {
        NSLog(@"受限");
    } else if (status == kCLAuthorizationStatusNotDetermined) {
        NSLog(@"还未确定");
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
