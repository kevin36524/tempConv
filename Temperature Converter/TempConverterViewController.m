//
//  TempConverterViewController.m
//  Temperature Converter
//
//  Created by Kevin Patel on 7/31/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "TempConverterViewController.h"

@interface TempConverterViewController ()
@property(nonatomic,weak) UITextField *lastModifiedField;
- (void) endEditing;

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

- (IBAction)tappedSomewhere:(UIGestureRecognizer *)sender {
    [self endEditing];
}

- (IBAction)convertTemp {
    float result = 0;
    [self endEditing];
    float val = [self.lastModifiedField.text floatValue];
    if ([self.lastModifiedField isEqual:self.farTextField]) {
        result = [self getTemperatureForValue:val inUnits:@"celcius"];
        self.celTextField.text = [NSString stringWithFormat:@"%g",result];
    } else {
        result = [self getTemperatureForValue:val inUnits:@"farenheit"];
        self.farTextField.text = [NSString stringWithFormat:@"%g",result];
    }
}

- (IBAction)onEditEnd:(UITextField *)sender {
    self.lastModifiedField = sender;
}


@end
