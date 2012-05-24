//
//  Voice_Wavetable.m
//  Music147_2012
//
//  Created by Kojiro Umezaki on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Voice_Wavetable.h"

#import "AQPlayer.h"

@implementation Voice_Wavetable

-(id)init
{
    self = [super init];
    
    /* for each harmonic (outer loop) */
    for (UInt16 k = 1; k <= 16; k++)
    {
        /* add to the wavetable the harmonic, a sinusoid that is an integer multiple of the fundamental frequency (inner loop) */
        for (UInt16 i = 0; i < kWaveTableSize; i++)
        {
            const Float64 t = (Float64)i / kWaveTableSize * k;
            table[i] += sin(t * 2 * M_PI) / k;
        }
    }

    /* find maximum value in table */
    Float64 max = 0.;
    for (UInt16 i = 0; i < kWaveTableSize; i++)
    {
        if (fabs(table[i]) > max)
            max = fabs(table[i]);
    }
    NSLog(@"MAX: %f",max);
    
    /* scale table by maximum value (i.e. normalize) */
    for (UInt16 i = 0; i < kWaveTableSize; i++)
    {
        table[i] = table[i] / max;
        NSLog(@"%d %f",i,table[i]);
    }

    return self;
}

-(void)fillSampleBuffer:(Float64*)buffer:(UInt32)num_samples
{
    deltaTheta = freq / kSR;
    
	for (SInt32 n = 0; n < num_samples; n++)
	{
        /* i is the floating point index into the wavetable */
        Float64 i = theta * kWaveTableSize;
        
        /* i0 is the "lower" index; i1 is the "higher" index */
        SInt32 i0 = (SInt32)i % kWaveTableSize;
        SInt32 i1 = (i0 + 1) % kWaveTableSize;
        
        /* k is the fractional amount between i0 and i1 */
        Float64 k = i - (SInt32)i;
        
        /* s0 and s1 are table values at i0 and i1, respectively */
        Float64 s0 = table[i0];
        Float64 s1 = table[i1];
        
        /* s is the interpolated table value */
        Float64 s = s0 + (s1 - s0) * k;

        /* update the envelope by one sample */
        [env update:1];
        
		buffer[n] += amp * env.output * s;

		theta += deltaTheta;
	}
}

@end
