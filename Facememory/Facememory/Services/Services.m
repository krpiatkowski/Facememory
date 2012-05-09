//
//  Services.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Services.h"


@implementation Services
static SoundService *sharedSoundService;
static ProfileService *sharedProfileService;

+ (SoundService *)soundService
{
    if(!sharedSoundService){
        sharedSoundService = [[SoundService alloc] init];
    }
    
    return sharedSoundService;
}
+ (ProfileService *)profileService
{
    if(!sharedProfileService){
        sharedProfileService = [[ProfileService alloc] init];
    }
    return sharedProfileService;
}

@end
