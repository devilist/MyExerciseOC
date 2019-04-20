//
//  EventCollectionViewCell.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/9.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "EventCollectionViewCell.h"

@implementation EventCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat cellWidth = self.frame.size.width;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellWidth -101)/2, 15, 101, 101)];
        [self addSubview:self.imageView];
        self.label = [[UILabel alloc] initWithFrame:CGRectMake((cellWidth -101)/2, 120, 101, 16)];
        [self addSubview:self.label];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.font = [UIFont systemFontOfSize:13];
    }
    return self;
}

@end
