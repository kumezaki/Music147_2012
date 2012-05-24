//
//  Envelope.h
//  Music147
//
//  Created by Kojiro Umezaki on 2/9/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface Envelope : NSObject {

    Float64 attack;     /* seconds */
    Float64 release;    /* seconds */

    Float64 delta_attack;
    Float64 delta_release;

    Float64 delta;

    Float64 output;     /* 0.0 ... 1.0 */
}

@property (nonatomic,readwrite) Float64 attack;
@property (nonatomic,readwrite) Float64 release;

@property (nonatomic,readonly) Float64 output;

-(void)update:(UInt32)num_samples;
-(void)on;
-(void)off;

@end
