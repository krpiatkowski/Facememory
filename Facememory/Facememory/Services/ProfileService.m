//
//  ProfileService.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ProfileService.h"

@implementation ProfileService
@synthesize currentProfile = _currentProfile;
@synthesize profiles = _profiles;

- (id)init
{
    self = [super init];
    if (self) {
        _profiles = [NSMutableArray array];
    }
    return self;
}
- (void)createProfile
{
    _currentProfile = [[Profile alloc] init];

    //implict cast to int
    _currentProfile.uid = [[NSDate date] timeIntervalSince1970];
}

- (void)saveProfile
{
    NSMutableArray *mProfiles = (NSMutableArray *)self.profiles;
    [mProfiles addObject:mProfiles];
    _currentProfile = nil;
}
@end