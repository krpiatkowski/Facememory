//
//  ViewController.h
//  Facememory
//
//  Created by Krzysztof Piatkowski on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
// 

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *snapButton;
@property (weak, nonatomic) IBOutlet UIButton *toggleCamButton;
@property (weak, nonatomic) IBOutlet UIButton *redoButton;
@property (weak, nonatomic) IBOutlet UIButton *confirmButton;
@property (strong, nonatomic) IBOutlet UIView *overlayView;
@property (weak, nonatomic) IBOutlet UIImageView *previewImage;

@property (strong, nonatomic) UIImagePickerController *imagePicker;

- (IBAction)didTakePicture:(id)sender;
- (IBAction)didRedo:(id)sender;
- (IBAction)didToggleCam:(id)sender;
- (IBAction)didFinishSelectingPicture:(id)sender;
@end
