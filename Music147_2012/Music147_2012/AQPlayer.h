//
//  AQPlayer.h
//  MInC
//
//  Created by Kojiro Umezaki on 4/4/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <AudioToolbox/AudioToolbox.h>
#import <Foundation/Foundation.h>

/* number of buffers used by system */
#define kNumberBuffers	3

/* sample rate */
#define kSR				22050.

@interface AQPlayer : NSObject {

	AudioQueueRef				queue;
	AudioQueueBufferRef			buffers[kNumberBuffers];
	AudioStreamBasicDescription	dataFormat;
}

-(void)setup;

-(OSStatus)start;
-(OSStatus)stop;

-(void)fillAudioBuffer:(Float64*)buffer:(UInt32)num_samples;

@end
