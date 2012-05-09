//
//  SoundViewController.h
//  Facememory
//
//  Created by Krzysztof Piatkowski on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SoundViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) IBOutlet UIButton *redoButton;
@property (strong, nonatomic) IBOutlet UIButton *confirmButton;
@property (strong, nonatomic) IBOutlet UIButton *playButton;
- (IBAction)didToggleRecord:(id)sender;
- (IBAction)didConfirm:(id)sender;
- (IBAction)didRedo:(id)sender;
- (IBAction)didTapPlay:(id)sender;
@end
