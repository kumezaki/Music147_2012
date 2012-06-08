//
//  Singleton.m
//  MySecondApp
//
//  Created by Kojiro Umezaki on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Singleton.h"

#import "AQPlayer_Samp.h"
#import "AQPlayer_Synth.h"

@implementation Singleton

-(id)init
{
    self = [super init];
    
    NSLog(@"Initializing Singleton object.");
    
    aqp = [[AQPlayer_Samp alloc] init];
    aqr = [[AQRecorder alloc] init];
    
    q = [[Sequencer alloc] init];
    [q setBpm:133];
    
    /* this is temporary just to test the new sequencer code */
    Sequence* seq = [[Sequence alloc] init];
    [q setSeq:seq];
    
//    [[UIAccelerometer sharedAccelerometer] setDelegate:self];
    
    return self;
}

-(void)dealloc
{
}

-(void)updateTime:(Float64)elapsed_time
{
    [q updateTime:elapsed_time];
}

-(void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
    NSLog(@"Singleton %f %f %f",acceleration.x,acceleration.y,acceleration.z);
}

-(void)touchXVal:(Float64)val
{
    [aqp filterFreq:val*5000.];
}

-(void)sliderVal:(Float64)val
{
    [aqp filterFreq:val*5000.];
}

@end
