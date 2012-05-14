//
//  Services.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Services.h"

@implementation Services
static ImageService *sharedImageService;
static SoundService *sharedSoundService;
static ProfileService *sharedProfileService;

+ (SoundService *)soundService
{
    if(!sharedSoundService){
        sharedSoundService = [[SoundService alloc] init];
    }
    
    return sharedSoundService;
}
+ (ImageService *)imageService
{
    if(!sharedImageService){
        sharedImageService = [[ImageService alloc] init];
    }
    
    return sharedImageService;
}
+ (ProfileService *)profileService
{
    if(!sharedProfileService){
        sharedProfileService = [[ProfileService alloc] init];
    }
    return sharedProfileService;
}

@end
