//
//  SCSViewController.m
//  Happiness
//
//  Created by Richard E Millet on 1/27/13.
//  Copyright (c) 2013 Richard Millet. All rights reserved.
//

#import "SCSHappinessViewController.h"
#import "SCSCircleView.h"
#import "SCSSmileView.h"
#import "SCSHappiness.h"

@interface SCSHappinessViewController ()<SCSSmileViewDataSource>

@property (weak, nonatomic) IBOutlet SCSCircleView *faceView;
@property (weak, nonatomic) IBOutlet UILabel *happinessIndex;
@property (weak, nonatomic) IBOutlet SCSSmileView *smileView;
@property (strong, nonatomic) SCSHappiness *happinessModel;

@end

@implementation SCSHappinessViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)adjustScale:(UIPinchGestureRecognizer *)sender {
    CGFloat scaleValue = MIN(sender.scale, 1);
    NSLog(@"Pinch gesture scale changed to %f", scaleValue);
    self.faceView.transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
    self.happinessIndex.text = [NSString stringWithFormat: @"%.2f", scaleValue];
}

- (IBAction)adjustSmile:(UIPanGestureRecognizer*)sender {
    [self.smileView adjustSmile:sender];
}

- (SCSHappiness *)happinessModel {
    if (_happinessModel == nil) {
        _happinessModel = [[SCSHappiness alloc] init];
    }
    return _happinessModel;
}

//
// SCSSmileViewDataSource - Implementation of protocol
//

- (CGFloat)happinessLevelForSmileView:(SCSSmileView *)smileView {
    CGFloat height = smileView.frame.size.height;
    CGFloat happinessLevel = (self.happinessModel.happinessPercentage / 100) * height;
    return happinessLevel;
}

- (void)setHappinessLevel:(CGFloat)happinessLevel
             forSmileView:(SCSSmileView *)smileView {
    CGFloat height = smileView.frame.size.height;
    CGFloat happinessPercentage = 100 * (happinessLevel / height);
    self.happinessModel.happinessPercentage = happinessPercentage;
}

@end
