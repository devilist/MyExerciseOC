//
//  TreeViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/23.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "TreeViewController.h"
#import "CityTableViewController.h"

@interface TreeViewController ()

@property(strong,nonatomic) NSDictionary *dictData;
@property(strong,nonatomic) NSArray *listData;


@end

@implementation TreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"scroll page";
    UIBarButtonItem *back =[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleDone target:self action:@selector(onClick:)];
    back.tag = 100;
    self.navigationItem.leftBarButtonItem = back;

    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"provinces_cities" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.listData = [self.dictData allKeys];
    
    self.title = @"省份信息";
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.listData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"CellIdentifier"];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellIdentifier" forIndexPath:indexPath];
    NSInteger row = [indexPath row];
    cell.textLabel.text = self.listData[row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger selected = [indexPath row];
    NSString *selectedName = self.listData[selected];
    CityTableViewController *controller = [[CityTableViewController alloc] init];
    controller.listData = self.dictData[selectedName];
    controller.title = selectedName;
    [self.navigationController pushViewController:controller animated:TRUE];
    
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
