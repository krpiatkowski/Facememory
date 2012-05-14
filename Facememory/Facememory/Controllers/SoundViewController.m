//
//  SoundViewController.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 23/04/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SoundViewController.h"
#import "Services.h"

@implementation SoundViewController
@synthesize recordButton;
@synthesize redoButton;
@synthesize confirmButton;
@synthesize playButton;

#pragma mark - Lifecycle
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
}

- (void)viewDidUnload
{
    [self setRecordButton:nil];
    [self setRedoButton:nil];
    [self setConfirmButton:nil];
    [self setPlayButton:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - IBActions

- (IBAction)didToggleRecord:(id)sender 
{
    if(!self.recordButton.selected) {
        [self.recordButton setSelected:YES];
        
//        [[Services profileService] createProfile]; // This line should go. Camera creates the profile
        [[Services soundService] recordForProfile:[Services profileService].currentProfile];
        
    } else {
        [[Services soundService] stop];
        self.playButton.hidden = NO;
        self.recordButton.hidden = YES;
        self.redoButton.hidden = NO;
        self.confirmButton.hidden = NO;
        [self.recordButton setSelected:NO];
    }
}

- (IBAction)didConfirm:(id)sender
{
    [[Services profileService] saveProfile];
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (IBAction)didRedo:(id)sender 
{
    self.playButton.hidden = YES;
    self.recordButton.hidden = NO;
    self.redoButton.hidden = YES;
    self.confirmButton.hidden = YES;
}

- (IBAction)didTapPlay:(id)sender {
    [[Services soundService] playForProfile:[Services profileService].currentProfile];
}
@end