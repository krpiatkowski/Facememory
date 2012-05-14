//
//  ImageService.m
//  Facememory
//
//  Created by Henrik Stokbro Andersen on 5/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ImageService.h"

@implementation ImageService

- (void)saveImage:(UIImage *)image forProfile:(Profile *)profile
{
    NSURL *url = [self createFileUrl:[NSString stringWithFormat:@"%d", profile.uid]];
    NSData *data = UIImageJPEGRepresentation(image, 1.0);

    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager createFileAtPath:[url path] contents:data attributes:nil];
}

- (UIImage *)getImageFromProfile:(Profile *)profile
{
    NSURL *url = [self createFileUrl:[NSString stringWithFormat:@"%d", profile.uid]];

    return [UIImage imageWithContentsOfFile:[url path]];
}

- (NSURL *)createFileUrl: (NSString *)fileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths lastObject];
	NSString *filePath = [NSString stringWithFormat:@"%@/%@.jpg", documentsDirectory, fileName];
    NSURL *url = [NSURL fileURLWithPath:filePath];
    
    return url;
}


@end
