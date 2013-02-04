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

@interface SCSHappinessViewController ()

@property (weak, nonatomic) IBOutlet SCSCircleView *faceView;
@property (weak, nonatomic) IBOutlet UILabel *happinessIndex;
@property (weak, nonatomic) IBOutlet SCSSmileView *smileView;

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

@end
