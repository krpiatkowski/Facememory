//
//  SoundViewController.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundViewController.h"

@interface SoundViewController ()

@end

@implementation SoundViewController
@synthesize recordButton;
@synthesize redoButton;
@synthesize confirmButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setRecordButton:nil];
    [self setRedoButton:nil];
    [self setConfirmButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (IBAction)didToggleRecord:(id)sender 
{
    if(!self.recordButton.selected) {
        [self.recordButton setSelected:YES];
    } else {
        self.recordButton.hidden = YES;
        self.redoButton.hidden = NO;
        self.confirmButton.hidden = NO;
        [self.recordButton setSelected:NO];      
    }
}

- (IBAction)didConfirm:(id)sender
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)didRedo:(id)sender 
{
    self.recordButton.hidden = NO;
    self.redoButton.hidden = YES;
    self.confirmButton.hidden = YES;
}
@end
