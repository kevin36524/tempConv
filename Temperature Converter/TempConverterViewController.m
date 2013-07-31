//
//  TempConverterViewController.m
//  Temperature Converter
//
//  Created by Kevin Patel on 7/31/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "TempConverterViewController.h"

@interface TempConverterViewController ()

@property(nonatomic,weak) UITextField *lastModifiedField; // my Model

- (void) endEditing;
- (float) getTemperatureForValue:(float)val inUnits:(NSString *)unitName;

@end

@implementation TempConverterViewController

@synthesize lastModifiedField = _lastModifiedField;
@synthesize farTextField = _farTextField;
@synthesize celTextField = _celTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.title = @"Temperature";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self convertTemp]; // load time calibration
}


#pragma mark - private Methods
- (void) endEditing {
    [self.view endEditing:YES];
}

- (float) getTemperatureForValue:(float)val inUnits:(NSString *)unitName {
    float result = 0;
    if ([unitName isEqual:@"farenheit"]) {
        result = val * 1.8 + 32;
    } else {
        result = (val - 32) / 1.8;
    }
    return result;
}

#pragma mark - delegates

// end editing on tapping somewhere else
- (IBAction)tappedSomewhere:(UIGestureRecognizer *)sender {
    [self endEditing];
}

// convert button pressed
- (IBAction)convertTemp {
    [self endEditing]; // this will update my Model
    float result = 0;
    float val = [self.lastModifiedField.text floatValue];
    if ([self.lastModifiedField isEqual:self.farTextField]) {
        result = [self getTemperatureForValue:val inUnits:@"celcius"];
        self.celTextField.text = [NSString stringWithFormat:@"%g",result];
    } else {
        result = [self getTemperatureForValue:val inUnits:@"farenheit"];
        self.farTextField.text = [NSString stringWithFormat:@"%g",result];
    }
}

// update Model
- (IBAction)onEditEnd:(UITextField *)sender {
    self.lastModifiedField = sender;
}


@end
