//
//  MyView.m
//  Music147_2012
//
//  Created by Kojiro Umezaki on 5/2/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "MyView.h"

#import "AQPlayer.h"
#import "Singleton.h"

extern AQPlayer *aqp;
extern Singleton* gSing;

@implementation MyView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)awakeFromNib
{
    [button1 setTitle:@"1" forState:UIControlStateNormal];
    [button2 setTitle:@"2" forState:UIControlStateNormal];
    [button3 setTitle:@"3" forState:UIControlStateNormal];
    [button4 setTitle:@"4" forState:UIControlStateNormal];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(IBAction)toggleVoice0:(id)sender
{
    NSLog(@"toggleVoice0");
    [aqp voiceToggle:0];
}

-(IBAction)toggleVoice1:(id)sender
{
    NSLog(@"toggleVoice1");
    [aqp voiceToggle:1];
}

-(IBAction)toggleVoice2:(id)sender
{
    NSLog(@"toggleVoice2");
    [aqp voiceToggle:2];
}

-(IBAction)toggleVoice3:(id)sender
{
    NSLog(@"toggleVoice3");
    [aqp voiceToggle:3];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%d",touches.count);
    for (UITouch* t in touches)
    {
        CGPoint pt = [t locationInView:self];
//        NSLog(@"%lf,%lf,%lf,%lf",pt.x,pt.y,self.bounds.size.width,self.bounds.size.height);
        NSLog(@"%lf,%lf",pt.x/self.bounds.size.width,pt.y/self.bounds.size.height);
        [gSing touchX:pt.x/self.bounds.size.width];
        touch = t;
    }
    NSLog(@"%lf",event.timestamp);
    [self setNeedsDisplay];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%d",touches.count);
    for (UITouch* t in touches)
    {
        CGPoint pt = [t locationInView:self];
//        NSLog(@"%lf,%lf,%lf,%lf",pt.x,pt.y,self.bounds.size.width,self.bounds.size.height);
        NSLog(@"%lf,%lf",pt.x/self.bounds.size.width,pt.y/self.bounds.size.height);
        [gSing touchX:pt.x/self.bounds.size.width];
        touch = t;
    }
    NSLog(@"%lf",event.timestamp);
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"%d",touches.count);
    for (UITouch* t in touches)
    {
        CGPoint pt = [t locationInView:self];
//        NSLog(@"%lf,%lf,%lf,%lf",pt.x,pt.y,self.bounds.size.width,self.bounds.size.height);
        NSLog(@"%lf,%lf",pt.x/self.bounds.size.width,pt.y/self.bounds.size.height);
        [gSing touchX:pt.x/self.bounds.size.width];
        touch = nil;
    }
    NSLog(@"%lf",event.timestamp);
    [self setNeedsDisplay];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
}

- (void)drawRect:(CGRect)draw_rect
{
    if (touch == nil) return; /* guard */
    
    UIColor *rectColor = [UIColor greenColor]; [rectColor set];
    
    CGPoint pt = [touch locationInView:self];
    
    UIRectFill(CGRectMake(pt.x-50., pt.y-50., 100.0, 100.0));
}

@end
