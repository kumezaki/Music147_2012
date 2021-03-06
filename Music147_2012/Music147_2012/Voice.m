//
//  Voice.m
//  Music147_2012
//
//  Created by Kojiro Umezaki on 4/25/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Voice.h"

@implementation Voice

@synthesize amp;
@synthesize env;

-(id)init
{
    self = [super init];
    
    amp = 0.;
    
	env = [[Envelope alloc] init];
	env.attack = 0.05;
	env.release = 0.05;

    return self;
}

-(void)fillSampleBuffer:(Float64*)buffer:(UInt32)num_samples
{
}

-(BOOL)isOn
{
    return env.output > 0.;
}

-(void)on
{
    [env on];
}

-(void)off
{
    [env off];
}

@end
