//
//  TrangleView.m
//  MyExercise
//
//  Created by ZengPu on 2019/3/28.
//  Copyright © 2019 ZengPu. All rights reserved.
//

#import "TrangleView.h"

@implementation TrangleView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [[UIColor whiteColor] setFill];
    UIRectFill(rect);
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextMoveToPoint(context, 75, 10);
    CGContextAddLineToPoint(context, 10, 150);
    CGContextAddLineToPoint(context, 160, 150);
    CGPDFContextClose(context);
    
    [[UIColor blackColor] setStroke];
    [[UIColor redColor] setFill];
    CGContextDrawPath(context, kCGPathFillStroke);

    
}


@end
