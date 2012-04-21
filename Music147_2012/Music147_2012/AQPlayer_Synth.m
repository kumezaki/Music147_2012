//
//  AQPlayer_Synth.m
//  MySecondApp
//
//  Created by Kojiro Umezaki on 4/18/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AQPlayer_Synth.h"

@implementation AQPlayer_Synth

-(id)init
{
    self = [super init];

    theta = 0.;
    deltaTheta = 440./kSR;
    
    return self;
}

-(void)fillAudioBuffer:(Float64*)buffer:(UInt32)num_samples
{
	Float64 amp = 0.5;
	for (SInt32 i = 0; i < num_samples; i++)
	{
		buffer[i] += amp * sin(theta * 2 * M_PI);
		theta += deltaTheta;
	}

}

@end
