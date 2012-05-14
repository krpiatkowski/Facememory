//
//  ImageService.h
//  Facememory
//
//  Created by Henrik Stokbro Andersen on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Profile.h"

@interface ImageService : NSObject
- (void)saveImage:(UIImage *)image forProfile:(Profile *)profile;
- (UIImage *)getImageFromProfile:(Profile *)profile; // returns nil if the file does not exist
@end
