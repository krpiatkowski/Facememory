//
//  ViewController.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()
@property (strong, nonatomic) UIImagePickerController *imagePicker;
@end

@implementation CameraViewController
@synthesize cameraView;
@synthesize snapButton;
@synthesize redoButton;
@synthesize confirmButton;
@synthesize imagePicker;

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
    [self.cameraView addSubview:self.imagePicker.view];
    
}

- (void)viewDidUnload
{
    [self setRedoButton:nil];
    [self setConfirmButton:nil];
    [self setSnapButton:nil];
    [self setCameraView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)didTakePicture:(id)sender 
{
    self.snapButton.hidden = YES;
    self.redoButton.hidden = NO;
    self.confirmButton.hidden = NO;
}

- (IBAction)didRedo:(id)sender 
{
    self.snapButton.hidden = NO;
    self.redoButton.hidden = YES;
    self.confirmButton.hidden = YES;    
}
@end
