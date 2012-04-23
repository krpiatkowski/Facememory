//
//  ViewController.h
//  Facememory
//
//  Created by Krzysztof Piatkowski on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CameraViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIButton *snapButton;
@property (strong, nonatomic) IBOutlet UIButton *redoButton;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
- (IBAction)didTakePicture:(id)sender;
- (IBAction)didRedo:(id)sender;
@end
