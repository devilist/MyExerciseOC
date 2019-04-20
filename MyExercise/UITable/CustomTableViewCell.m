//
//  CustomTableViewCell.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/10.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "CustomTableViewCell.h"

@implementation CustomTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat cellWidth = self.frame.size.width;
        CGFloat cellHeight = self.frame.size.height;

        
        self.myImageView = [[UIImageView alloc] initWithFrame:CGRectMake((cellWidth -36 -49), (cellHeight - 35)/2  , 49, 35)];
        [self addSubview:self.myImageView];
        self.myLabel = [[UILabel alloc] initWithFrame:CGRectMake(38, (cellHeight - 21)/2, 101, 21)];
        [self addSubview:self.myLabel];
        self.myLabel.textAlignment = NSTextAlignmentCenter;
        self.myLabel.font = [UIFont systemFontOfSize:13];
    }
    return self;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
