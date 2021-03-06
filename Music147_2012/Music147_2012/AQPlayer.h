//
//  AQPlayer.h
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

#import "Effect.h"
#import "Voice.h"

/* number of buffers used by system */
#define kNumberBuffers	3

/* number of voices */
#define kNumberVoices   4

/* number of effects */
#define kNumberEffects  8

/* sample rate */
#define kSR				22050.

@interface AQPlayer : NSObject {

	AudioQueueRef				queue;
	AudioQueueBufferRef			buffers[kNumberBuffers];
	AudioStreamBasicDescription	dataFormat;
    
    Voice* voices[kNumberVoices];
    
    Effect* effect[kNumberEffects];
}

-(void)setup;

-(OSStatus)start;
-(OSStatus)stop;

-(void)resetStartPos;

-(void)fillAudioBuffer:(Float64*)buffer:(UInt32)num_samples;

-(Voice*)getFreeVoice;

-(void)voiceToggle:(UInt16)pos;

-(void)reportElapsedTime:(Float64)elapsed_time;

-(void)filterFreq:(Float64)freq;

@end
