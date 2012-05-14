
#import "CameraViewController.h"

@interface CameraViewController ()

@property (nonatomic) UIImagePickerControllerCameraDevice cameraDevice;

@end


@implementation CameraViewController

@synthesize snapButton;
@synthesize redoButton;
@synthesize confirmButton;
@synthesize imagePicker;
@synthesize overlayView;
@synthesize previewImage;
@synthesize toggleCamButton;
@synthesize cameraDevice;

- (void)presentCamera
{
    self.imagePicker = [[UIImagePickerController alloc] init];
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        self.imagePicker.showsCameraControls = NO;
        self.imagePicker.cameraDevice = self.cameraDevice;
        self.imagePicker.delegate = self;
        
        [self presentModalViewController:self.imagePicker animated:NO];

        // Inserting the overlay after presentModal is smoother
        self.imagePicker.cameraOverlayView = self.overlayView;
    } else {
        self.snapButton.hidden = YES;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Setup default cam and the toggleButton
    self.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    if([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
        self.toggleCamButton.hidden = NO;
        self.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    
    [self presentCamera];
}

- (void)viewDidUnload
{
    [self setRedoButton:nil];
    [self setConfirmButton:nil];
    [self setSnapButton:nil];
    self.overlayView = nil;
    [self setPreviewImage:nil];
    [self setToggleCamButton:nil];
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
}

- (IBAction)didRedo:(id)sender 
{
    [self presentCamera];
}

- (IBAction)didToggleCam:(id)sender {
    if (self.cameraDevice == UIImagePickerControllerCameraDeviceFront) {
        self.cameraDevice = UIImagePickerControllerCameraDeviceRear;
    } else {
        self.cameraDevice = UIImagePickerControllerCameraDeviceFront;
    }
    
    self.imagePicker.cameraDevice = self.cameraDevice;
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Getting picture, handling orientation
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    if(self.cameraDevice == UIImagePickerControllerCameraDeviceFront) {
        image = [UIImage imageWithCGImage:image.CGImage scale:1.0f orientation:UIImageOrientationLeftMirrored];
    }

    self.previewImage.image = image;
    
    [self dismissModalViewControllerAnimated:NO];
}
@end
