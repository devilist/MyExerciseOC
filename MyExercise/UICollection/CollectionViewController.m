//
//  CollectionViewController.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/9.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "CollectionViewController.h"
#import "EventCollectionViewCell.h"

@interface CollectionViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

{
    int COL_NUM;
}

@property(strong,nonatomic) NSArray *events;
@property(strong,nonatomic) UICollectionView *collectionView;

@end

@implementation CollectionViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *plistPath = [bundle pathForResource:@"events" ofType:@"plist"];
    self.events = [[NSArray alloc] initWithContentsOfFile:plistPath];
    COL_NUM = 2;
    
    [self setupColletionView];
    
    
    CGRect screen = [[UIScreen mainScreen] bounds];
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

-(void) setupColletionView {
    // 创建流式布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    // 设置w每个单元格尺寸
    layout.itemSize = CGSizeMake(150, 150);
    // 设置collectionView 内边框
    layout.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
    // 设置行距
    layout.minimumLineSpacing = 10;
    // 设置单元格距
    layout.minimumInteritemSpacing = 10;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:self.view.frame collectionViewLayout:layout];
    
    // 设置可重用单元格标识和单元格类型
    [self.collectionView registerClass:[EventCollectionViewCell class] forCellWithReuseIdentifier:@"cellIdentifier"];
    self.collectionView.backgroundColor = [UIColor whiteColor ];
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    
    [self.view addSubview:self.collectionView];
}


#pragma UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    // 提供节的个数(行数)
    int num = [self.events count] % COL_NUM;
    if (num == 0) {
        return [self.events count] / COL_NUM;
    } else {
        return [self.events count] / COL_NUM + 1;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section {
    // 提供某个节中的列数
    return COL_NUM;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    // 为单元格提供数据
    EventCollectionViewCell *cell = [self.collectionView
                                     dequeueReusableCellWithReuseIdentifier:@"cellIdentifier"
                                                               forIndexPath:indexPath];
    NSDictionary *event = self.events[indexPath.section * COL_NUM + indexPath.row];
    cell.label.text = [event objectForKey:@"name"];
    cell.imageView.image = [UIImage imageNamed:event[@"image"]];
    
    return cell;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView
//           viewForSupplementaryElementOfKind:(NSString *)kind
//                                 atIndexPath:(NSIndexPath *)indexPath {
//
//}

#pragma UICollectionViewDelegate

- (void)collectionView:(UICollectionView *)collectionView
            didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *event = self.events[indexPath.section * COL_NUM + indexPath.row];
    NSLog(@"select event name %@", event[@"name"]);
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
