//
//  SoundService.h
//  Facememory
//
//  Created by Krzysztof Piatkowski on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import "Profile.h"

@interface SoundService : NSObject
- (void)recordForProfile:(Profile *)profile;
- (void)stop;
- (void)playForProfile:(Profile *)profile;
@end
