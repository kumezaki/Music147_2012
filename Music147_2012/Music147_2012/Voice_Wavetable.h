//
//  Voice_Wavetable.h
//  Music147_2012
//
//  Created by Kojiro Umezaki on 5/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Voice_Synth.h"

#define kWaveTableSize  1024

@interface Voice_Wavetable : Voice_Synth {
    Float64 table[kWaveTableSize];
}

-(void)fillSampleBuffer:(Float64*)buffer:(UInt32)num_samples;

@end
