//
//  TableViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/10.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "TableViewController.h"
#import "CustomTableViewCell.h"

#define CellIdentifier @"CellIdentifier"

@interface TableViewController ()<UITableViewDelegate,UITableViewDataSource,
                                    UISearchBarDelegate,UISearchResultsUpdating>

@property(strong,nonatomic) NSArray *listTeams;
@property(strong,nonatomic) UITableView *tableView;

@property(strong,nonatomic) UISearchController *searchController;
@property(strong,nonatomic) NSMutableArray *filterListTeams;

@property(strong,nonatomic) NSDictionary *dictData;
@property(strong,nonatomic) NSArray *listGroupName;



@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    self.navigationItem.title = @"table";
    UIBarButtonItem *back1 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(onClick:)];
    back1.tag = 100;
    self.navigationItem.leftBarButtonItem = back1;
    
    NSBundle *bundle = [NSBundle mainBundle];
//    NSString *plistPath = [bundle pathForResource:@"team" ofType:@"plist"];
//    self.listTeams = [[NSArray alloc] initWithContentsOfFile:plistPath];

    NSString *plistPath = [bundle pathForResource:@"team_dictionary" ofType:@"plist"];
    self.dictData = [[NSDictionary alloc] initWithContentsOfFile:plistPath];
    self.listGroupName = [[self.dictData allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
//    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
//    [self filterContentForSearchText:@"" scope:-1];
//    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
//    self.searchController.searchResultsUpdater = self;
//    self.searchController.dimsBackgroundDuringPresentation = FALSE;
//    self.searchController.searchBar.scopeButtonTitles = @[@"中文",@"英文"];
//    self.searchController.searchBar.delegate = self;
//    
//    self.tableView.tableHeaderView = self.searchController.searchBar;
//    
//    [self.searchController.searchBar sizeToFit];
    
    
    UIButton *back = [UIButton buttonWithType:UIButtonTypeSystem];
    [back setTitle:@"Back" forState:UIControlStateNormal];
    back.frame = CGRectMake((screen.size.width - 60)/2, 50, 60, 20);
    [self.view addSubview:back];
    
    back.tag = 100;
    [back addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)onClick:(UIButton*)sender  {
    NSLog(@"onClick!");
    if (sender.tag == 100) {
        [self dismissViewControllerAnimated:TRUE completion:nil];
    }
    
}

-(void) filterContentForSearchText:(NSString*)serachText scope:(NSUInteger)scope {
    
    if ([serachText length] == 0) {
        self.filterListTeams = [NSMutableArray arrayWithArray:self.listTeams];
        return;
    }
    NSPredicate *predicate;
    NSArray *tempArray;
    
    switch (scope) {
        case 0:
            predicate = [NSPredicate predicateWithFormat:@"SELF.name contains[c]%@",serachText];
            tempArray = [self.listTeams filteredArrayUsingPredicate:predicate];
            self.filterListTeams = [NSMutableArray arrayWithArray:tempArray];
            break;
        case 1:
            predicate = [NSPredicate predicateWithFormat:@"SELF.image contains[c]%@",serachText];
            tempArray = [self.listTeams filteredArrayUsingPredicate:predicate];
            self.filterListTeams = [NSMutableArray arrayWithArray:tempArray];
            break;
        default:
            self.filterListTeams = [NSMutableArray arrayWithArray:self.listTeams];
            break;
    }
    
}

//#pragma UISearchBarDelegate
//- (void)searchBar:(UISearchBar *)searchBar
//        selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
//
//    [self updateSearchResultsForSearchController:self.searchController];
//}
//
//#pragma UISearchResultsUpdating
//- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
//    NSString *searchStr = searchController.searchBar.text;
//    [self filterContentForSearchText:searchStr scope:searchController.searchBar.selectedScopeButtonIndex];
//    [self.tableView reloadData];
//}

#pragma UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView
            numberOfRowsInSection:(NSInteger)section {
//    return [self.filterListTeams count];
    return [self.dictData[self.listGroupName[section]] count];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.listGroupName count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.listGroupName[section];
}

- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (NSString *item in self.listGroupName) {
        [array addObject:[item substringToIndex:1]];
    }
    return array;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
        cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (nil == cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    NSInteger row = [indexPath row];
//    NSDictionary *rowDict = self.listTeams[row];
//
//    cell.textLabel.text = rowDict[@"name"];
//
//    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png",rowDict[@"image"]];
//    cell.imageView.image = [UIImage imageNamed:imagePath];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
//    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (nil == cell) {
//        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
//    NSInteger row = [indexPath row];
//    NSDictionary *rowDict = self.filterListTeams[row];
//
//    cell.myLabel.text = rowDict[@"name"];
//
//    NSString *imagePath = [[NSString alloc] initWithFormat:@"%@.png",rowDict[@"image"]];
//    cell.myImageView.image = [UIImage imageNamed:imagePath];
//    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
//    if (nil == cell) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
//    }
    NSInteger section = [indexPath section];
    NSInteger row = [indexPath row];
    NSString *groupName = self.listGroupName[section];
    
    NSArray *listTeams = self.dictData[groupName];
    
    cell.textLabel.text = listTeams[row];
    
    return cell;
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
