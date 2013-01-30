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
@property (weak, nonatomic) IBOutlet SCSCircleView *circleView;

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
- (IBAction)adjustScale:(UISlider *)sender {
    CGFloat scaleValue = sender.value;
    NSLog(@"Slider changed to %f", scaleValue);
    self.circleView.transform = CGAffineTransformMakeScale(scaleValue, scaleValue);
}

@end
