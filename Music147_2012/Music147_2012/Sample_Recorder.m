//
//  Sample_Recorder.m
//  Music147_2012
//
//  Created by Kojiro Umezaki on 5/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Sample_Recorder.h"

#import "AQRecorder.h"

extern AQRecorder *aqr;

@implementation Sample_Recorder

-(void)fillSampleBuffer:(Float64*)buffer:(UInt32)num_buf_samples
{
    for (UInt32 i = 0; i < num_buf_samples; i++)
        buffer[i] += aqr->audioBuffer[i+readPos];
    
    readPos += num_buf_samples;
}

@end
