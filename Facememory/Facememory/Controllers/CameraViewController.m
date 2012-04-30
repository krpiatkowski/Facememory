//
//  ViewController.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()

@end

@implementation CameraViewController
@synthesize snapButton;
@synthesize redoButton;
@synthesize confirmButton;
@synthesize imagePicker;
@synthesize overlayView;
@synthesize previewImage;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)presentCamera
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.showsCameraControls = NO;
        if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
            self.imagePicker.cameraDevice = UIImagePickerControllerCameraDeviceFront;
        }
        self.imagePicker.cameraOverlayView = self.overlayView;
        
        self.imagePicker.delegate = self;
        
        [self presentModalViewController:self.imagePicker animated:NO];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self presentCamera];
}

- (void)viewDidUnload
{
    [self setRedoButton:nil];
    [self setConfirmButton:nil];
    [self setSnapButton:nil];
    self.overlayView = nil;
    [self setPreviewImage:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)didTakePicture:(id)sender 
{
    [self.imagePicker takePicture];
    
    self.snapButton.hidden = YES;
    self.redoButton.hidden = NO;
    self.confirmButton.hidden = NO;
}

- (IBAction)didRedo:(id)sender 
{
    [self presentCamera];

    self.snapButton.hidden = NO;
    self.redoButton.hidden = YES;
    self.confirmButton.hidden = YES;    
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.previewImage.image = [info objectForKey:UIImagePickerControllerOriginalImage];
    self.previewImage.image = [UIImage imageWithCGImage:self.previewImage.image.CGImage scale:1.0f orientation:UIImageOrientationLeftMirrored];
    
    
    [self dismissModalViewControllerAnimated:YES];
}
@end
