//
//  Singleton.m
//  MySecondApp
//
//  Created by Kojiro Umezaki on 4/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Singleton.h"

#import "AQPlayer_SF.h"
#import "AQPlayer_Synth.h"

@implementation Singleton

-(id)init
{
    self = [super init];
    
    NSLog(@"Initializing Singleton object.");
    
    aqp = [[AQPlayer_SF alloc] init];
    
    return self;
}

-(void)dealloc
{
}

@end
