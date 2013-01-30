//
//  SCSCircleView.m
//  Happiness
//
//  Created by Richard E Millet on 1/27/13.
//  Copyright (c) 2013 Richard Millet. All rights reserved.
//

#import "SCSCircleView.h"

@implementation SCSCircleView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    [[UIColor blueColor] setStroke];
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:rect];
    circlePath.lineWidth = 8;
    [circlePath addClip];
    [circlePath stroke];
}

@end
