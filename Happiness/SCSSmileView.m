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
    CGPoint leftCornerOfSmile, rightCornerOfSmile; //, controlPoint;
    CGFloat horizontalCenter;
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
//    CGFloat bottomYValue = rect.origin.y + rect.size.height;
    CGFloat verticalCenter = rect.origin.y + rect.size.height / 2;
    horizontalCenter = rect.origin.x + rect.size.width / 2;
    
    leftCornerOfSmile = CGPointMake(leftXValue, verticalCenter);
    rightCornerOfSmile = CGPointMake(rightXValue, verticalCenter);
//    controlPoint = CGPointMake(horizontalCenter, bottomYValue);
    geometryIsSet = YES;
    
//    NSLog(@"Starting smile control point: %f", controlPoint.y);
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
    // ask the data source for the happiness value
    CGFloat controlYValue = [self.smileDataSource happinessLevelForSmileView:self];
    CGPoint controlPoint = CGPointMake(horizontalCenter, controlYValue);
    // continue as before
    [smilePath addQuadCurveToPoint:rightCornerOfSmile controlPoint:controlPoint];
    smilePath.lineWidth = 4;
    smilePath.lineCapStyle = kCGLineCapRound;
//    [smilePath addClip];
    [smilePath stroke];
}

//
// Clip/trim the y-location point to fit within the boundaries of the smile view
//
- (CGFloat)clipVertical:(CGPoint)location {
    CGFloat yLocation = location.y;
    yLocation = MAX(0, yLocation);
    
    CGFloat maxBottom = self.bounds.size.height;
    NSLog(@"y: %f max-bottom: %f", yLocation, maxBottom);    
    CGFloat yControl = MIN(yLocation, maxBottom);
    return yControl;
}

- (void)adjustSmile:(UIPanGestureRecognizer*)panGestureRecognizer {
    CGPoint location = [panGestureRecognizer locationInView:self];

    CGFloat yControl = [self clipVertical:location];
    NSLog(@"Final y: %f", yControl);
    
//    controlPoint = CGPointMake(controlPoint.x, yControl);

    // Ask the data source instance to set its happiness value to the yControl value
    if ([self.smileDataSource respondsToSelector:@selector(setHappinessLevel:forSmileView:)]) {
        [self.smileDataSource setHappinessLevel:yControl forSmileView:self];
    }
    [self setNeedsDisplay];
}

@end
