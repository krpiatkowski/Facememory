//
//  ProfileService.h
//  Facememory
//
//  Created by Krzysztof Piatkowski on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"

@interface ProfileService : NSObject
@property (strong, readonly, nonatomic) Profile *currentProfile;
@property (strong, readonly, nonatomic) NSArray *profiles;
//Creates a new profile and places it in currentProfile
-(void)createProfile;

//Flushes the profile into profiles and removes it from currentProfile
-(void)saveProfile;
@end
