//
//  SoundService.m
//  Facememory
//
//  Created by Krzysztof Piatkowski on 09/05/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioServices.h>

#import "SoundService.h"

@interface SoundService()
@property (strong, nonatomic) AVAudioRecorder *recoder;
@property (strong, nonatomic) AVAudioPlayer *player;
@end

@implementation SoundService
@synthesize recoder;
@synthesize player;
-(id)init
{
    self = [super init];
    if(self){
        [self setupSession];
    }
    return self;
}

- (void)recordForProfile: (Profile *)profile
{
    NSURL *url = [self createFileUrl:[NSString stringWithFormat:@"%d", profile.uid]];
    self.recoder = [self createRecorder:url];
    [self.recoder record];
}

- (void)stop
{
    [self.recoder stop];
}

- (void)playForProfile:(Profile *)profile
{
    NSURL *url = [self createFileUrl:[NSString stringWithFormat:@"%d", profile.uid]];

    NSError *error;
	self.player = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:&error];
	self.player.numberOfLoops = 0;
    self.player.volume = 1.0f;

    //Lets play the sound on the main speaker and not the mic
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    
	if (self.player == nil) {
        NSLog(@"%@", error);
    } else {
		[self.player play];
    }
}

#pragma mark - Sound recording helpers
- (void)setupSession
{   
    NSError *error;
    AVAudioSession * audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error: &error];
    
    if(error){
        NSLog(@"%@", error);
    }
    
    [audioSession setActive:YES error: &error];
    
    if(error){
        NSLog(@"%@", error);
    }
}


- (AVAudioRecorder *)createRecorder:(NSURL *)url
{    
    NSError *error;    
    AVAudioRecorder *recorder = [[AVAudioRecorder alloc] initWithURL:url settings:[self recordSettings] error:&error];    
    if(error){
        NSLog(@"%@", error);
    }    
    return recorder;
}

- (NSDictionary *)recordSettings
{
	NSDictionary *settings = [NSDictionary dictionaryWithObjectsAndKeys:
							  [NSNumber numberWithFloat: 44100.0],                 AVSampleRateKey,
							  [NSNumber numberWithInt: kAudioFormatAppleLossless], AVFormatIDKey,
							  [NSNumber numberWithInt: 1],                         AVNumberOfChannelsKey,
							  [NSNumber numberWithInt: AVAudioQualityMax],         AVEncoderAudioQualityKey,
							  nil];
    return settings;
}

- (NSURL *)createFileUrl: (NSString *)fileName
{
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentsDirectory = [paths objectAtIndex:0];
	NSString *recorderFilePath = [NSString stringWithFormat:@"%@/%@.caf", documentsDirectory, fileName];
    NSURL *url = [NSURL fileURLWithPath:recorderFilePath];
    
    return url;
}

@end
