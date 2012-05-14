//
//  ProfilesViewController.m
//  Facememory
//
//  Created by Henrik Stokbro Andersen on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfilesViewController.h"
#import "Services.h"


@interface ProfilesViewController ()

@end

@implementation ProfilesViewController
@synthesize imagesView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    
    // JUST FOR TESTING PURPOSES.
    for (Profile *profile in [[Services profileService] profiles]) {
        self.imagesView.image = [[Services imageService] getImageFromProfile:profile];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setImagesView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
