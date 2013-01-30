//
//  SCSSmileView.m
//  Happiness
//
//  Created by Richard E Millet on 1/29/13.
//  Copyright (c) 2013 Richard Millet. All rights reserved.
//

#import "SCSSmileView.h"

@implementation SCSSmileView {
    BOOL geometryIsSet;
    CGPoint leftCornerOfSmile, rightCornerOfSmile, controlPoint;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setGeometry {
    CGRect rect = self.bounds;
    CGFloat horizontalOffset = 10;
    CGFloat leftXValue = rect.origin.x + horizontalOffset;
    CGFloat rightXValue = rect.origin.y + rect.size.width - horizontalOffset;
    CGFloat bottomYValue = rect.origin.y + rect.size.height;
    CGFloat verticalCenter = rect.origin.y + rect.size.height / 2;
    CGFloat horizontalCenter = rect.origin.x + rect.size.width / 2;
    
    leftCornerOfSmile = CGPointMake(leftXValue, verticalCenter);
    rightCornerOfSmile = CGPointMake(rightXValue, verticalCenter);
    controlPoint = CGPointMake(horizontalCenter, bottomYValue);
    geometryIsSet = YES;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 */
- (void)drawRect:(CGRect)rect
{
    if (geometryIsSet == NO) {
        [self setGeometry];
    }
    
    [[UIColor blueColor] setStroke];
    UIBezierPath *smilePath = [UIBezierPath bezierPath];
    [smilePath moveToPoint:leftCornerOfSmile];
    [smilePath addQuadCurveToPoint:rightCornerOfSmile controlPoint:controlPoint];
    smilePath.lineWidth = 4;
    smilePath.lineCapStyle = kCGLineCapRound;
    [smilePath addClip];
    [smilePath stroke];
}

@end
