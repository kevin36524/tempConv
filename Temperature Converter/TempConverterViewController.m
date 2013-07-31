//
//  TempConverterViewController.m
//  Temperature Converter
//
//  Created by Kevin Patel on 7/31/13.
//  Copyright (c) 2013 Kevin Patel. All rights reserved.
//

#import "TempConverterViewController.h"

@interface TempConverterViewController ()

- (void) endEditing;

@end

@implementation TempConverterViewController

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


#pragma mark - delegates

- (IBAction)tappedSomewhere:(UIGestureRecognizer *)sender {
    [self endEditing];
}

- (IBAction)convertTemp {
    [self endEditing];
    NSLog(@"I will be converting now");
}

- (IBAction)onEditEnd:(UITextField *)sender {
    NSLog(@"Editing is ended %@", sender.restorationIdentifier);
}


@end
