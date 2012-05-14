//
//  Services.h
//  Facememory
//
//  Created by Krzysztof Piatkowski on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ImageService.h"
#import "SoundService.h"
#import "ProfileService.h"
@interface Services : NSObject
+ (ProfileService *)profileService;
+ (ImageService *)imageService;
+ (SoundService *)soundService;
@end
