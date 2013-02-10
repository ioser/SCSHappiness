//
//  SCSSmileView.h
//  Happiness
//
//  Created by Richard E Millet on 1/29/13.
//  Copyright (c) 2013 Richard Millet. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SCSSmileViewDataSource;  // Forward declare the protocol

@interface SCSSmileView : UIView {
}

@property (weak, nonatomic) IBOutlet id<SCSSmileViewDataSource>smileDataSource;

- (void)adjustSmile:(UIPanGestureRecognizer*)panGestureRecognizer;

@end

@protocol SCSSmileViewDataSource <NSObject>

- (CGFloat)happinessLevelForSmileView:(SCSSmileView *)smileView;

@optional

- (void)setHappinessLevel:(CGFloat)happinessLevel
             forSmileView:(SCSSmileView *)smileView;

- (void)setHappinessPercentage:(CGFloat)happinessPercentage
                  forSmileView:(SCSSmileView *)smileView;

@end
